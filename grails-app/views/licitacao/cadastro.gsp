<%@ page import="pnw.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<meta name="layout" content="main" />
	<title>Cadastro</title>
	<script type="text/javascript" language="javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
	
	<style type="text/css" media="screen">
	
	</style>
	
</head>

<body>
	
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
	
	<div  id="cadastro">
	<g:form name="formCadastro" action="cadastrar"> 
		<p>Usuário: <input type="text" name="username" value="" id="loginField"/> </p>  
		<p>Link para o edital: <input type="text" name="edital" value="" id="editalField" /> </p>
		<p>Tag1: <input type="text" name="tag1" value="" id="tag1Field" />	</p>	
		<p>Tag2: <input type="text" name="tag2" value="" id="tag2Field" /></p>
		<p>Tag3: <input type="text" name="tag3" value="" id="tag3Field" /></p>
		<p>Categoria: <select name="categoria" id="categoriaSelect">
			<g:each in="${Categoria.list()}">
				<option value="${it.id}"> ${it.tipo} </option>
			</g:each>
		</select>
	<p><input type="submit" value="Continue &rarr;" /></p>
	</g:form>	
	</div>
	
</body>
