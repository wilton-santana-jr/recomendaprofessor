<%@ page import="com.yourapp.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title>Editando perfil do usuário</title>
            <script type="text/javascript" src="${request.contextPath}/js/jquery-1.2.6.pack.js"></script>
            <script type="text/javascript" src="${request.contextPath}/js/jquery.maskedinput-1.1.4.pack.js"/></script>
	</head>
	<body>
            
            <g:javascript>                
                $(document).ready(function(){
                    $("#cpf").mask("999.999.999-99");
                    $("#enderecoCep").mask("99999-999");
                    $("#dddFone1").mask("99");
                    $("#numFone1").mask("999999999");
                    $("#dddFone2").mask("99");
                    $("#numFone2").mask("999999999");
                });
            </g:javascript>
            
		<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="edit-user" class="content scaffold-edit" role="main">
			<h1>Editando meu perfil de usuário</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:userInstance, action:'updatePerfil']" method="PUT"  enctype="multipart/form-data" >
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset class="form">
					<g:render template="formEditPerfil"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="updatePerfil" value="Atualizar perfil" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
