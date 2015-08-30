<%@ page import="com.yourapp.Categoria" %>



<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="categoria.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nome" from="${categoriaInstance.constraints.nome.inList}" required="" value="${categoriaInstance?.nome}" valueMessagePrefix="categoria.nome"/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'area', 'error')} required">
	<label for="area">
		<g:message code="categoria.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="area" name="area.id" from="${com.yourapp.Area.list()}" optionKey="id" required="" value="${categoriaInstance?.area?.id}" class="many-to-one"/>

</div>

