
<%@ page import="com.yourapp.Formacao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'formacao.label', default: 'Formacao')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-formacao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-formacao" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list formacao">
			
				<g:if test="${formacaoInstance?.anoInicio}">
				<li class="fieldcontain">
					<span id="anoInicio-label" class="property-label"><g:message code="formacao.anoInicio.label" default="Ano Inicio" /></span>
					
						<span class="property-value" aria-labelledby="anoInicio-label"><g:fieldValue bean="${formacaoInstance}" field="anoInicio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formacaoInstance?.anoTermino}">
				<li class="fieldcontain">
					<span id="anoTermino-label" class="property-label"><g:message code="formacao.anoTermino.label" default="Ano Termino" /></span>
					
						<span class="property-value" aria-labelledby="anoTermino-label"><g:fieldValue bean="${formacaoInstance}" field="anoTermino"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formacaoInstance?.curso}">
				<li class="fieldcontain">
					<span id="curso-label" class="property-label"><g:message code="formacao.curso.label" default="Curso" /></span>
					
						<span class="property-value" aria-labelledby="curso-label"><g:fieldValue bean="${formacaoInstance}" field="curso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formacaoInstance?.instituicao}">
				<li class="fieldcontain">
					<span id="instituicao-label" class="property-label"><g:message code="formacao.instituicao.label" default="Instituicao" /></span>
					
						<span class="property-value" aria-labelledby="instituicao-label"><g:fieldValue bean="${formacaoInstance}" field="instituicao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formacaoInstance?.nivel}">
				<li class="fieldcontain">
					<span id="nivel-label" class="property-label"><g:message code="formacao.nivel.label" default="Nivel" /></span>
					
						<span class="property-value" aria-labelledby="nivel-label"><g:link controller="nivel" action="show" id="${formacaoInstance?.nivel?.id}">${formacaoInstance?.nivel?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${formacaoInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="formacao.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="user" action="show" id="${formacaoInstance?.usuario?.id}">${formacaoInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:formacaoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${formacaoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
