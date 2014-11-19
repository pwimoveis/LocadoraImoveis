<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<center> <b><u> CADASTRO DE IMÓVEL </u></b></center> 
<br></br>
	<form action="" method="post">
		<table>
			<tr>
				<td> &nbsp;&nbsp;Código Imóvel: </td>
				<td><input type="text" size="35" name="codigoimovel">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Endereço: </td>
				<td><input type="text" size="35" name="enderecoimovel"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Comodos: </td>
				<td><input type="text" size="35" name="comodos">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Descrição: </td>
				<td><input type="text" size="35" name="descricao"></td>
			</tr>
		</table>
		<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Salvar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		 <input type="submit" value="Cancelar" onclick="location.href='consultaimovel.jsp'">
	</form>
</body>
</html>