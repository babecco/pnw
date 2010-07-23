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
<link rel="stylesheet" type="text/css" href="${url(html/css/main.css)}" media="screen" />
<link rel="stylesheet" type="text/css" href="${url(html/css/print.css)}" media="print" />
<!--[if lte IE 6]>
<link rel="stylesheet" type="text/css" href="css/ie6_or_less.css" />
<![endif]-->
<script type="text/javascript" src="${url(html/js/common.js)}"></script>
<script type="text/javascript" src="${url(html/js/jquery-latest.js)}"></script>
<script type="text/javascript" src="${url(html/js/jquery.validate.js)}"></script>
<script type="text/javascript" src="${url(html/js/default.js)}"></script>
</head>
<body id="type-a">
<div id="wrap">

	<div id="header">
		<div id="site-name">PNW - Licitações</div>
		<div id="search">
			<form action="">
			<label for="searchsite">Site Search:</label>
			<input id="searchsite" name="searchsite" type="text" />
			<input type="submit" value="Go" class="f-submit" />
			</form>
		</div>
		<ul id="nav">
		<li class="first"><a href="#">Home</a></li>
		<li class="active"><a href="#">Licitações</a>
			<ul>
			<li class="first"><a href="#">Listar</a></li>
			<li class="active"><a href="#">Cadastrar</a></li>
			<li><a href="#">Categorias</a></li>
			<li class="last"><a href="#">Últimas do Sistema</a></li>
			</ul>
		</li>
		<li><a href="#">Client list</a>
			<ul>
			<li class="first"><a href="#">Maecenas</a></li>
			<li><a href="#">Phasellus</a></li>
			<li><a href="#">Mauris sollicitudin</a></li>
			<li class="last"><a href="#">Mauris at enim</a></li>
			</ul>
		</li>
		<li><a href="#">Case Studies &amp; References</a>
			<ul>
			<li class="first"><a href="#">Maecenas</a></li>
			<li><a href="#">Phasellus</a></li>
			<li><a href="#">Mauris sollicitudin</a></li>
			<li><a href="#">Phasellus</a></li>
			<li><a href="#">Mauris sollicitudin</a></li>
			<li><a href="#">Phasellus</a></li>
			<li><a href="#">Mauris sollicitudin</a></li>
			<li><a href="#">Phasellus</a></li>
			<li><a href="#">Mauris sollicitudin</a></li>
			<li><a href="#">Phasellus</a></li>
			<li><a href="#">Mauris sollicitudin</a></li>
			<li class="last"><a href="#">Mauris at enim</a></li>
			</ul>
		</li>
		<li class="last"><a href="#">Locations</a>
			<ul>
			<li class="first"><a href="#">Maecenas</a></li>
			<li><a href="#">Phasellus</a></li>
			<li><a href="#">Mauris sollicitudin</a></li>
			<li class="last"><a href="#">Mauris at enim</a></li>
			</ul>
		</li>
		</ul>
	</div>
	
	<div id="content-wrap">
	
		<div id="content">
		
			<div id="breadcrumb">
			<a href="#">Home</a> / <a href="devtodo">Section Name</a> / <strong>Page Name</strong>
			</div>
			
			<h1>Cadastro de Licitação</h1>
            <p>Insira as informações necessárias para o cadastro da licitação.</p>

            <!-- o id tem que ser cadastrar-licitacao para a validacao com jquery funcionar -->
            <g:form name="formCadastroLicitacao" action="cadastrar" enctype="multipart/form-data" class="f-wrap-1">
			
			<div class="req"><b>*</b> Indica quais são os campos obrigatórios.</div>
			
			<fieldset>
			
			<h3>Cadastro de Licitação</h3>
			
			<label for="edital"><b><span class="req">*</span>Arquivo do edital:</b>
			<!--<input id="edital" name="edital" type="file" class="f-name required" tabindex="1" /><br /></label>-->
			<input id="edital" name="edital" type="text" class="f-name required" tabindex="1" /><br /></label>		
			
			<label for="username"><b><span class="req">*</span>Nome do usuário-dono:</b>
			<input id="username" name="username" type="text" class="f-name required" tabindex="2" /><br /></label>			
            <label for="descricao"><b><span class="req">*</span>Descrição:</b>
			<textarea id="descricao" name="descricao" class="f-comments required" rows="6" cols="20" tabindex="15"></textarea><br />
			</label>
			
            <label for="tag 1"><b>Tag 1:</b>
			<input id="tag1" name="tag1" type="text" class="f-name" tabindex="3" /><br />
			</label>
			
			<label for="tag 2"><b>Tags 2:</b>
			<input id="tag2" name="tag2" type="text" class="f-name" tabindex="4" /><br />
			</label>
			
			<label for="tag 3"><b>Tags 3:</b>
			<input id="tag3" name="tag3" type="text" class="f-name" tabindex="5" /><br />
			</label>
			
			<label for="categoria"><b>Tags (separados por espaço):</b>
			<input id="categoria" name="categoria" type="text" class="f-name" tabindex="6" /><br />
			</label>
			
			<div class="f-submit-wrap">
			<input type="submit" value="Submit" class="f-submit" tabindex="16" /><br />
			</div>
			</fieldset>
			</g:form>
		
			<div id="footer">
			<p>A forma mais fácil de publicar sua licitação na web.</p>
			<p><a href="#">PNW - Licitações</a> | <a href="#">Tortor</a> | <a href="#">Pulvinar</a></p>
			</div>
		
		</div>
		
		<div id="poweredby"><a href="http://farcry.daemon.com.au/"><img src="${url(html/wsimages/mollio.gif)}" alt="FarCry - Mollio" /></a></div>
		
	</div>

</div>
</body>
</html>
