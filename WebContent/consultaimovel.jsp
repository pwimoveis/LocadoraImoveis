<%@page import="br.com.utils.ImovelUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.model.Imovel"%>
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
			document.getElementById("formImovelPesquisa").submit();
		}
		
		//Novo
		if(botaoAcionado == 200)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'NOVO';
			document.getElementById("formImovelPesquisa").submit();
		}
		
		//Editar
		if(botaoAcionado == 300)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EDITAR';
			document.getElementById("formImovelPesquisa").submit();
		}
		
		//Excluir
		if(botaoAcionado == 400)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EXCLUIR';
			document.getElementById("formImovelPesquisa").submit();
		}
	}
</script>

</head>
<body>
<a href="login.jsp"> SAIR </a> 	<center> <b><u> CONSULTAR IMÓVEL </u></b></center> 
<br></br>
<br></br>
	<form action="imovel_controller" method="GET" id="formImovelPesquisa">
	<input type="hidden" id="submitBotoes" value="" name="submitBotoes" />
	<input type="hidden" name="idAcaoGrid" id="idAcaoGrid" />
	
	<table>
	<tr>
		<td> &nbsp;&nbsp;Código Imóvel: </td>
		<td><input type="text" size="35" name="codigo" value="<%=(request.getAttribute("codigo") != null) ? request.getAttribute("codigo") : ""%>"></td>
	</tr>
	<tr>
		<td> &nbsp;&nbsp;Endereço: </td>
		<td><input type="text" size="35" name="endereco" value="<%=(request.getAttribute("endereco") != null) ? request.getAttribute("endereco") : ""%>"></td>
	</tr>
	
</table>
<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Pesquisar" onclick="botaoSubmit(100)"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="Novo" onclick="location.href='cadastroimovel.jsp'"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="Voltar" onclick="location.href='home.jsp'">
<br/><br/><br/><br/><br/>
<table border="1">
  <tr>
    <th bgcolor="#EDEDED">Ação</th>
    <th bgcolor="#EDEDED">Número</th>
    <th bgcolor="#EDEDED">Descrição</th>
    <th bgcolor="#EDEDED">Endereço</th>
    <th bgcolor="#EDEDED">Comodos</th>
    <th bgcolor="#EDEDED">Tipo Imovel</th>
  </tr>
 <%
List<Imovel> imovelLista = (ArrayList<Imovel>)request.getAttribute("imovelListRequest");
if(imovelLista != null)
{
	  if(imovelLista.size()<=0)
	  {
		  out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
		  out.print("Nenhum registro encontrado".toUpperCase());
	  }
	  
	  for (int i = 0; i < imovelLista.size(); i++ )
	  {
		  out.print("<tr>");
		  out.print("<td>"); out.print("<img src=\"imagens/editar.png\" onclick=\"editar(" + imovelLista.get(i).getID() + ")\" /><img src=\"imagens/remover.png\" onclick=\"excluir(" + imovelLista.get(i).getID() + ")\" />"); out.print("</td>");
		  out.print("<td>"); out.print(imovelLista.get(i).getID()); out.print("</td>");
		  out.print("<td>"); out.print(imovelLista.get(i).getDescricao()); out.print("</td>");
		  out.print("<td>"); out.print(imovelLista.get(i).getEndereco()); out.print("</td>");
		  out.print("<td>"); out.print(imovelLista.get(i).getComodos()); out.print("</td>");
		  out.print("<td>"); out.print(ImovelUtil.tipoToString(imovelLista.get(i).getTipo_imovel())); out.print("</td>");
		  out.print("</tr>");
	  }
}
%>
  </table>
</form>
</body>
</html>