<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
 	<center> <b><u> CONSULTAR CONTRATO </u></b></center> 
<br></br>
<br></br>
	<form action="" method="post">
	<table>
	<tr>
		<td> &nbsp;&nbsp;Cliente: </td>
		<td><input type="text" size="35" name="cliente"></td>
	</tr>
	<tr>
		<td> &nbsp;&nbsp;Número: </td>
		<td><input type="text" size="35" name="numero"></td>
	</tr>
	</table>
<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Pesquisar"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="Novo" onclick="location.href='cadastrocontrato.jsp'">
<br/><br/><br/><br/><br/>
<table border="1">

  <tr>
    <th bgcolor="#EDEDED">Ação</th>
    <th bgcolor="#EDEDED">Número</th>
    <th bgcolor="#EDEDED">Funcionário</th>
    <th bgcolor="#EDEDED">Cliente</th>
    <th bgcolor="#EDEDED">CPF</th>
    <th bgcolor="#EDEDED">Data Início.</th>
    <th bgcolor="#EDEDED">Data Fim</th>
    <th bgcolor="#EDEDED">Valor</th>
  </tr>
  <tr>
    <td> OK </td>
    <td> 01</td>
    <td> Alex </td>
    <td> Fernando </td>
    <td> 25000909 </td>
    <td> 14/11/14 </td>
    <td> 01/01/15 </td>
    <td> 5.000,00</td>
  </tr>
  
  </table>
</form>
</body>
</html>