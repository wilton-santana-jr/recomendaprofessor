<%@ page import="com.yourapp.Proposito" %>



<div class="fieldcontain ${hasErrors(bean: propositoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="proposito.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nome" from="${propositoInstance.constraints.nome.inList}" required="" value="${propositoInstance?.nome}" valueMessagePrefix="proposito.nome"/>

</div>

