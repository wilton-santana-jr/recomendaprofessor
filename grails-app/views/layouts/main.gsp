<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
        <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>       
    <g:layoutHead/>
</head>
<body>
    <div id="grailsLogo" role="banner"><g:link class="home" controller="professor" action="index" ><asset:image src="grails_logo.png" alt="Grails"/></g:link></div>




<g:layoutBody/>
<div class="footer" role="contentinfo">

    <sec:ifNotLoggedIn>
        <div  style="float:left"><g:link  controller="user" action="register" >Faça aqui seu cadastro</g:link>&nbsp;</div>      
        <div style="float:right"><g:link  controller="login" action="index" >Entrar no sistema</g:link>&nbsp;</div>  
    </sec:ifNotLoggedIn>
    
     <sec:ifLoggedIn>
         <div  style="float:left"><g:link controller="user" action="editaPerfil" >Editar meu perfil</g:link>&nbsp;<br/>
            <br/> <g:link controller="aula" action="index" >Listar aulas ofertadas por mim</g:link>&nbsp;<br/><br/>
         </div><br/> <br/>      
        <div  style="float:right"><g:link  controller="logout" action="index" >Sair do sistema</g:link>&nbsp;<br/><br/> </div><br/>       
    </sec:ifLoggedIn>
    

    
    </div>
    <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
</body>
</html>
