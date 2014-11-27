<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
 	<center> <b><u> CONSULTAR PAGAMENTO </u></b></center> 
<br></br>
<br></br>
	<form action="" method="post">
	<table>
	<tr>
		<td> &nbsp;&nbsp;Número Contrato: </td>
		<td><input type="text" size="35" name="numcontrato"></td>
	</tr>
	
	
</table>
<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Pesquisar"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="Novo" onclick="location.href='cadastropagamento.jsp'">
<br/><br/><br/><br/><br/>
<table border="1">

  <tr>
    <th bgcolor="#EDEDED">Ação</th>
    <th bgcolor="#EDEDED">Número Contrato</th>
    <th bgcolor="#EDEDED">Data Vencimento</th>
    <th bgcolor="#EDEDED">Data Pagamento</th>
    <th bgcolor="#EDEDED">Pago</th>
    
  </tr>
  <tr>
    <td> OK </td>
    <td> 12345 </td>
    <td> 25/11/2014 </td>
    <td> 24/11/2014 </td>
    <td> SIM </td>
    
  </tr>
  </table>
</form>
</body>
</html>