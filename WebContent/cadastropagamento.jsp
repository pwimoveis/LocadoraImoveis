<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<center> <b><u> CADASTRO DE PAGAMENTO </u></b></center> 
<br></br>
	<form action="" method="post">
		<table>
			<tr>
				<td> &nbsp;&nbsp;Tipo de Pagamento: </td>
				<td><input type="text" size="35" name="tipopgto">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Data Vencimento: </td>
				<td><input type="text" size="35" name="datavenc"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Data Pagamento: </td>
				<td><input type="text" size="35" name="datapagto">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Valor Original: </td>
				<td><input type="text" size="35" name="valororiginal"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Valor Pago: </td>
				<td><input type="text" size="35" name="valorpago"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Número Contrato: </td>
				<td><input type="text" size="35" name="numcontrato"></td>
			</tr>
			</table>
			<br>
			<tr>
				<td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="pago">Pago</td>
			</tr>
		<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Salvar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		 <input type="submit" value="Cancelar" onclick="location.href='consultapagamento.jsp'">
	</form>
</body>
</html>