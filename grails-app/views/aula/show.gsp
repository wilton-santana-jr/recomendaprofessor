
<%@ page import="com.yourapp.Aula" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'aula.label', default: 'Aula')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-aula" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="show-aula" class="content scaffold-show" role="main">
            <h1>Dados da aula</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list aula">

                <g:if test="${aulaInstance?.especialidade}">
                    <li class="fieldcontain">
                        <span id="especialidade-label" class="property-label"><g:message code="aula.especialidade.label" default="Especialidade" /></span>

                        <span class="property-value" aria-labelledby="especialidade-label"><g:fieldValue bean="${aulaInstance}" field="especialidade"/></span>

                    </li>
                </g:if>

                <g:if test="${aulaInstance?.exibirValorHoraAula&&aulaInstance?.valorHoraAula}">
                    <li class="fieldcontain">
                        <span id="exibirValorHoraAula-label" class="property-label"><g:message code="aula.exibirValorHoraAula.label" default="Exibir Valor Hora Aula" /></span>

                        <span class="property-value" aria-labelledby="exibirValorHoraAula-label">

                            <g:formatNumber number="${aulaInstance?.valorHoraAula}" type="currency"  />
                        </span>

                    </li>
                </g:if>

                <g:if test="${aulaInstance?.usuarioProfessor}">
                    <li class="fieldcontain">
                        <span id="usuarioProfessor-label" class="property-label"><g:message code="aula.usuarioProfessor.label" default="Usuario Professor" /></span>

                        <span class="property-value" aria-labelledby="usuarioProfessor-label"><g:link controller="user" action="show" id="${aulaInstance?.usuarioProfessor?.id}">${aulaInstance?.usuarioProfessor?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${aulaInstance?.categoria}">
                    <li class="fieldcontain">
                        <span id="categoria-label" class="property-label">Disciplina</span>

                        <span class="property-value" aria-labelledby="categoria-label"><g:link controller="aula" action="show" id="${aulaInstance?.id}">${aulaInstance?.categoria?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${aulaInstance?.nivelEscolar}">
                    <li class="fieldcontain">
                        <span id="nivelEscolar-label" class="property-label"><g:message code="aula.nivelEscolar.label" default="Nivel Escolar" /></span>

                        <span class="property-value" aria-labelledby="nivelEscolar-label">
                            ${aulaInstance?.nivelEscolar?.encodeAsHTML()}</span>

                    </li>
                </g:if>

                <g:if test="${aulaInstance?.proposito}">
                    <li class="fieldcontain">
                        <span id="proposito-label" class="property-label"><g:message code="aula.proposito.label" default="Proposito" /></span>

                        <span class="property-value" aria-labelledby="proposito-label">
                            ${aulaInstance?.proposito?.encodeAsHTML()}</span>

                    </li>
                </g:if>


            </ol>
            
            <g:if test="${userPrincipalId!=null && userPrincipalId==aulaInstance?.usuarioProfessor?.id}">  
                <g:form url="[resource:aulaInstance, action:'delete']" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${aulaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </g:if>    

        </div>
    </body>
</html>
