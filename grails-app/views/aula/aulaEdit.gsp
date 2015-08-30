<%@ page import="com.yourapp.Aula" %>
<%@ page import="com.yourapp.Avaliacao" %>
<%@ page import="com.yourapp.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="Avaliar aula de professor" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-aula" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="edit-aula" class="content scaffold-edit" role="main">
            <h1>Avaliar aula do professor: ${aulaInstance.usuarioProfessor.nome} ${aulaInstance.usuarioProfessor.sobreNome}</h1>
            <g:if test="${message}">
                <div class="message" role="status">${message}</div>
            </g:if>
            <g:hasErrors bean="${aulaInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${aulaInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form url="[controller:'avaliacao', action:'avaliaAula']" method="PUT" >
                <g:hiddenField name="version" value="${aulaInstance?.version}" />
                <g:hiddenField name="id" value="${aulaInstance?.id}" />
                <fieldset class="form">
                    <g:render template="formAvaliaAula"/>
                </fieldset>
                
                 <fieldset class="buttons">
                    <g:actionSubmit class="save" action="avaliaAula" value="Enviar Avaliação" />
                </fieldset>


            </g:form>
        </div>
    </body>
</html>
