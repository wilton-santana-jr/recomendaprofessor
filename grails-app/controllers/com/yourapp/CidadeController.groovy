package com.yourapp


import grails.plugin.springsecurity.annotation.Secured
 
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CidadeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN']) 
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cidade.list(params), model:[cidadeInstanceCount: Cidade.count()]
    }

    @Secured(['ROLE_ADMIN']) 
    def show(Cidade cidadeInstance) {
        respond cidadeInstance
    }

    @Secured(['ROLE_ADMIN']) 
    def create() {
        respond new Cidade(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN']) 
    def save(Cidade cidadeInstance) {
        if (cidadeInstance == null) {
            notFound()
            return
        }

        if (cidadeInstance.hasErrors()) {
            respond cidadeInstance.errors, view:'create'
            return
        }

        cidadeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cidade.label', default: 'Cidade'), cidadeInstance.id])
                redirect cidadeInstance
            }
            '*' { respond cidadeInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN']) 
    def edit(Cidade cidadeInstance) {
        respond cidadeInstance
    }

    @Transactional
    @Secured(['ROLE_ADMIN']) 
    def update(Cidade cidadeInstance) {
        if (cidadeInstance == null) {
            notFound()
            return
        }

        if (cidadeInstance.hasErrors()) {
            respond cidadeInstance.errors, view:'edit'
            return
        }

        cidadeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cidade.label', default: 'Cidade'), cidadeInstance.id])
                redirect cidadeInstance
            }
            '*'{ respond cidadeInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN']) 
    def delete(Cidade cidadeInstance) {

        if (cidadeInstance == null) {
            notFound()
            return
        }

        cidadeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cidade.label', default: 'Cidade'), cidadeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cidade.label', default: 'Cidade'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
