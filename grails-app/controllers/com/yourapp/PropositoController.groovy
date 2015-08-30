package com.yourapp


 import grails.plugin.springsecurity.annotation.Secured
 
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PropositoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN'])         
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Proposito.list(params), model:[propositoInstanceCount: Proposito.count()]
    }

    @Secured(['ROLE_ADMIN'])         
    def show(Proposito propositoInstance) {
        respond propositoInstance
    }

    @Secured(['ROLE_ADMIN'])         
    def create() {
        respond new Proposito(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])         
    def save(Proposito propositoInstance) {
        if (propositoInstance == null) {
            notFound()
            return
        }

        if (propositoInstance.hasErrors()) {
            respond propositoInstance.errors, view:'create'
            return
        }

        propositoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proposito.label', default: 'Proposito'), propositoInstance.id])
                redirect propositoInstance
            }
            '*' { respond propositoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])         
    def edit(Proposito propositoInstance) {
        respond propositoInstance
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])         
    def update(Proposito propositoInstance) {
        if (propositoInstance == null) {
            notFound()
            return
        }

        if (propositoInstance.hasErrors()) {
            respond propositoInstance.errors, view:'edit'
            return
        }

        propositoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Proposito.label', default: 'Proposito'), propositoInstance.id])
                redirect propositoInstance
            }
            '*'{ respond propositoInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])         
    def delete(Proposito propositoInstance) {

        if (propositoInstance == null) {
            notFound()
            return
        }

        propositoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Proposito.label', default: 'Proposito'), propositoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proposito.label', default: 'Proposito'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
