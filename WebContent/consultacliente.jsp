<%@page import="br.com.utils.DataUtil"%>
<%@page import="br.com.model.Cliente"%>
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
			document.getElementById("formClientePesquisa").submit();
		}
		
		//Novo
		//Não está sendo chamado por aqui, so na pagina de cadastro
		if(botaoAcionado == 200){
			//alert('botao novo acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'NOVO';
			
			//Submit do formulario
			document.getElementById("formClientePesquisa").submit();
		}
		
		//Editar
		if(botaoAcionado == 300){
			//alert('botao editar acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EDITAR';
			
			//Submit do formulario
			document.getElementById("formClientePesquisa").submit();
		}
		
		//Excluir
		if(botaoAcionado == 400){
			//alert('botao excluir acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EXCLUIR';
			
			//Submit do formulario
			document.getElementById("formClientePesquisa").submit();
		}
	}
</script>
</head>
<body>
<a href="login.jsp"> SAIR </a> 	<center> <b><u> CONSULTAR CLIENTE </u></b></center> 
<br></br>
<br></br>
	<form action="cliente_controller" method="GET" id="formClientePesquisa">
	<input type="hidden" id="submitBotoes" value="" name="submitBotoes" />
	<input type="hidden" name="idAcaoGrid" id="idAcaoGrid" />
	
	<table>
	<tr>
		<td> &nbsp;&nbsp;Nome: </td>
		<td><input type="text" size="35" name="nome"></td>
	</tr>
	<tr>
		<td> &nbsp;&nbsp;RG: </td>
		<td><input type="text" size="35" name="rg"></td>
	</tr>
	<tr>
		<td> &nbsp;&nbsp;CPF/CNPJ: </td>
		<td><input type="text" size="35" name="cpfcnpj"></td>
	</tr>

	
</table>
<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Pesquisar" onclick="botaoSubmit(100)">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="Novo" onclick="location.href='cadastrocliente.jsp'">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="Voltar" onclick="location.href='home.jsp'">
<br/><br/><br/><br/><br/>
<table id="tableGrid" border="1" style="width: 85%; margin-left: auto; margin-right: auto;">

  <tr>
  	<th bgcolor="#EDEDED">Ação</th>
    <th bgcolor="#EDEDED">Nome</th>
    <th bgcolor="#EDEDED">RG</th>
    <th bgcolor="#EDEDED">CPF</th>
    <th bgcolor="#EDEDED">Data Nasc.</th>
    <th bgcolor="#EDEDED">Endereco</th>
    <th bgcolor="#EDEDED">Telefone</th>
    <th bgcolor="#EDEDED">Email</th>
  </tr>
<%
List<Cliente> clienteLista = (List<Cliente>) request.getAttribute("clienteListRequest");
if(clienteLista != null)
{
	  if(clienteLista.size()<=0)
	  {
		  out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
		  out.print("Nenhum registro encontrado".toUpperCase());
	  }
	  
	  for (int i = 0; i < clienteLista.size(); i++ ){
		  out.print("<tr>");
		  
		  out.print("<td>"); out.print("<img src=\"imagens/editar.png\" onclick=\"editar(" + clienteLista.get(i).getID() + ")\" /><img src=\"imagens/remover.png\" onclick=\"excluir(" + clienteLista.get(i).getID() + ")\" />"); out.print("</td>");
		  out.print("<td>"); out.print(clienteLista.get(i).getNome()); out.print("</td>");
		  out.print("<td>"); out.print(clienteLista.get(i).getRg()); out.print("</td>");
		  out.print("<td>"); out.print(clienteLista.get(i).getCpf_cnpj()); out.print("</td>");
		  out.print("<td>"); out.print(DataUtil.toString(clienteLista.get(i).getData_nasc(), "dd/MM/yyyy")); out.print("</td>");
		  out.print("<td>"); out.print(clienteLista.get(i).getEndereco()); out.print("</td>");
		  out.print("<td>"); out.print(clienteLista.get(i).getTelefone()); out.print("</td>");
		  out.print("<td>"); out.print(clienteLista.get(i).getEmail()); out.print("</td>");
		  
		  out.print("</tr>");
		  
	  }
}
%>
  </table>
</form>
</body>
</html>