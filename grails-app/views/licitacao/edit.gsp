

<%@ page import="pnw.Licitacao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'licitacao.label', default: 'Licitacao')}" />
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
            <g:hasErrors bean="${licitacaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${licitacaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${licitacaoInstance?.id}" />
                <g:hiddenField name="version" value="${licitacaoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="categoria"><g:message code="licitacao.categoria.label" default="Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: licitacaoInstance, field: 'categoria', 'errors')}">
                                    <g:select name="categoria.id" from="${pnw.Categoria.list()}" optionKey="id" value="${licitacaoInstance?.categoria?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lotes"><g:message code="licitacao.lotes.label" default="Lotes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: licitacaoInstance, field: 'lotes', 'errors')}">
                                    <g:select name="lotes" from="${pnw.Lote.list()}" multiple="yes" optionKey="id" size="5" value="${licitacaoInstance?.lotes*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="propostas"><g:message code="licitacao.propostas.label" default="Propostas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: licitacaoInstance, field: 'propostas', 'errors')}">
                                    <g:select name="propostas" from="${pnw.Proposta.list()}" multiple="yes" optionKey="id" size="5" value="${licitacaoInstance?.propostas*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tags"><g:message code="licitacao.tags.label" default="Tags" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: licitacaoInstance, field: 'tags', 'errors')}">
                                    
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
