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
		<div id="site-name">PNW - Editar Licitação</div>
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
			
			<h1>Home</h1>
		
			<a href="/pnw/user/login/"> Logar no sistema </a>
			<a href="/pnw/user/create/"> Registrar-se no sistema </a>
		
			<div id="footer">
			<p>A forma mais fácil de publicar sua licitação na web.</p>
			<p><a href="/pnw/">PNW - Licitações</a> | <a href="#">Tortor</a> | <a href="#">Pulvinar</a></p>
			</div>
		
		</div>
		
	</div>

</div>
</body>
</html>
