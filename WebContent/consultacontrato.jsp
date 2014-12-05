<%@page import="java.util.List"%>
<%@page import="br.com.model.Contrato"%>
<%@page import="br.com.model.Funcionario"%>
<%@page import="br.com.model.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head xmlns="http://www.w3.org/1999/xhtml"
	  xmlns:f="http://java.sun.com/jsf/core"
	  xmlns:h="http://java.sun.com/jsf/html"
	  xmlns:c="http://java.sun.com/jsp/jstl/core">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
 	//CODIGOS
 	//PESQUISAR: 100
 	//NOVO: 200
 	//EDITAR: 300
 	//EXCLUIR: 400
 	//SALVAR: 500
 	//NOVO:600 Carrega Combos
 	
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
			document.getElementById("formContratoPesquisa").submit();
		}
		
		//Novo
		//Não está sendo chamado por aqui, so na pagina de cadastro
		if(botaoAcionado == 200){
			//alert('botao novo acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'NOVO';
			
			//Submit do formulario
			document.getElementById("formContratoPesquisa").submit();
		}
		
		//Editar
		if(botaoAcionado == 300){
			//alert('botao editar acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EDITAR';
			
			//Submit do formulario
			document.getElementById("formContratoPesquisa").submit();
		}
		
		//Excluir
		if(botaoAcionado == 400){
			//alert('botao excluir acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EXCLUIR';
			
			//Submit do formulario
			document.getElementById("formContratoPesquisa").submit();
		}
		
		//Excluir
		if(botaoAcionado == 600){
			//alert('botao excluir acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'NOVO_COMBO';
			
			//Submit do formulario
			document.getElementById("formContratoPesquisa").submit();
		}
	}
	
	
</script>
</head>
<body>
<a href="login.jsp"> SAIR </a> 	<center> <b><u> CONSULTAR CONTRATO </u></b></center> 
<br></br>
<br></br>
	<form action="contrato_controller" method="GET" id="formContratoPesquisa">
	<input type="hidden" id="submitBotoes" value="" name="submitBotoes" />
	<input type="hidden" name="idAcaoGrid" id="idAcaoGrid" />
	<table id="tableFiltro">
	<tr>
		<td> &nbsp;&nbsp;Cliente: </td>
		<td><input type="text" size="35" name="cliente" value="<%=(request.getAttribute("cliente") != null) ? request.getAttribute("cliente") : ""%>" /></td>
	</tr>
	<tr>
		<td> &nbsp;&nbsp;Número: </td>
		<td><input type="text" size="35" name="nome" value="<%=(request.getAttribute("numero") != null) ? request.getAttribute("numero") : ""%>" /></td>
	</tr>
	</table>
<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;
	<input type="button" onclick="botaoSubmit(100)" value="Pesquisar" name="botaoPesquisarContrato" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" onclick="botaoSubmit(600)" value="Novo" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="Voltar" onclick="location.href='home.jsp'" />
<br/><br/><br/><br/><br/>
<table id="tableGrid" border="1" style="width: 85%; margin-left: auto; margin-right: auto;">

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
  

<%
List<Contrato> contratoLista = (List<Contrato>) request.getAttribute("contratoListRequest");
if(contratoLista != null && contratoLista.size() > 0){
	  System.out.println( "lista recuperada." ); 
	  for (int i = 0; i < contratoLista.size(); i++ ){
		  out.print("<tr>");
		  
		  out.print("<td style=\"text-align: center\" >"); out.print("<img src=\"imagens/editar.png\" onclick=\"editar(" + contratoLista.get(i).getId() + ")\" /><img src=\"imagens/remover.png\" onclick=\"excluir(" + contratoLista.get(i).getId() + ")\" />"); out.print("</td>");
		  out.print("<td>"); out.print(contratoLista.get(i).getNumero()); out.print("</td>");
		  out.print("<td>"); out.print((contratoLista.get(i).getFuncionario() != null ? contratoLista.get(i).getFuncionario().getNome() : null)); out.print("</td>");
		  out.print("<td>"); out.print((contratoLista.get(i).getCliente() != null ? contratoLista.get(i).getCliente().getNome() : null)); out.print("</td>");
		  out.print("<td>"); out.print((contratoLista.get(i).getCliente() != null ? contratoLista.get(i).getCliente().getCpf_cnpj() : null)); out.print("</td>");
		  out.print("<td>"); out.print(formataData((contratoLista.get(i).getDataInicio() != null ? contratoLista.get(i).getDataInicio().toString() : null))); out.print("</td>");
		  out.print("<td>"); out.print(formataData((contratoLista.get(i).getDataFim() != null ? contratoLista.get(i).getDataFim().toString() : null))); out.print("</td>");
		  out.print("<td>"); out.print(contratoLista.get(i).getValor()); out.print("</td>");
		  
		  out.print("</tr>");
		  
		  System.out.println("");
		  System.out.print("<tr>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print(contratoLista.get(i).getNumero()); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print("Funcionario"); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print("Cliente"); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print(contratoLista.get(i).getDataInicio()); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print(contratoLista.get(i).getDataFim()); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print("CPF Cliente"); System.out.print("</td>");
		  System.out.println("");
		  System.out.print("<td>"); System.out.print(contratoLista.get(i).getValor()); System.out.print("</td>");
		  System.out.println("");
		  System.out.println("</tr>");
		  System.out.println("");
	  }
}

%>
<%!
//FormataData de yyyy-mm-dd para dd-mm-yyyy
public String formataData(String value){
	if(value != null ){
		String[] res = value.split("-");
		value = res[2] + '/' + res[1] + "/" + res[0];
		System.out.println("Value: " + value);
		System.out.println("res: " + res[0].toString());
	}
	return value;
}
%>
 
  
  </table>
</form>
</body>
</html>