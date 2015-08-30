
<%@ page import="com.yourapp.Estado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-estado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-estado" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list estado">
			
				<g:if test="${estadoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="estado.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${estadoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estadoInstance?.sigla}">
				<li class="fieldcontain">
					<span id="sigla-label" class="property-label"><g:message code="estado.sigla.label" default="Sigla" /></span>
					
						<span class="property-value" aria-labelledby="sigla-label"><g:fieldValue bean="${estadoInstance}" field="sigla"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estadoInstance?.cidades}">
				<li class="fieldcontain">
					<span id="cidades-label" class="property-label"><g:message code="estado.cidades.label" default="Cidades" /></span>
					
						<g:each in="${estadoInstance.cidades}" var="c">
						<span class="property-value" aria-labelledby="cidades-label"><g:link controller="cidade" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:estadoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${estadoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
