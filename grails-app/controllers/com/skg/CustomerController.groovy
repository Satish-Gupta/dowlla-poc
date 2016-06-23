package com.skg

import com.sun.jersey.multipart.FormDataMultiPart
import io.swagger.client.ApiClient
import io.swagger.client.ApiException;
import io.swagger.client.api.*;
import io.swagger.client.model.*;

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CustomerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        print "===================="
        print Customer.list(params)
        respond Customer.list(params), model: [customerInstanceCount: Customer.count()]
    }

    def show(Customer customerInstance) {
        log.info "$actionName"
        ApiClient apiClient = session.apiClient

        log.debug "$actionName payment processor id $customerInstance.paymentProcessorId"
        CustomersApi customersApi = new CustomersApi()
        customersApi.apiClient = apiClient
        IavToken iavToken = customersApi.getCustomerIavToken(customerInstance.paymentProcessorId)
        log.info "$actionName iavToken $iavToken"

        log.info "$actionName response:$response"
        respond customerInstance,model: [iavToken:iavToken.token]
    }

    def create() {
        respond new Customer(params)
    }

    @Transactional
    def save(Customer customerInstance) {
        log.debug "#$actionName params:[$params]"
        if (customerInstance == null) {
            notFound()
            return
        }

//        if (customerInstance.hasErrors()) {
//            respond customerInstance.errors, view: 'create'
//            return
//        }
        ApiClient apiClient = session.apiClient

        CustomersApi c = new CustomersApi(apiClient);
        CreateCustomer customer = new CreateCustomer()
        bindData(customer,customerInstance)
        Unit$ response = c.create(customer)
        log.info "$actionName response:$response"

//        session.customerResourceId = response.locationHeader
        io.swagger.client.model.Customer customer1 = c.getCustomer(response.locationHeader)
        print "$actionName customer Id :$customer1.id"
        customerInstance.paymentProcessorId = customer1.id
        customerInstance.ipAddress = "1.1.1.1"
        customerInstance.save flush: true,failOnError: true
        session.paymentProcessorId = customerInstance.paymentProcessorId
        log.info "$actionName customer created $customerInstance.email"

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])
                redirect customerInstance
            }
            '*' { respond customerInstance, [status: CREATED] }
        }
    }

    def edit(Customer customerInstance) {
        respond customerInstance
    }

    @Transactional
    def update(Customer customerInstance) {
        if (customerInstance == null) {
            notFound()
            return
        }

        if (customerInstance.hasErrors()) {
            respond customerInstance.errors, view: 'edit'
            return
        }

        customerInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Customer.label', default: 'Customer'), customerInstance.id])
                redirect customerInstance
            }
            '*' { respond customerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Customer customerInstance) {

        if (customerInstance == null) {
            notFound()
            return
        }

        customerInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Customer.label', default: 'Customer'), customerInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
