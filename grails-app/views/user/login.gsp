<%@ page import="pnw.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta name="layout" content="main" />
	<title>Login</title>
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
	<g:form name="formCadastro" action="login">
		
		<p>Login: <input type="text" name="username" value="" id="loginField"/> </p>  
		<p>Senha: <input type="text" name="password" value="" id="passwordField"/> </p> 
		
	<p><input type="submit" value="Logar &rarr;" /></p>
	</g:form>	
	</div>
</body>
