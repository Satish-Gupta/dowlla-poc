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
        ApiClient apiClient = new ApiClient();
        apiClient.setBasePath(session.baseurl);
        apiClient.setAccessToken(session.platformAccessToken);

        FormDataMultiPart postBody = null;
print ']]]]]]'
        print session.customerResourceId.toString()
        CustomersApi customersApi = new CustomersApi()
        customersApi.apiClient = apiClient
        IavToken iavToken = customersApi.getCustomerIavToken(session.customerResourceId.toString())
        print iavToken

//        String path = "/customers/{id}/funding-sources-token".replaceAll("\\{format\\}", "json").replaceAll("\\{id\\}", apiClient.escapeString(session.customerResourceId.toString()));
//        HashMap queryParams = new HashMap();
//        HashMap headerParams = new HashMap();
//        HashMap formParams = new HashMap();
//        String[] accepts = ["application/vnd.dwolla.v1.hal+json"];
//        String accept = apiClient.selectHeaderAccept(accepts);
//        String[] contentTypes = new String[0];
//        String contentType = apiClient.selectHeaderContentType(contentTypes);
//        if(contentType.startsWith("multipart/form-data")) {
//            boolean ex = false;
//            FormDataMultiPart mp = new FormDataMultiPart();
//            if(ex) {
//                postBody = mp;
//            }
//        }
//        String[] authNames= ["oauth2"]
//
//        try {
//            String ex1 = apiClient.invokeAPI(path, "POST", queryParams, postBody, headerParams, formParams, accept, contentType, authNames);
//            return ex1 != null?(CustomerOAuthToken)apiClient.deserialize(ex1, "", CustomerOAuthToken.class):null;
//        } catch (ApiException var14) {
//            throw var14;
//        }
//        CustomerOAuthToken customerOAuthToken = customersApi.createFundingSourcesTokenForCustomer(session.customerResourceId)
//        print customerOAuthToken

        log.info "$actionName response:$response"
        respond customerInstance,model: [iavToken:iavToken.token]
    }

    def create() {
        respond new Customer(params)
    }

    @Transactional
    def save(Customer customerInstance) {
        if (customerInstance == null) {
            notFound()
            return
        }

        if (customerInstance.hasErrors()) {
            respond customerInstance.errors, view: 'create'
            return
        }
        ApiClient a = new ApiClient();
        a.setBasePath(session.baseurl);
        a.setAccessToken(session.platformAccessToken);

        CustomersApi c = new CustomersApi(a);
        CreateCustomer customer = new CreateCustomer()
        bindData(customer,customerInstance)
        Unit$ response = c.create(customer)
        log.info "$actionName response:$response"

        session.customerResourceId = response.locationHeader
        customerInstance.save flush: true

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
