
<%@ page import="pnw.PessoaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pessoaJuridica.label', default: 'PessoaJuridica')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'pessoaJuridica.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'pessoaJuridica.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'pessoaJuridica.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="age" title="${message(code: 'pessoaJuridica.age.label', default: 'Age')}" />
                        
                            <g:sortableColumn property="cnpj" title="${message(code: 'pessoaJuridica.cnpj.label', default: 'Cnpj')}" />
                        
                            <g:sortableColumn property="razaoSocial" title="${message(code: 'pessoaJuridica.razaoSocial.label', default: 'Razao Social')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pessoaJuridicaInstanceList}" status="i" var="pessoaJuridicaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pessoaJuridicaInstance.id}">${fieldValue(bean: pessoaJuridicaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: pessoaJuridicaInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: pessoaJuridicaInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: pessoaJuridicaInstance, field: "age")}</td>
                        
                            <td>${fieldValue(bean: pessoaJuridicaInstance, field: "cnpj")}</td>
                        
                            <td>${fieldValue(bean: pessoaJuridicaInstance, field: "razaoSocial")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pessoaJuridicaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
