package com.skg

import io.swagger.client.ApiClient
import io.swagger.client.api.CustomersApi
import io.swagger.client.api.FundingsourcesApi
import io.swagger.client.api.RootApi
import io.swagger.client.model.Amount
import io.swagger.client.model.CreateCustomer
import io.swagger.client.model.CustomerOAuthToken
import io.swagger.client.model.FundingSourceListResponse
import io.swagger.client.model.IavToken
import io.swagger.client.model.Unit$
import io.swagger.client.model.VerifyMicroDepositsRequest

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FundingSourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Customer customerInstance) {
        customerInstance= customerInstance?:chainModel?.customerInstance
        ApiClient apiClient = session.apiClient
        FundingsourcesApi fundingsourcesApi = new FundingsourcesApi()
        fundingsourcesApi.apiClient = apiClient
        print customerInstance
        FundingSourceListResponse fundingSourceListResponse = fundingsourcesApi.getCustomerFundingSources(customerInstance.paymentProcessorId)
        log.debug "#$actionName funding source response $fundingSourceListResponse"
        List bankList = []
        List banksFromResponse = fundingSourceListResponse.embedded.("funding-sources")
        banksFromResponse.each {
            def bank = [:]
            bank.id = it.id
            bank.type = it.type
            bank.name = it.name
            bank.status = it.status
            bankList << bank
        }
        print bankList[0].id
        respond new Transfers(params), model: [customerInstance:customerInstance,bankList:bankList]
    }

    def show(FundingSource fundingSourceInstance) {
        respond fundingSourceInstance
    }

    def showDeposit() {
        log.info "#$actionName showing deposit page params[${params}]"
        render view: "show-deposit", model: [bankId:params.bankId, customerId: params.customerId]
    }

    def verifyDeposit() {
        log.debug "#$actionName params:$params"

        FundingsourcesApi fundingsourcesApi = new FundingsourcesApi()
        fundingsourcesApi.apiClient = session.apiClient
        VerifyMicroDepositsRequest verifyMicroDepositsRequest = new VerifyMicroDepositsRequest()
        verifyMicroDepositsRequest.amount1 = new Amount(value: params.amount1, currency: "USD")
        verifyMicroDepositsRequest.amount2 = new Amount(value: params.amount2, currency: "USD")
        fundingsourcesApi.microDeposits(verifyMicroDepositsRequest, params.bankId)
        Customer customerInstance = Customer.get(params.customerId)
        print customerInstance
        chain action: "index", model:[customerInstance: customerInstance]
    }

    def create() {
        respond new FundingSource(params)
    }

    @Transactional
    def save(FundingSource fundingSourceInstance) {
        if (fundingSourceInstance == null) {
            notFound()
            return
        }

        if (fundingSourceInstance.hasErrors()) {
            respond fundingSourceInstance.errors, view: 'create'
            return
        }

        fundingSourceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'fundingSource.label', default: 'FundingSource'), fundingSourceInstance.id])
                redirect fundingSourceInstance
            }
            '*' { respond fundingSourceInstance, [status: CREATED] }
        }
    }

    def edit(FundingSource fundingSourceInstance) {
        respond fundingSourceInstance
    }

    @Transactional
    def update(FundingSource fundingSourceInstance) {
        if (fundingSourceInstance == null) {
            notFound()
            return
        }

        if (fundingSourceInstance.hasErrors()) {
            respond fundingSourceInstance.errors, view: 'edit'
            return
        }

        fundingSourceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'FundingSource.label', default: 'FundingSource'), fundingSourceInstance.id])
                redirect fundingSourceInstance
            }
            '*' { respond fundingSourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FundingSource fundingSourceInstance) {

        if (fundingSourceInstance == null) {
            notFound()
            return
        }

        fundingSourceInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'FundingSource.label', default: 'FundingSource'), fundingSourceInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'fundingSource.label', default: 'FundingSource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
