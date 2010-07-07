
<%@ page import="pnw.PessoaFisica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pessoaFisica.label', default: 'PessoaFisica')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'pessoaFisica.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'pessoaFisica.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'pessoaFisica.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="age" title="${message(code: 'pessoaFisica.age.label', default: 'Age')}" />
                        
                            <g:sortableColumn property="cpf" title="${message(code: 'pessoaFisica.cpf.label', default: 'Cpf')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pessoaFisicaInstanceList}" status="i" var="pessoaFisicaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pessoaFisicaInstance.id}">${fieldValue(bean: pessoaFisicaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: pessoaFisicaInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: pessoaFisicaInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: pessoaFisicaInstance, field: "age")}</td>
                        
                            <td>${fieldValue(bean: pessoaFisicaInstance, field: "cpf")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pessoaFisicaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
