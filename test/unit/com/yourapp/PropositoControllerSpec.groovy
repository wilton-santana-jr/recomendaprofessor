package com.yourapp



import grails.test.mixin.*
import spock.lang.*

@TestFor(PropositoController)
@Mock(Proposito)
class PropositoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.propositoInstanceList
            model.propositoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.propositoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def proposito = new Proposito()
            proposito.validate()
            controller.save(proposito)

        then:"The create view is rendered again with the correct model"
            model.propositoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            proposito = new Proposito(params)

            controller.save(proposito)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/proposito/show/1'
            controller.flash.message != null
            Proposito.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def proposito = new Proposito(params)
            controller.show(proposito)

        then:"A model is populated containing the domain instance"
            model.propositoInstance == proposito
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def proposito = new Proposito(params)
            controller.edit(proposito)

        then:"A model is populated containing the domain instance"
            model.propositoInstance == proposito
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/proposito/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def proposito = new Proposito()
            proposito.validate()
            controller.update(proposito)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.propositoInstance == proposito

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            proposito = new Proposito(params).save(flush: true)
            controller.update(proposito)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/proposito/show/$proposito.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/proposito/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def proposito = new Proposito(params).save(flush: true)

        then:"It exists"
            Proposito.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(proposito)

        then:"The instance is deleted"
            Proposito.count() == 0
            response.redirectedUrl == '/proposito/index'
            flash.message != null
    }
}
