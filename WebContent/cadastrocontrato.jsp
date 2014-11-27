<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<a href="login.jsp"> SAIR </a><center> <b><u> CADASTRO DE CONTRATO </u></b></center> 
<br></br>
	<form action="" method="post">
		<table>
			<tr>
				<td> &nbsp;&nbsp;Número: </td>
				<td><input type="text" size="35" name="numcontrato">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Funcionário: </td>
				<td><input type="text" size="35" name="nomefunc"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Cliente: </td>
				<td><input type="text" size="35" name="nome">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Data Início: </td>
				<td><input type="text" size="35" name="datainicio"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Data Fim: </td>
				<td><input type="text" size="35" name="datafim"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Valor: </td>
				<td><input type="text" size="35" name="valor"></td>
			</tr>
		</table>
		<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Salvar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		 <input type="button" value="Cancelar" onclick="location.href='consultacontrato.jsp'">
	</form>
</body>
</html>