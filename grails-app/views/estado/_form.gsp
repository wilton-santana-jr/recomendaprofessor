<%@ page import="com.yourapp.Estado" %>



<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="estado.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nome" from="${estadoInstance.constraints.nome.inList}" required="" value="${estadoInstance?.nome}" valueMessagePrefix="estado.nome"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'sigla', 'error')} required">
	<label for="sigla">
		<g:message code="estado.sigla.label" default="Sigla" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sigla" from="${estadoInstance.constraints.sigla.inList}" required="" value="${estadoInstance?.sigla}" valueMessagePrefix="estado.sigla"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'cidades', 'error')} ">
	<label for="cidades">
		<g:message code="estado.cidades.label" default="Cidades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${estadoInstance?.cidades?}" var="c">
    <li><g:link controller="cidade" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cidade" action="create" params="['estado.id': estadoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cidade.label', default: 'Cidade')])}</g:link>
</li>
</ul>


</div>

