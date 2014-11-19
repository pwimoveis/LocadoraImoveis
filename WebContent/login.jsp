<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body> 
<br/><br/><br/><br/><br/><br/><br/><br/>
<body background="">
	<center>
	<img src="imagens/logopw.jpg">
	<br/><br/><br/><br/><br/><br/>

	<form action="loginservlet" method="post">
		<font color="red" size="+1">
			<%  
			    if(null!=request.getAttribute("mensagemErro"))
			    {
			        out.println(request.getAttribute("mensagemErro"));
			    }
			%>
		</font>
		
		<table>
			<tr>
				<td> Login: </td>
				<td><input type="text" name="login" size="35">
			</tr>
			<tr>
				<td> Senha: </td>
				<td><input type="password" name="senha" size="35"></td>
			</tr>
			<tr>
		</table>
		<input type="submit" value="Entrar">
	</form>
	</center>
</body>
</html>