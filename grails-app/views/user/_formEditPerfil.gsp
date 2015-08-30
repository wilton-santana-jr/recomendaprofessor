<%@ page import="com.yourapp.User" %>

<div class="fieldcontain  required">
    <g:if test="${userInstance?.avatar}">
        
            <span id="avatar-label" class="property-label">Foto</span>

            <span class="property-value" aria-labelledby="avatar-label">                            
                <img style="height: 95px;width:115px;" src="${resource(dir:'avatarImages', file: userInstance.id + '.png')}" />
            </span>

       
    </g:if>
    <g:else>   

            <span id="avatar-label" class="property-label">Foto</span>
            <span class="property-value" aria-labelledby="avatar-label">                            
                <img style="height: 95px;width:115px;" src="${resource(dir:'avatarImages', file: userInstance.genero=='Masculino'?'-1.png':'-2.png')}" />
            </span>


    </g:else>  
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
    <label for="password">
        <g:message code="user.password.label" default="Password" />
        <span class="required-indicator">*</span>
    </label>

    <g:passwordField name="password" required="" value="${userInstance?.password}" />

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
    <g:textField name="enderecoCep" required="" value="${userInstance?.enderecoCep}" />

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



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enderecoBairro', 'error')} required">
    <label for="enderecoBairro">
        <g:message code="user.enderecoBairro.label" default="Endereco Bairro" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="enderecoBairro" required="" value="${userInstance?.enderecoBairro}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enderecoComplemento', 'error')} ">
    <label for="enderecoComplemento">
        <g:message code="user.enderecoComplemento.label" default="Endereco Complemento" />

    </label>
    <g:textArea name="enderecoComplemento" cols="40" rows="5" maxlength="1000" value="${userInstance?.enderecoComplemento}"/>

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






<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enderecoCidade', 'error')} required">
    <label for="estado">
        Estado onde mora
        <span class="required-indicator">*</span>
    </label>       
    <g:select id="estado" name="estado.nome" from="${com.yourapp.Estado.list()}" optionKey="id" required="" 
    optionValue="nome" value="${userInstance?.enderecoCidade?.estado?.id}" class="many-to-one"        
        onchange="updateCidade(this.value)"
        />

</div>


<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enderecoCidade', 'error')} required">
    <label for="enderecoCidade">
        Cidade onde mora
        <span class="required-indicator">*</span>
    </label>
    <g:select id="enderecoCidade" name="enderecoCidade.id" from="" optionKey="id" required="" value="${userInstance?.enderecoCidade?.id}" class="many-to-one"/>

</div>

<g:javascript>
    function updateCidade(idEstadoValue) {               
    jQuery.ajax({type:'POST',
    data:{idCidadeSelected:'${(userInstance!=null&&userInstance.enderecoCidade!=null)?userInstance.enderecoCidade.id:-1}'},
    url:'${request.contextPath}/user/ajaxGetCidadesPorEstado/'+idEstadoValue,success:function(data,textStatus){jQuery('#enderecoCidade').html(data);},error:function
    (XMLHttpRequest,textStatus,errorThrown){}});return false;               
    }         
        
    updateCidade(${(userInstance!=null&&userInstance.enderecoCidade!=null&&userInstance.enderecoCidade.estado!=null)?userInstance.enderecoCidade.estado.id:5});
</g:javascript> 









