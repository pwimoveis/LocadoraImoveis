<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
 	//CODIGOS
 	//PESQUISAR: 100
 	//NOVO: 200
 	//EDITAR: 300
 	//EXCLUIR: 400
 	//SALVAR: 500
 	
	
	function botaoSubmit(botaoAcionado){
		//Pesquisar
		if(botaoAcionado == 100){
			//alert('botao pesquisar acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'PESQUISAR';
			
			//Submit do formulario
			document.getElementById("formFuncionarioNovo").submit();
		}
		
		//Novo e Editar (tela de cadastro)
		if(botaoAcionado == 200){
			//alert('botao novo acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'NOVO_EDITAR';
			
			//Submit do formulario
			document.getElementById("formFuncionarioNovo").submit();
		}
		
		//Editar (tela de consulta - botao grid)
		if(botaoAcionado == 300){
			//alert('botao editar acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EDITAR';
			
			//Submit do formulario
			document.getElementById("formFuncionarioNovo").submit();
		}
		
		//Excluir
		if(botaoAcionado == 400){
			//alert('botao excluir acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EXCLUIR';
			
			//Submit do formulario
			document.getElementById("formFuncionarioNovo").submit();
		}
				
	}
</script>
</head>
<body>
<a href="login.jsp"> SAIR </a><center> <b><u> CADASTRO DE FUNCIONÁRIO </u></b></center> 
<br></br>
	<form action="funcionario_controller" method="get" id="formFuncionarioNovo">
	<input type="hidden" id="submitBotoes" value="" name="submitBotoes" />
	<input type="hidden" name="idEditar" id="idEditar" value="<%=(request.getAttribute("idFuncionarioEditar") != null) ? request.getAttribute("idFuncionarioEditar") : ""%>" />
		<table>
			<tr>
				<td> &nbsp;&nbsp;Nome: </td>
				<td><input type="text" size="35" name="nome" value="<%=(request.getAttribute("nome") != null) ? request.getAttribute("nome") : ""%>" />
			</tr>
			<tr>
				<td> &nbsp;&nbsp;RG: </td>
				<td><input type="text" size="35" name="rg" value="<%=(request.getAttribute("rg") != null) ? request.getAttribute("rg") : ""%>">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;CPF: </td>
				<td><input type="text" size="35" name="cpf" value="<%=(request.getAttribute("cpf") != null) ? request.getAttribute("cpf") : ""%>" /></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Data Nasc.: </td>
				<td><input type="text" size="35" name="datanasc" value="<%=(request.getAttribute("datanasc") != null) ? request.getAttribute("datanasc") : ""%>" /></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Endereço: </td>
				<td><input type="text" size="35" name="endereco" value="<%=(request.getAttribute("endereco") != null) ? request.getAttribute("endereco") : ""%>" /></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Telefone: </td>
				<td><input type="text" size="35" name="telefone" value="<%=(request.getAttribute("telefone") != null) ? request.getAttribute("telefone") : ""%>" /></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Email: </td>
				<td><input type="text" size="35" name="email" value="<%=(request.getAttribute("email") != null) ? request.getAttribute("email") : ""%>" /></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Login: </td>
				<td><input type="text" size="35" name="login" value="<%=(request.getAttribute("login") != null) ? request.getAttribute("login") : ""%>" /></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Senha: </td>
				<td><input type="text" size="35" name="senha" value="<%=(request.getAttribute("senha") != null) ? request.getAttribute("senha") : ""%>" /></td>
			</tr>
		</table>
		<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="Salvar" onclick="botaoSubmit(200)" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		 <input type="button" value="Cancelar" onclick="location.href='consultafuncionario.jsp'" />
	</form>
</body>
</html>