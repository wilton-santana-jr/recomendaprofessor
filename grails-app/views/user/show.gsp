
<%@ page import="com.yourapp.User" %>
<%@ page import="static org.springframework.http.HttpStatus.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>   

        <div id="show-user" class="content scaffold-show" role="main">
            <h1>Perfil do Usuário</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list user">


                                                
               

                <g:if test="${userInstance?.avatar}">
                    <li class="fieldcontain">
                        <span id="avatar-label" class="property-label">Foto</span>

                        <span class="property-value" aria-labelledby="avatar-label">                            
                            <img style="height: 95px;width:115px;" src="${resource(dir:'avatarImages', file: userInstance.id + '.png')}" />
                        </span>

                    </li>
                </g:if>
                <g:else>   
                      <li class="fieldcontain">
                        <span id="avatar-label" class="property-label">Foto</span>
                        <span class="property-value" aria-labelledby="avatar-label">                            
                            <img style="height: 95px;width:115px; width:115px" src="${resource(dir:'avatarImages', file: userInstance.genero=='Masculino'?'-1.png':'-2.png')}" />
                        </span>

                        </li>                              
                </g:else>  


                <g:if test="${userInstance?.email}">
                    <li class="fieldcontain">
                        <span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>

                        <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>

                    </li>
                </g:if>

                <g:if test="${userInstance?.nome}">
                    <li class="fieldcontain">
                        <span id="nome-label" class="property-label"><g:message code="user.nome.label" default="Nome" /> </span>

                        <span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${userInstance}" field="nome"/> <g:fieldValue bean="${userInstance}" field="sobreNome"/></span>

                    </li>
                </g:if>



                <g:if test="${userInstance?.cpf}">
                    <li class="fieldcontain">
                        <span id="cpf-label" class="property-label"><g:message code="user.cpf.label" default="Cpf" /></span>

                        <span class="property-value" aria-labelledby="cpf-label"><g:fieldValue bean="${userInstance}" field="cpf"/></span>

                    </li>
                </g:if>

                <g:if test="${userInstance?.dataNascimento}">
                    <li class="fieldcontain">
                        <span id="dataNascimento-label" class="property-label"><g:message code="user.dataNascimento.label" default="Data Nascimento" /></span>

                        <span class="property-value" aria-labelledby="dataNascimento-label"><g:formatDate date="${userInstance?.dataNascimento}" /></span>

                    </li>
                </g:if>

                <g:if test="${userInstance?.genero}">
                    <li class="fieldcontain">
                        <span id="genero-label" class="property-label"><g:message code="user.genero.label" default="Genero" /></span>

                        <span class="property-value" aria-labelledby="genero-label"><g:fieldValue bean="${userInstance}" field="genero"/></span>

                    </li>
                </g:if>

                <g:if test="${userInstance?.enderecoCep}">
                    <li class="fieldcontain">
                        <span id="enderecoCep-label" class="property-label"><g:message code="user.enderecoCep.label" default="Endereco Cep" /></span>

                        <span class="property-value" aria-labelledby="enderecoCep-label"><g:fieldValue bean="${userInstance}" field="enderecoCep"/></span>

                    </li>
                </g:if>



                <g:if test="${userInstance?.dddFone1&&userInstance?.numFone1}">
                    <li class="fieldcontain">
                        <span id="dddFone1-label" class="property-label"><g:message code="user.dddFone1.label" default="Ddd Fone1" /></span>

                        <span class="property-value" aria-labelledby="dddFone1-label">(<g:fieldValue bean="${userInstance}" field="dddFone1"/>)<g:fieldValue bean="${userInstance}" field="numFone1"/> </span>

                    </li>
                </g:if>



                <g:if test="${userInstance?.dddFone2&&userInstance?.numFone2}">
                    <li class="fieldcontain">
                        <span id="dddFone2-label" class="property-label"><g:message code="user.dddFone2.label" default="Ddd Fone2" /></span>

                        <span class="property-value" aria-labelledby="dddFone2-label">(<g:fieldValue bean="${userInstance}" field="dddFone2"/>)<g:fieldValue bean="${userInstance}" field="numFone2"/></span>

                    </li>
                </g:if>


                <!--
                <g:if test="${userInstance?.photo}">
                    <li class="fieldcontain">
                        <span id="photo-label" class="property-label"><g:message code="user.photo.label" default="Photo" /></span>

                    </li>
                </g:if>
                -->

                <g:if test="${userInstance?.valorMedioHoraAula}">
                    <li class="fieldcontain">
                        <span id="valorMedioHoraAula-label" class="property-label"><g:message code="user.valorMedioHoraAula.label" default="Preço Médio da Hora-Aula do Professor" /></span>

                        <span class="property-value" aria-labelledby="valorMedioHoraAula-label">

                            <g:formatNumber number="${userInstance.valorMedioHoraAula}" type="currency"  /> 
                        </span>

                    </li>
                </g:if>

                <g:if test="${userInstance?.enderecoCidade}">
                    <li class="fieldcontain">
                        <span id="enderecoCidade-label" class="property-label"><g:message code="user.enderecoCidade.label" default="Cidade do usuário:" /></span>

                        <span class="property-value" aria-labelledby="enderecoCidade-label">${userInstance?.enderecoCidade?.nome}-${userInstance?.enderecoCidade?.estado?.sigla}</span>

                    </li>
                </g:if>


                <g:if test="${userInstance?.aulas}">
                    <li class="fieldcontain">
                        <span id="aulas-label" class="property-label"><g:message code="user.aulas.label" default="Aulas" /></span>

                        <g:each in="${userInstance.aulas}" var="a">

                            <span class="property-value" aria-labelledby="aulas-label">


                                <g:if test="${userPrincipalId!=null && userPrincipalId==userInstance.id}">                                                              
                                    <g:link action="show" title="Clique aqui para editar os dados da sua disciplina" controller="aula" id="${a.id}">
                                        ${a.categoria}(${a.nivelEscolar})</g:link>
                                </g:if>
                                <g:else>                                                                                                                            
                                    <g:link action="aulaEdit" title="Clique aqui para avaliar a disciplina" controller="aula" id="${a.id}">
                                       ${a.categoria}(${a.nivelEscolar})</g:link>
                                </g:else>   


                                



                                <br/>${a.especialidade}


                            </span> <br/>
                        </g:each>

                    </li>
                </g:if>



                <g:if test="${userInstance?.formacoes}">
                    <li class="fieldcontain">
                        <span id="formacoes-label" class="property-label"><g:message code="user.formacoes.label" default="Formacoes" /></span>

                        <g:each in="${userInstance.formacoes}" var="f">
                            <span class="property-value" aria-labelledby="formacoes-label"><g:link controller="formacao" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
                        </g:each>

                    </li>
                </g:if>



            </ol>






            <g:if test="${userPrincipalId!=null && userPrincipalId==userInstance.id}">


                <fieldset class="buttons">
                    <g:link class="edit" controller="user" action="editaPerfil" >Editar meu perfil</g:link>&nbsp;</div><br/>       
            </fieldset>

    </g:if>
</div>
</body>
</html>
