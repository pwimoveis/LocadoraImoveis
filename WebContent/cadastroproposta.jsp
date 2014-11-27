<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<a href="login.jsp"> SAIR </a><center> <b><u> CADASTRO DE PROPOSTA </u></b></center> 
<br></br>
	<form action="" method="post">
		<table>
			<tr>
				<td> &nbsp;&nbsp;Cliente: </td>
				<td><input type="text" size="35" name="codigoimovel">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Corretor: </td>
				<td><input type="text" size="35" name="enderecoimovel"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Data início: </td>
				<td><input type="text" size="35" name="datainicio">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Venc/Proposta: </td>
				<td><input type="text" size="35" name="vencproposta"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Valor: </td>
				<td><input type="text" size="35" name="valor"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Desconto: </td>
				<td><input type="text" size="35" name="desconto"></td>
			</tr>
		</table>
		<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Salvar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		 <input type="button" value="Cancelar" onclick="location.href='consultaproposta.jsp'">
	</form>
</body>
</html>