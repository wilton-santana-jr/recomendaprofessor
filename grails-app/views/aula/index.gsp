
<%@ page import="com.yourapp.Aula" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'aula.label', default: 'Aula')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-aula" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Voltar para a tela principal</a></li>
				<li><g:link class="create" action="create">Oferecer nova aula</g:link></li>
			</ul>
		</div>
		<div id="list-aula" class="content scaffold-list" role="main">
			<h1>Listagem de aulas oferecidas pelo usuário logado</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						
                                                
                                                
                                                <th>Professor/Especialidade</th>
                                                
                                                <g:sortableColumn property="especialidade" title="Disciplina" />					                                                                                                																			
                                                
                                                <th>R$ Hora/Aula</th>
                                                
                                    
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${aulaInstanceList}" status="i" var="aulaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td style="width: 445px;" >
                                                                                                   
                                                        ${aulaInstance.usuarioProfessor.nome} (${aulaInstance.usuarioProfessor.email})
                                                     <br/>
                                                        Especialidade:${aulaInstance.especialidade}                                                   
                                                </td>											
					
						<td>    
                                                      <g:link action="show" id="${aulaInstance.id}">      
                                                        ${aulaInstance.categoria.nome} (${aulaInstance.nivelEscolar.nome})
                                                      </g:link>  <br/>
                                                     
                                                     (Propósito:${aulaInstance.proposito.nome}) 
                                                    
                                                </td>
					
						<td>                                                                                                         
                                                        R$: ${aulaInstance.valorHoraAula}
                                                </td>
											
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">				
                                <g:paginate controller="aula" action="index" total="${aulaInstanceCount?:0}" />
			</div>
		</div>
	</body>
</html>
