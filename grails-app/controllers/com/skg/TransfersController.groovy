package com.skg

import io.swagger.client.ApiClient
import io.swagger.client.api.CustomersApi
import io.swagger.client.api.FundingsourcesApi
import io.swagger.client.api.TransfersApi
import io.swagger.client.model.Amount
import io.swagger.client.model.FundingSourceListResponse
import io.swagger.client.model.HalLink
import io.swagger.client.model.Transfer
import io.swagger.client.model.TransferRequestBody
import io.swagger.client.model.Unit$

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TransfersController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Transfers.list(params), model: [transfersInstanceCount: Transfers.count()]
    }

    def show(Transfers transfersInstance) {
        respond transfersInstance
    }

    def create() {
        ApiClient apiClient = session.apiClient

        FundingsourcesApi fundingsourcesApi = new FundingsourcesApi()
        fundingsourcesApi.apiClient = apiClient
        FundingSourceListResponse fundingSourceListResponse = fundingsourcesApi.getCustomerFundingSources(session.paymentProcessorId)
        log.debug "#$actionName customer links $fundingSourceListResponse"
        List bankList = []
        log.debug "#$actionName customer links $fundingSourceListResponse.embedded.(funding-sources)"
        List banksFromResponse = fundingSourceListResponse.embedded.("funding-sources")
        banksFromResponse.each {
            def bank = [:]
            bank.id = it.id
            bank.type = it.type
            bank.name = it.name
            bankList << bank
        }
        print bankList[0].id
        respond new Transfers(params), model: [bankList:bankList]
    }

    @Transactional
    def save(Transfers transfersInstance) {
        print params
        if (transfersInstance == null) {
            notFound()
            return
        }

//        if (transfersInstance.hasErrors()) {
//            respond transfersInstance.errors, view: 'create'
//            return
//        }

        TransfersApi transfersApi = new TransfersApi()
        transfersApi.apiClient = session.apiClient

        TransferRequestBody transferRequestBody = new TransferRequestBody()
        HalLink halLink = new HalLink()
        halLink.href = "https://api-uat.dwolla.com/funding-sources/$params.fundingSource"
        HalLink halLinkDestination = new HalLink()
        halLinkDestination.href ="https://api-uat.dwolla.com/accounts/4cb5bac6-5bbe-44d3-a33f-bc2d3cab031b"

        transferRequestBody.links.put("source",halLink)
        transferRequestBody.links.put("destination",halLinkDestination)
        Amount amount = new Amount()
        amount.currency = "USD"
        amount.value = params.amount
        transferRequestBody.amount = amount
        print transferRequestBody
        Unit$ unit = transfersApi.create(transferRequestBody)
        print unit

//        transferRequestBody.links.put("destination",)
        transfersInstance.txnId = "kdlkdl"
        transfersInstance.created = "kdlkdl"
        transfersInstance.fee = 2
        transfersInstance.destinationId = ""
        transfersInstance.fundingSourceId = ""
        transfersInstance.currency = "USD"
        transfersInstance.status = ""
        transfersInstance.save flush: true, failOnError: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'transfers.label', default: 'Transfers'), transfersInstance.id])
                redirect transfersInstance
            }
            '*' { respond transfersInstance, [status: CREATED] }
        }
    }

    def edit(Transfers transfersInstance) {
        respond transfersInstance
    }

    @Transactional
    def update(Transfers transfersInstance) {
        if (transfersInstance == null) {
            notFound()
            return
        }

        if (transfersInstance.hasErrors()) {
            respond transfersInstance.errors, view: 'edit'
            return
        }

        transfersInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Transfers.label', default: 'Transfers'), transfersInstance.id])
                redirect transfersInstance
            }
            '*' { respond transfersInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Transfers transfersInstance) {

        if (transfersInstance == null) {
            notFound()
            return
        }

        transfersInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Transfers.label', default: 'Transfers'), transfersInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'transfers.label', default: 'Transfers'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
