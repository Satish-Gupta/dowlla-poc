package com.skg

import io.swagger.client.ApiClient

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
        ApiClient apiClient = new ApiClient()

        respond new Transfers(params)
    }

    @Transactional
    def save(Transfers transfersInstance) {
        if (transfersInstance == null) {
            notFound()
            return
        }

        if (transfersInstance.hasErrors()) {
            respond transfersInstance.errors, view: 'create'
            return
        }

        transfersInstance.save flush: true

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
