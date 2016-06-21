package com.skg

import io.swagger.client.ApiClient
import io.swagger.client.api.CustomersApi
import io.swagger.client.api.FundingsourcesApi
import io.swagger.client.api.RootApi
import io.swagger.client.model.CreateCustomer
import io.swagger.client.model.CustomerOAuthToken
import io.swagger.client.model.IavToken
import io.swagger.client.model.Unit$

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FundingSourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FundingSource.list(params), model: [fundingSourceInstanceCount: FundingSource.count()]
    }

    def show(FundingSource fundingSourceInstance) {
        respond fundingSourceInstance
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
