<%@ page import="pnw.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta name="layout" content="main" />
	<title>Cadastro</title>
	<script type="text/javascript" language="javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function(){
		$("input[name='typeCadastro']").change(function(){
			if ($("input[name='typeCadastro']:checked").val() == "fisica") {
				$("#formPessoaFisica").removeClass("hiddenForm")
				$("#formPessoaJuridica").addClass("hiddenForm")
			} else {
				$("#formPessoaFisica").addClass("hiddenForm")
				$("#formPessoaJuridica").removeClass("hiddenForm")
			}		
		});
	});
</script>

<style type="text/css" media="screen">
	.hiddenForm {display:none}
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
	<g:form name="formCadastro" action="create">
		<p>Escolha o tipo de cadastro:</p> 
			
		<p> Física: <input type="radio" name="typeCadastro" value="fisica" id="radio1" /> <br/>	
		Jurídica: <input type="radio" name="typeCadastro" value="juridica" id="radio2" /> </p> 
		
		<p>Login: <input type="text" name="username" value="" id="loginField"/> </p>  
		<p>Senha: <input type="text" name="password" value="" id="passwordField"/> </p> 
		<p>Confirma: <input type="text" name="confirm" value="" id="confirmField"/> </p> 

		<p>Email: <input type="text" name="email" value="" id="emailField" /> </p> 
					
		<div id="formPessoaFisica" class="hiddenForm">
			<p>CPF: <input type="text" name="cpf" value="" id="cpfField" maxlength="11"/></p>
			<p>Nome:  <input type="text" name="name" value="" id="nameField" /></p>
		</div>

		<div id="formPessoaJuridica" class="hiddenForm">
			<p>CNPJ: <input type="text" name="cnpj" value="" id="cnpjField" maxlength="14"/></p>
			<p>Razão Social:  <input type="text" name="razaoSocial" value="" id="razaoField" /></p>
		</div>
	
	<p><input type="submit" value="Continue &rarr;" /></p>
	</g:form>	
	</div>
</body>
