<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<a href="login.jsp"> SAIR </a><center> <b><u> CADASTRO DE CLIENTE </u></b></center> 
<br></br>
	<form action="" method="post">
		<table>
			<tr>
				<td> &nbsp;&nbsp;Nome: </td>
				<td><input type="text" size="35" name="nome">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Tipo de Pessoa: </td>
				<td><input type="text" size="35" name="tipopessoa"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;RG: </td>
				<td><input type="text" size="35" name="rg">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;CPF/CNPJ: </td>
				<td><input type="text" size="35" name="cpfcnpj"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Endereço: </td>
				<td><input type="text" size="35" name="endereco"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;E-mail: </td>
				<td><input type="text" size="35" name="email"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Telefone: </td>
				<td><input type="text" size="35" name="telefone"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Data de Nascimento: </td>
				<td><input type="text" size="35" name="cpfcnpj"></td>
			</tr>
		</table>
		<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Salvar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		 <input type="button" value="Cancelar" onclick="location.href='consultacliente.jsp'">
	</form>
</body>
</html>