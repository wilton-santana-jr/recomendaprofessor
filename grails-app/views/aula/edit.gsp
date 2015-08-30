<%@ page import="com.yourapp.Aula" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'aula.label', default: 'Aula')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
            <g:if test="${userPrincipalId!=null && userPrincipalId==aulaInstance?.usuarioProfessor?.id}">                        
		<a href="#edit-aula" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Voltar para a tela principal</a></li>
				<li><g:link class="list" action="index">Voltar para a listagem de aulas ofertadas por mim</g:link></li>
				<li><g:link class="create" action="create">Oferecer nova aula</g:link></li>
			</ul>
		</div>
		<div id="edit-aula" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${aulaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${aulaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
                        
                        
                            <g:form url="[resource:aulaInstance, action:'update']" method="PUT" >
                                    <g:hiddenField name="version" value="${aulaInstance?.version}" />
                                    <fieldset class="form">
                                            <g:render template="form"/>
                                    </fieldset>
                                    <fieldset class="buttons">
                                            <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                    </fieldset>
                            </g:form>
		</div>
                        </g:if>   
	</body>
</html>
