package com.yourapp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FormacaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Formacao.list(params), model:[formacaoInstanceCount: Formacao.count()]
    }

    def show(Formacao formacaoInstance) {
        respond formacaoInstance
    }

    def create() {
        respond new Formacao(params)
    }

    @Transactional
    def save(Formacao formacaoInstance) {
        if (formacaoInstance == null) {
            notFound()
            return
        }

        if (formacaoInstance.hasErrors()) {
            respond formacaoInstance.errors, view:'create'
            return
        }

        formacaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'formacao.label', default: 'Formacao'), formacaoInstance.id])
                redirect formacaoInstance
            }
            '*' { respond formacaoInstance, [status: CREATED] }
        }
    }

    def edit(Formacao formacaoInstance) {
        respond formacaoInstance
    }

    @Transactional
    def update(Formacao formacaoInstance) {
        if (formacaoInstance == null) {
            notFound()
            return
        }

        if (formacaoInstance.hasErrors()) {
            respond formacaoInstance.errors, view:'edit'
            return
        }

        formacaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Formacao.label', default: 'Formacao'), formacaoInstance.id])
                redirect formacaoInstance
            }
            '*'{ respond formacaoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Formacao formacaoInstance) {

        if (formacaoInstance == null) {
            notFound()
            return
        }

        formacaoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Formacao.label', default: 'Formacao'), formacaoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'formacao.label', default: 'Formacao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
