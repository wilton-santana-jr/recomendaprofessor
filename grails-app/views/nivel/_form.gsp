<%@ page import="com.yourapp.Nivel" %>



<div class="fieldcontain ${hasErrors(bean: nivelInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="nivel.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nome" from="${nivelInstance.constraints.nome.inList}" required="" value="${nivelInstance?.nome}" valueMessagePrefix="nivel.nome"/>

</div>

