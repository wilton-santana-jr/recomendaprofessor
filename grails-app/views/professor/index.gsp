<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="com.yourapp.*" %>
<%@ page import="org.graty.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'aula.label', default: 'Aula')}" />
        <title>Recomenda Reforco</title>
    <r:require module="raty"/>
    <r:layoutResources />  
</head>
<body>
    <a href="#list-aula" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>


    <br/>

    <div  id="find-aulaReforco" style="float: right; "  role="main">
        <g:form url="[resource:aulaInstance, controller:professor, action:'index']" >
            <g:textField name="termoBusca" placeholder="Buscar professor ou disciplina" size="30" value="${termoBusca?:''}"/>

            <g:submitButton class="buttons" name="create" class="save" value="Buscar" />
            &nbsp;
        </g:form>
    </div>

    <br/>

    <div id="list-aula" class="content scaffold-list" role="main">
        <h1>Listagem de aulas ofertadas pelos professores</h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
                <tr>

                    <th>Professor</th>
                    <th></th>

                        <g:sortableColumn property="especialidade" title="Disciplina" />					                                                                                                																			

                    <th>R$ Hora/Aula</th>

                    <th>Avaliação Média</th>


                </tr>
            </thead>
            <tbody>
                <g:each in="${aulaInstanceList}" status="i" var="aulaInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>
                            <g:if test="${aulaInstance!=null && aulaInstance[16]!=null}">                                
                                    <span class="property-value" aria-labelledby="avatar-label">                            
                                        <img style="height: 95px;width:115px;" src="${resource(dir:'avatarImages', file: aulaInstance[7] + '.png')}" />
                                    </span>                                
                            </g:if>
                            <g:else>              
                                <span class="property-value" aria-labelledby="avatar-label">                            
                                        <img style="height: 95px;width:115px;" src="${resource(dir:'avatarImages', file: aulaInstance[17]=='Masculino'?'-1.png':'-2.png')}" />
                                </span>  
                            </g:else>  
                </td>

                <td style="width: 345px">


                    <g:link action="show" title="Clique para vizualizar o perfil do professor" controller="user" id="${aulaInstance[7]}">
                        ${aulaInstance[8]} (${aulaInstance[9]})<br/>${aulaInstance[13]}-${aulaInstance[15]} 
                    </g:link><br/>
                    Especialidade:${aulaInstance[3]}
                </td>


                <td>

                    <g:if test="${userPrincipalId!=null && userPrincipalId==aulaInstance[7]}">                                                              
                        <g:link action="show" title="Clique aqui para editar os dados da sua disciplina" controller="aula" id="${aulaInstance[0]}">
                            ${aulaInstance[2]} (${aulaInstance[5]})
                        </g:link>
                    </g:if>
                    <g:else>                                                                                                                            
                        <g:link action="aulaEdit" title="Clique aqui para avaliar a disciplina" controller="aula" id="${aulaInstance[0]}">
                            ${aulaInstance[2]} (${aulaInstance[5]})
                        </g:link>
                    </g:else>     

                    <br/>

                    (Propósito:${aulaInstance[6]}) 

                </td>



                <td>

                    <g:if test="${aulaInstance[4] == true}">
                        R$: ${aulaInstance[10]}
                    </g:if>
                    <g:else>
                        R$: (Valor a combinar)
                    </g:else>
                </td>



                <td>
                <center> 
                    <g:if test="${aulaInstance[11] == null}">

                        <div id="star-${aulaInstance[0]}"></div>
                        <b>0 avaliações</b>
                        <g:javascript>
                            jQuery.fn.raty.defaults.path = "${request.contextPath}/images";
                            jQuery('#star-${aulaInstance[0]}').raty({ number: 5, score: 0, readOnly: true });                                                                                                                             
                        </g:javascript> 


                    </g:if>
                    <g:else>

                        <div id="star-${aulaInstance[0]}"></div>

                        <b>${(aulaInstance[12]==1)?"1 avaliação":"${aulaInstance[12]} avaliações"}</b>

                        <g:javascript>
                            jQuery.fn.raty.defaults.path = "${request.contextPath}/images";
                            jQuery('#star-${aulaInstance[0]}').raty({ number: 5, score: ${aulaInstance[11]}, readOnly: true });                                                                                                                             
                        </g:javascript> 


                    </g:else>
                </center>

                </td>



                </tr>
            </g:each>
            </tbody>
        </table>
        <div class="pagination">				
            <g:paginate controller="professor" action="index" params="${[termoBusca:termoBusca?:'']}" total="${aulaInstanceCount?:0}" />
        </div>
    </div>
<r:layoutResources />  
</body>
</html>

