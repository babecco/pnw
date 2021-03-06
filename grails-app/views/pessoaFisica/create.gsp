

<%@ page import="pnw.PessoaFisica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pessoaFisica.label', default: 'PessoaFisica')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pessoaFisicaInstance}">
            <div class="errors">
                <g:renderErrors bean="${pessoaFisicaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="pessoaFisica.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaFisicaInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${pessoaFisicaInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="pessoaFisica.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaFisicaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${pessoaFisicaInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="age"><g:message code="pessoaFisica.age.label" default="Age" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaFisicaInstance, field: 'age', 'errors')}">
                                    <g:textField name="age" value="${fieldValue(bean: pessoaFisicaInstance, field: 'age')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cpf"><g:message code="pessoaFisica.cpf.label" default="Cpf" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaFisicaInstance, field: 'cpf', 'errors')}">
                                    <g:textField name="cpf" value="${pessoaFisicaInstance?.cpf}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
