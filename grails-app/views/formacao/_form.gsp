<%@ page import="com.yourapp.Formacao" %>



<div class="fieldcontain ${hasErrors(bean: formacaoInstance, field: 'anoInicio', 'error')} required">
	<label for="anoInicio">
		<g:message code="formacao.anoInicio.label" default="Ano Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="anoInicio" from="${1950..2100}" class="range" required="" value="${fieldValue(bean: formacaoInstance, field: 'anoInicio')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: formacaoInstance, field: 'anoTermino', 'error')} required">
	<label for="anoTermino">
		<g:message code="formacao.anoTermino.label" default="Ano Termino" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="anoTermino" from="${1950..2100}" class="range" required="" value="${fieldValue(bean: formacaoInstance, field: 'anoTermino')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: formacaoInstance, field: 'curso', 'error')} required">
	<label for="curso">
		<g:message code="formacao.curso.label" default="Curso" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="curso" required="" value="${formacaoInstance?.curso}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: formacaoInstance, field: 'instituicao', 'error')} required">
	<label for="instituicao">
		<g:message code="formacao.instituicao.label" default="Instituicao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="instituicao" required="" value="${formacaoInstance?.instituicao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: formacaoInstance, field: 'nivel', 'error')} required">
	<label for="nivel">
		<g:message code="formacao.nivel.label" default="Nivel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="nivel" name="nivel.id" from="${com.yourapp.Nivel.list()}" optionKey="id" required="" value="${formacaoInstance?.nivel?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: formacaoInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="formacao.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${com.yourapp.User.list()}" optionKey="id" required="" value="${formacaoInstance?.usuario?.id}" class="many-to-one"/>

</div>

