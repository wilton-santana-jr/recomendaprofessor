<%@ page import="com.yourapp.Aula" %>

<g:if test="${aulaInstance!=null&&aulaInstance.usuarioProfessor!=null}">
     <g:hiddenField  name="usuarioProfessor" value="${aulaInstance.usuarioProfessor.id}" />
</g:if>
<g:else>
       <g:hiddenField  name="usuarioProfessor" value="${1}" />
</g:else>


<div class="fieldcontain ${hasErrors(bean: aulaInstance, field: 'especialidade', 'error')} required">
	<label for="especialidade">
		<g:message code="aula.especialidade.label" default="Especialidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="especialidade" cols="40" rows="5" maxlength="2000" required="" value="${aulaInstance?.especialidade}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: aulaInstance, field: 'valorHoraAula', 'error')} required">
	<label for="valorHoraAula">
		<g:message code="aula.valorHoraAula.label" default="Valor Hora Aula" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorHoraAula" value="${fieldValue(bean: aulaInstance, field: 'valorHoraAula')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: aulaInstance, field: 'exibirValorHoraAula', 'error')} ">
	<label for="exibirValorHoraAula">
		<g:message code="aula.exibirValorHoraAula.label" default="Exibir Valor Hora Aula" />
		
	</label>
	<g:checkBox name="exibirValorHoraAula" value="${aulaInstance?.exibirValorHoraAula}" />

</div>


<div class="fieldcontain ${hasErrors(bean: aulaInstance, field: 'categoria', 'error')} required">
	<label for="area">
		Área
		<span class="required-indicator">*</span>
	</label>
	<g:select id="area" name="area.nome" from="${com.yourapp.Area.list()}" optionKey="id" required="" 
        optionValue="nome" value="${aulaInstance?.categoria?.area?.id}" class="many-to-one"            
            onchange="updateCategoria(this.value)"
            />

</div>


<div class="fieldcontain ${hasErrors(bean: aulaInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		Disciplina
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="" optionKey="id"
        selected="${aulaInstance?.categoria?.id}" required=""  
        value="${aulaInstance?.categoria?.id}" class="many-to-one"/>

</div>


<g:javascript>
    function updateCategoria(idAreaValue) {               
       jQuery.ajax({type:'POST', 
       data:{idCategoriaSelected:'${(aulaInstance!=null&&aulaInstance.categoria!=null)?aulaInstance.categoria.id:-1}'},
       url:'${request.contextPath}/aula/ajaxGetCategoriasPorArea/'+idAreaValue,success:function(data,textStatus){jQuery('#categoria').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});          
    }         
    updateCategoria(${(aulaInstance!=null&&aulaInstance.categoria!=null&&aulaInstance.categoria.area!=null)?aulaInstance.categoria.area.id:5});
</g:javascript> 

<div class="fieldcontain ${hasErrors(bean: aulaInstance, field: 'nivelEscolar', 'error')} required">
	<label for="nivelEscolar">
		<g:message code="aula.nivelEscolar.label" default="Nivel Escolar" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="nivelEscolar" name="nivelEscolar.id" from="${com.yourapp.Nivel.list()}" optionKey="id" required="" value="${aulaInstance?.nivelEscolar?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: aulaInstance, field: 'proposito', 'error')} required">
	<label for="proposito">
		<g:message code="aula.proposito.label" default="Proposito" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proposito" name="proposito.id" from="${com.yourapp.Proposito.list()}" optionKey="id" required="" value="${aulaInstance?.proposito?.id}" class="many-to-one"/>

</div>


<!--
<div class="fieldcontain ${hasErrors(bean: aulaInstance, field: 'avaliacoes', 'error')} ">
	<label for="avaliacoes">
		<g:message code="aula.avaliacoes.label" default="Avaliacoes" />
		
	</label>


<ul class="one-to-many">
<g:each in="${aulaInstance?.avaliacoes?}" var="a">
    <li><g:link controller="avaliacao" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="avaliacao" action="create" params="['aula.id': aulaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'avaliacao.label', default: 'Avaliacao')])}</g:link>
</li>
</ul>




</div>
!-->
