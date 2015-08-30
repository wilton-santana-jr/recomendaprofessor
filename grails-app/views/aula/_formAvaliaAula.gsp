<%@ page import="com.yourapp.Aula" %>

<b>Disciplina:</b> ${aulaInstance.categoria.nome} <b>(Nível:</b> ${aulaInstance.nivelEscolar.nome}<b>)</b> <br/>
<b>Área: </b>${aulaInstance.categoria.area.nome}<br/>
<b>Propósito da aula:</b> ${aulaInstance.proposito.nome} 

<g:if test="${aulaInstance.exibirValorHoraAula==true}">
    <b>(Valor hora/aula:</b>  <g:formatNumber number="${aulaInstance.valorHoraAula}" type="currency"  /> <b>)</b><br/>
</g:if>
<g:else>
    <b>(Valor hora/aula: a combinar<b>)</b><br/>
</g:else>

<br/>
<b>Avaliar:</b> 
<div id="demo"></div>
<g:javascript>                       
    <ry:stars divId="demo" name="notaDisciplina" number="5" score="${notaDisciplina?:0}" readOnly="false"  half="false" hints="${['\'péssimo\'', '\'ruim\'', '\'bom\'', '\'ótimo\'', '\'excelente\'']}"  />    
</g:javascript>

