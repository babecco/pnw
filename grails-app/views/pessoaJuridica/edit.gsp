

<%@ page import="pnw.PessoaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pessoaJuridica.label', default: 'PessoaJuridica')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pessoaJuridicaInstance}">
            <div class="errors">
                <g:renderErrors bean="${pessoaJuridicaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${pessoaJuridicaInstance?.id}" />
                <g:hiddenField name="version" value="${pessoaJuridicaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="pessoaJuridica.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaJuridicaInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${pessoaJuridicaInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="pessoaJuridica.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaJuridicaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${pessoaJuridicaInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="age"><g:message code="pessoaJuridica.age.label" default="Age" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaJuridicaInstance, field: 'age', 'errors')}">
                                    <g:textField name="age" value="${fieldValue(bean: pessoaJuridicaInstance, field: 'age')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cnpj"><g:message code="pessoaJuridica.cnpj.label" default="Cnpj" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaJuridicaInstance, field: 'cnpj', 'errors')}">
                                    <g:textField name="cnpj" value="${pessoaJuridicaInstance?.cnpj}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="razaoSocial"><g:message code="pessoaJuridica.razaoSocial.label" default="Razao Social" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaJuridicaInstance, field: 'razaoSocial', 'errors')}">
                                    <g:textField name="razaoSocial" value="${pessoaJuridicaInstance?.razaoSocial}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
