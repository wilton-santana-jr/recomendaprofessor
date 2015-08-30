<%@ page import="com.yourapp.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="user.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${userInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'sobreNome', 'error')} required">
	<label for="sobreNome">
		<g:message code="user.sobreNome.label" default="Sobre Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sobreNome" required="" value="${userInstance?.sobreNome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="user.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" required="" value="${userInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'dataNascimento', 'error')} required">
	<label for="dataNascimento">
		<g:message code="user.dataNascimento.label" default="Data Nascimento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataNascimento" precision="day"  value="${userInstance?.dataNascimento}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'genero', 'error')} required">
	<label for="genero">
		<g:message code="user.genero.label" default="Genero" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="genero" from="${userInstance.constraints.genero.inList}" required="" value="${userInstance?.genero}" valueMessagePrefix="user.genero"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enderecoCep', 'error')} required">
	<label for="enderecoCep">
		<g:message code="user.enderecoCep.label" default="Endereco Cep" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="enderecoCep" required="" value="${userInstance?.enderecoCep}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enderecoLogradouro', 'error')} required">
	<label for="enderecoLogradouro">
		<g:message code="user.enderecoLogradouro.label" default="Endereco Logradouro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="enderecoLogradouro" cols="40" rows="5" maxlength="1000" required="" value="${userInstance?.enderecoLogradouro}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enderecoNumero', 'error')} required">
	<label for="enderecoNumero">
		<g:message code="user.enderecoNumero.label" default="Endereco Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="enderecoNumero" required="" value="${userInstance?.enderecoNumero}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enderecoComplemento', 'error')} ">
	<label for="enderecoComplemento">
		<g:message code="user.enderecoComplemento.label" default="Endereco Complemento" />
		
	</label>
	<g:textArea name="enderecoComplemento" cols="40" rows="5" maxlength="1000" value="${userInstance?.enderecoComplemento}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enderecoBairro', 'error')} required">
	<label for="enderecoBairro">
		<g:message code="user.enderecoBairro.label" default="Endereco Bairro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="enderecoBairro" required="" value="${userInstance?.enderecoBairro}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'dddFone1', 'error')} ">
	<label for="dddFone1">
		<g:message code="user.dddFone1.label" default="Ddd Fone1" />
		
	</label>
	<g:textField name="dddFone1" value="${userInstance?.dddFone1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'numFone1', 'error')} ">
	<label for="numFone1">
		<g:message code="user.numFone1.label" default="Num Fone1" />
		
	</label>
	<g:textField name="numFone1" value="${userInstance?.numFone1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'dddFone2', 'error')} ">
	<label for="dddFone2">
		<g:message code="user.dddFone2.label" default="Ddd Fone2" />
		
	</label>
	<g:textField name="dddFone2" value="${userInstance?.dddFone2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'numFone2', 'error')} ">
	<label for="numFone2">
		<g:message code="user.numFone2.label" default="Num Fone2" />
		
	</label>
	<g:textField name="numFone2" value="${userInstance?.numFone2}"/>

</div>

<!--
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'photo', 'error')} ">
	<label for="photo">
		<g:message code="user.photo.label" default="Photo" />		
	</label>
	<input type="file" id="photo" name="photo" />

</div>
-->


<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'avatar', 'error')} ">
	<label for="avatar">
		<g:message code="user.avatar.label" default="Avatar" />		
	</label>
	<input type="file" id="photo" name="photo" /> 

</div>





<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'valorMedioHoraAula', 'error')} required">
	<label for="valorMedioHoraAula">
		<g:message code="user.valorMedioHoraAula.label" default="Valor Medio Hora Aula" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorMedioHoraAula" value="${fieldValue(bean: userInstance, field: 'valorMedioHoraAula')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enderecoCidade', 'error')} required">
	<label for="enderecoCidade">
		<g:message code="user.enderecoCidade.label" default="Endereco Cidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="enderecoCidade" name="enderecoCidade.id" from="${com.yourapp.Cidade.list()}" optionKey="id" required="" value="${userInstance?.enderecoCidade?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'aulas', 'error')} ">
	<label for="aulas">
		<g:message code="user.aulas.label" default="Aulas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.aulas?}" var="a">
    <li><g:link controller="aula" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="aula" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'aula.label', default: 'Aula')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'avaliacoes', 'error')} ">
	<label for="avaliacoes">
		<g:message code="user.avaliacoes.label" default="Avaliacoes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.avaliacoes?}" var="a">
    <li><g:link controller="avaliacao" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="avaliacao" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'avaliacao.label', default: 'Avaliacao')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'formacoes', 'error')} ">
	<label for="formacoes">
		<g:message code="user.formacoes.label" default="Formacoes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.formacoes?}" var="f">
    <li><g:link controller="formacao" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="formacao" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'formacao.label', default: 'Formacao')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />

</div>

