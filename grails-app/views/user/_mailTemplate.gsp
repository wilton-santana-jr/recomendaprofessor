<%@ page contentType="text/html;charset=UTF-8" %>
<div>
    <h1> Email de Confirmação do Recomenda Reforço</h1>

    <g:link absolute="true" controller="user" action="confirm" id="${code}">Clique no link para confirmar a sua conta no recomenda reforço!</g:link>

    <g:createLink absolute="true" controller="user" action="confirm" id="${code}"></g:createLink>
</div>
