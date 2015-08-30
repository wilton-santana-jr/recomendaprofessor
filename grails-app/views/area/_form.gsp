<%@ page import="com.yourapp.Area" %>



<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="area.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nome" from="${areaInstance.constraints.nome.inList}" required="" value="${areaInstance?.nome}" valueMessagePrefix="area.nome"/>

</div>

<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'categorias', 'error')} ">
	<label for="categorias">
		<g:message code="area.categorias.label" default="Categorias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${areaInstance?.categorias?}" var="c">
    <li><g:link controller="categoria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="categoria" action="create" params="['area.id': areaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'categoria.label', default: 'Categoria')])}</g:link>
</li>
</ul>


</div>

