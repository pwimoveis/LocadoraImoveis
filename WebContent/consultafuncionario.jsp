<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<a href="login.jsp"> SAIR </a> 	<center> <b><u> CONSULTAR FUNCIONÁRIO </u></b></center> 
<br></br>
<br></br>
	<form action="" method="post">
	<table>
	<tr>
		<td> &nbsp;&nbsp;Nome: </td>
		<td><input type="text" size="35" name="nome"></td>
	</tr>
	<tr>
		<td> &nbsp;&nbsp;RG: </td>
		<td><input type="text" size="35" name="rg"></td>
	</tr>
	</table>
<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Pesquisar"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="Novo" onclick="location.href='cadastrofuncionario.jsp'">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="Voltar" onclick="location.href='home.jsp'">
<br/><br/><br/><br/><br/>
<table border="1">

  <tr>
    <th bgcolor="#EDEDED">Ação</th>
    <th bgcolor="#EDEDED">Nome</th>
    <th bgcolor="#EDEDED">RG</th>
    <th bgcolor="#EDEDED">CPF</th>
    <th bgcolor="#EDEDED">Data Nasc.</th>
    <th bgcolor="#EDEDED">Email</th>
    <th bgcolor="#EDEDED">Endereço</th>
  </tr>
  <tr>
    <td> OK </td>
    <td> Renato </td>
    <td> 1234556 </td>
    <td> 32948372 </td>
    <td> 25/02/1989 </td>
    <td> renato@renato.com </td>
    <td> Rua B </td>
  </tr>
  
  </table>
</form>
</body>
</html>