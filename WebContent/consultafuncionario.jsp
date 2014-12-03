<%@page import="java.util.List"%>
<%@page import="br.com.model.Funcionario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:f="http://java.sun.com/jsf/core"
	xmlns:h="http://java.sun.com/jsf/html"
	xmlns:c="http://java.sun.com/jsp/jstl/core"
	
	>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 <script>
 	//CODIGOS
 	//PESQUISAR: 100
 	//NOVO: 200
 	//EDITAR: 300
 	//EXCLUIR: 400
 	
 	//Metodo executado quando botao editar da grid eh acionado
 	function editar(idElemento){
 		var elemGrid = document.getElementById("idAcaoGrid");
 		elemGrid.value = idElemento;
		botaoSubmit(300);  
	}
 	
 	//Metodo executado quando botao excluir da grid eh acionado
	function excluir(idElemento){
		var elemGrid = document.getElementById("idAcaoGrid");
 		elemGrid.value = idElemento;
		botaoSubmit(400);  
	}
	
	function botaoSubmit(botaoAcionado){
		//Pesquisar
		if(botaoAcionado == 100){
			//alert('botao pesquisar acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'PESQUISAR';
			
			//Submit do formulario
			document.getElementById("formFuncionarioPesquisa").submit();
		}
		
		//Novo
		//Não está sendo chamado por aqui, so na pagina de cadastro
		if(botaoAcionado == 200){
			//alert('botao novo acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'NOVO';
			
			//Submit do formulario
			document.getElementById("formFuncionarioPesquisa").submit();
		}
		
		//Editar
		if(botaoAcionado == 300){
			//alert('botao editar acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EDITAR';
			
			//Submit do formulario
			document.getElementById("formFuncionarioPesquisa").submit();
		}
		
		//Excluir
		if(botaoAcionado == 400){
			//alert('botao excluir acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EXCLUIR';
			
			//Submit do formulario
			document.getElementById("formFuncionarioPesquisa").submit();
		}
	}
</script>
</head>
<body>
<a href="login.jsp"> SAIR </a> 	<center> <b><u> CONSULTAR FUNCIONÁRIO </u></b></center>
<br></br>
<br></br>
	<form action="funcionario_controller" method="GET" id="formFuncionarioPesquisa">
	<input type="hidden" id="submitBotoes" value="" name="submitBotoes" />
	<input type="hidden" name="idAcaoGrid" id="idAcaoGrid" />
	
	<table>
	<tr>
		<td> &nbsp;&nbsp;Nome: </td>
		<td><input type="text" size="35" name="nome" value="<%=(request.getAttribute("nome") != null) ? request.getAttribute("nome") : ""%>" /></td>
	</tr>
	<tr>
		<td> &nbsp;&nbsp;RG: </td>
		<td><input type="text" size="35" name="rg" value="<%=(request.getAttribute("rg") != null) ? request.getAttribute("rg") : ""%>" /></td>
	</tr>
	</table>
<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;
	<input type="button" onclick="botaoSubmit(100)" value="Pesquisar" name="botaoPesquisarFuncionario" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="Novo" onclick="location.href='cadastrofuncionario.jsp'" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="Voltar" onclick="location.href='home.jsp'" />
		
<br/><br/><br/><br/><br/>
<table border="1">

  <tr>
  	<th bgcolor="#EDEDED">Ação</th>
    <th bgcolor="#EDEDED">Nome</th>
    <th bgcolor="#EDEDED">RG</th>
    <th bgcolor="#EDEDED">CPF</th>
    <th bgcolor="#EDEDED">Data Nasc.</th>
    <th bgcolor="#EDEDED">Endereco</th>
    <th bgcolor="#EDEDED">Telefone</th>
    <th bgcolor="#EDEDED">Login</th>
    <th bgcolor="#EDEDED">Email</th>
  </tr>

<%
List<Funcionario> funcionarioLista = (List<Funcionario>) request.getAttribute("funcionarioListRequest");
if(funcionarioLista != null && funcionarioLista.size() > 0){
	  System.out.println( "lista recuperada." ); 
	  for (int i = 0; i < funcionarioLista.size(); i++ ){
		  out.print("<tr>");
		  
		  out.print("<td>"); out.print("<img src=\"imagens/add.gif\" /><img src=\"imagens/add_bw.png\" onclick=\"excluir(" + funcionarioLista.get(i).getID() + ")\" />"); out.print("</td>");
		  out.print("<td>"); out.print(funcionarioLista.get(i).getNome()); out.print("</td>");
		  out.print("<td>"); out.print(funcionarioLista.get(i).getRg()); out.print("</td>");
		  out.print("<td>"); out.print(funcionarioLista.get(i).getCpf()); out.print("</td>");
		  out.print("<td>"); out.print(funcionarioLista.get(i).getDataNascimento()); out.print("</td>");
		  out.print("<td>"); out.print(funcionarioLista.get(i).getEndereco()); out.print("</td>");
		  out.print("<td>"); out.print(funcionarioLista.get(i).getTelefone()); out.print("</td>");
		  out.print("<td>"); out.print(funcionarioLista.get(i).getLogin()); out.print("</td>");
		  out.print("<td>"); out.print(funcionarioLista.get(i).getEmail()); out.print("</td>");
		  
		  out.print("</tr>");
		  
		  System.out.println("");		  
		  System.out.print("<tr>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print(funcionarioLista.get(i).getNome()); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print(funcionarioLista.get(i).getRg()); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print(funcionarioLista.get(i).getCpf()); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print(funcionarioLista.get(i).getDataNascimento()); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print(funcionarioLista.get(i).getEndereco()); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print(funcionarioLista.get(i).getTelefone()); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print(funcionarioLista.get(i).getLogin()); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print(funcionarioLista.get(i).getEmail()); System.out.print("</td>");
		  System.out.println("");
		  System.out.println("</tr>");
		  System.out.println("");
	  }
}
%>
 
 <!-- 
  <tr>
    <td> OK </td>
    <td> Renato </td>
    <td> 1234556 </td>
    <td> 32948372 </td>
    <td> 25/02/1989 </td>
    <td> renato@renato.com </td>
    <td> Rua B </td>
  </tr>
-->
  </table>
</form>
</body>
</html>