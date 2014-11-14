<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
 	<center> <b><u> CONSULTAR PROPOSTA </u></b></center> 
<br></br>
<br></br>
	<form action="" method="post">
	<table>
	<tr>
		<td> &nbsp;&nbsp;Cliente: </td>
		<td><input type="text" size="35" name="cliente"></td>
	</tr>
	<tr>
		<td> &nbsp;&nbsp;Corretor: </td>
		<td><input type="text" size="35" name="corretor"></td>
	</tr>
	
</table>
<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Pesquisar"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="Novo" onclick="location.href='cadastroproposta.jsp'">
<br/><br/><br/><br/><br/>
<table border="1">

  <tr>
    <th bgcolor="#EDEDED">Ação</th>
    <th bgcolor="#EDEDED">Número</th>
    <th bgcolor="#EDEDED">Corretor</th>
    <th bgcolor="#EDEDED">Cliente</th>
    <th bgcolor="#EDEDED">CPF</th>
    <th bgcolor="#EDEDED">Data Inicio</th>
    <th bgcolor="#EDEDED">Data Fim</th>
    <th bgcolor="#EDEDED">Valor</th>
  </tr>
  <tr>
    <td> OK </td>
    <td> 12345 </td>
    <td> Fernando </td>
    <td> Daniel Paz </td>
    <td> 43434345 </td>
    <td> 14/11/2014 </td>
    <td> 30/11/2014</td>
    <td> 10.000,00</td>
  </tr>
  </table>
</form>
</body>
</html>