<%@page import="br.com.controller.ClienteController"%>
<%@page import="br.com.utils.DataUtil"%>
<%@page import="br.com.model.Proposta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script>
 	//CODIGOS
 	//PESQUISAR: 100
 	//NOVO: 200
 	//EDITAR: 300
 	//EXCLUIR: 400
 	//SALVAR: 500
 	
 	//Metodo executado quando botao editar da grid eh acionado
 	function editar(idElemento)
 	{
 		var elemGrid = document.getElementById("idAcaoGrid");
 		elemGrid.value = idElemento;
		botaoSubmit(300);  
	}
 	
 	//Metodo executado quando botao excluir da grid eh acionado
	function excluir(idElemento)
 	{
		var elemGrid = document.getElementById("idAcaoGrid");
 		elemGrid.value = idElemento;
		botaoSubmit(400);  
	}
	
	function botaoSubmit(botaoAcionado)
	{
		//Pesquisar
		if(botaoAcionado == 100)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'PESQUISAR';
			document.getElementById("formPropostaPesquisa").submit();
		}
		
		//Novo
		if(botaoAcionado == 200)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'NOVO';
			document.getElementById("formPropostaPesquisa").submit();
		}
		
		//Editar
		if(botaoAcionado == 300)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EDITAR';
			document.getElementById("formPropostaPesquisa").submit();
		}
		
		//Excluir
		if(botaoAcionado == 400)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EXCLUIR';
			document.getElementById("formPropostaPesquisa").submit();
		}
	}
</script>
</head>
<body>
<a href="login.jsp"> SAIR </a> 	<center> <b><u> CONSULTAR PROPOSTA </u></b></center> 
<br></br>
<br></br>
	<form action="proposta_controller" method="GET" id="formPropostaPesquisa">
	<input type="hidden" id="submitBotoes" value="" name="submitBotoes" />
	<input type="hidden" name="idAcaoGrid" id="idAcaoGrid" />
	
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
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
	<input type="submit" value="Pesquisar" onclick="botaoSubmit(100)"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		<input type="button" value="Novo" onclick="location.href='cadastroproposta.jsp'"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		<input type="button" value="Voltar" onclick="location.href='home.jsp'">
<br/><br/><br/><br/><br/>
<table border="1">

  <tr>
    <th bgcolor="#EDEDED">Ação</th>
    <th bgcolor="#EDEDED">Número</th>
    <th bgcolor="#EDEDED">Cliente</th>
    <th bgcolor="#EDEDED">Corretor</th>
    <th bgcolor="#EDEDED">Data Vencimento</th>
    <th bgcolor="#EDEDED">Data Inicio</th>
    <th bgcolor="#EDEDED">Valor</th>
    <th bgcolor="#EDEDED">Desconto</th>
  </tr>
 <%
List<Proposta> propostaLista = (ArrayList<Proposta>)request.getAttribute("propostaListRequest");
if(propostaLista != null)
{
	  if(propostaLista.size()<=0)
	  {
		  out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
		  out.print("Nenhum registro encontrado".toUpperCase());
	  }
	  
	  for (int i = 0; i < propostaLista.size(); i++ )
	  {
		  out.print("<tr>");
		  out.print("<td>"); out.print("<img src=\"imagens/editar.png\" onclick=\"editar(" + propostaLista.get(i).getId() + ")\" /><img src=\"imagens/remover.png\" onclick=\"excluir(" + propostaLista.get(i).getId() + ")\" />"); out.print("</td>");
		  out.print("<td>"); out.print(propostaLista.get(i).getId()); out.print("</td>");
		  out.print("<td>"); out.print(ClienteController.getNomeCliente(propostaLista.get(i).getId_cliente())); out.print("</td>");
		  out.print("<td>"); out.print(ClienteController.getNomeFuncionario(propostaLista.get(i).getId_funcionario())); out.print("</td>");
		  out.print("<td>"); out.print(DataUtil.toString(propostaLista.get(i).getData_venc_proposta(), "dd/MM/yyyy")); out.print("</td>");
		  out.print("<td>"); out.print(DataUtil.toString(propostaLista.get(i).getData_inicio(), "dd/MM/yyyy")); out.print("</td>");
		  //out.print("<td>"); out.print(DataUtil.toString(propostaLista.get(i).getData_fim(), "dd/MM/yyyy")); out.print("</td>");
		  out.print("<td>"); out.print(propostaLista.get(i).getValor()); out.print("</td>");
		  out.print("<td>"); out.print(propostaLista.get(i).getDesconto()); out.print("</td>");
		  out.print("</tr>");
	  }
}
%>
  </table>
</form>
</body>
</html>