<%@ page import="pnw.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--
Copyright: Daemon Pty Limited 2006, http://www.daemon.com.au
Community: Mollio http://www.mollio.org $
License: Released Under the "Common Public License 1.0", 
http://www.opensource.org/licenses/cpl.php
License: Released Under the "Creative Commons License", 
http://creativecommons.org/licenses/by/2.5/
License: Released Under the "GNU Creative Commons License", 
http://creativecommons.org/licenses/GPL/2.0/
-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>PNW - Cadastro de Licitações</title>
<link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'html/css', file:'main.css')}" media="screen" />
<link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'css', file:'main.css')}" media="screen" />
<link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'html/css', file:'print.css')}" media="print" />
<!--[if lte IE 6]>
<link rel="stylesheet" type="text/css" href="css/ie6_or_less.css" />
<![endif]-->
<script type="text/javascript" src="${createLinkTo(dir:'html/js', file:'common.js')}"></script>
<script type="text/javascript" src="${createLinkTo(dir:'html/js', file:'jquery-latest.js')}"></script>
<script type="text/javascript" src="${createLinkTo(dir:'html/js', file:'jquery.validate.js')}"></script>
<script type="text/javascript" src="${createLinkTo(dir:'html/js', file:'default.js')}"></script>
</head>
<body id="type-a">
<div id="wrap">

	<div id="header">
		<div id="site-name">PNW - Cadastro de Licitações</div>
		<!--<div id="search">
			<form action="">
			<label for="searchsite">Site Search:</label>
			<input id="searchsite" name="searchsite" type="text" />
			<input type="submit" value="Go" class="f-submit" />
			</form>
		</div>-->
		<ul id="nav">
		<li class="first"><a href="/pnw/">Home</a></li>
		<li class="active"><a href="#">Licitações</a>
			<ul>
			<li class="first"><a href="/pnw/licitacao/list/">Listar</a></li>
			<li class="active"><a href="/pnw/licitacao/create/">Cadastrar</a></li>
			<li><a href="/pnw/licitacao/listaPorCategoria/">Categorias</a></li>
			<li class="last"><a href="/pnw/licitacao/last/">Últimas do Sistema</a></li>
			</ul>
		</li>
		<li><a href="#">Comunidade</a>
			<ul>
			<li class="first"><a href="#">Usuários</a></li>
			<li><a href="#">Regiões</a></li>
			<li class="last"><a href="#">Estatísticas</a></li>
			</ul>
		</li>
		<li class="last"><a href="#">Sobre</a>
			<ul>
			<li class="first"><a href="#">Equipe</a></li>
			<li><a href="#">Documentação</a></li>
			<li class="last"><a href="#">Disciplina</a></li>
			</ul>
		</li>
		</ul>
	</div>
	
	<div id="content-wrap">
	
		<div id="content">
		
			<div id="breadcrumb">
			<a href="/pnw/">Home</a> / <a href="/pnw/licitacao/">Licitação</a> / <strong>Cadastro</strong>
			</div>
			
			<h1>Cadastro de Licitação</h1>
			
			<div id="message">
				<g:if test="${flash.message}">
					<div class="message">${flash.message}</div>
				</g:if>
			</div>	
					
			<div id="errorMessage">
			<g:hasErrors bean="${itemInstance}">
				    <div class="errors">
				        <g:renderErrors bean="${itemInstance}" as="list" />
				    </div>
				    </g:hasErrors>
			</div>
			
            <p>Insira as informações necessárias para o cadastro da licitação.</p>

            <!-- o id tem que ser cadastrar-licitacao para a validacao com jquery funcionar -->
            <g:form name="form-cadastro-licitacao" action="create" enctype="multipart/form-data" class="f-wrap-1">
			
			<div class="req"><b>*</b> Indica quais são os campos obrigatórios.</div>
			
			<fieldset>
			
			<h3>Cadastro de Licitação</h3>
			
			<label for="edital"><b><span class="req">*</span>Arquivo do edital:</b>
			<!--<input id="edital" name="edital" type="file" class="f-name required" tabindex="1" /><br /></label>-->
			<input id="edital" name="edital" type="text" class="f-name required" tabindex="1" /><br /></label>		
			
			<label for="fim da primeira fase"><b>Data final para envio de propostas:</b>
			<g:datePicker id="fimPrimeiraFase" name="fimPrimeiraFase" value="${new Date()}" precision="hour" years="${2010..2020}" class="f-name required" tabindex="2"/>
			</label>	
			
            <label for="tag 1"><b>Tag 1:</b>
			<input id="tag1" name="tag1" type="text" class="f-name" tabindex="3" /><br />
			</label>
			
			<label for="tag 2"><b>Tag 2:</b>
			<input id="tag2" name="tag2" type="text" class="f-name" tabindex="4" /><br />
			</label>
			
			<label for="tag 3"><b>Tag 3:</b>
			<input id="tag3" name="tag3" type="text" class="f-name" tabindex="5" /><br />
			</label>
			
			<label for="categoria"><b>Categoria:</b>
			<select name="categoria" class="f-name" tabindex="6">
				<g:each in="${Categoria.list()}">
				<option value="${it.id}">${it.tipo}</option>
				</g:each>
			</select>
			
			 <label for="descricao"><b><span class="req">*</span>Descrição:</b>
			<textarea id="descricao" name="descricao" class="f-comments required" rows="6" cols="20" tabindex="16"></textarea><br />
			</label>
			
			
			</label>
			
			<div class="f-submit-wrap">
			<input type="submit" value="Submit" class="f-submit" tabindex="17" /><br />
			</div>
			</fieldset>
			</g:form>
		
			<div id="footer">
			<p>A forma mais fácil de publicar sua licitação na web.</p>
			<p><a href="#">PNW - Licitações</a> | <a href="#">Tortor</a> | <a href="#">Pulvinar</a></p>
			</div>
		
		</div>
		
	</div>

</div>
</body>
</html>
