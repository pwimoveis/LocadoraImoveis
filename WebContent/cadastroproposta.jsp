<%@page import="br.com.controller.FuncionarioController"%>
<%@page import="br.com.model.Funcionario"%>
<%@page import="br.com.controller.ClienteController"%>
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
 	
	function botaoSubmit(botaoAcionado)
	{
		//Pesquisar
		if(botaoAcionado == 100)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'PESQUISAR';
			document.getElementById("formPropostaNovo").submit();
		}
		
		//Novo e Editar (tela de cadastro)
		if(botaoAcionado == 200)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'NOVO_EDITAR';
			document.getElementById("formPropostaNovo").submit();
		}
		
		//Editar (tela de consulta - botao grid)
		if(botaoAcionado == 300)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EDITAR';
			document.getElementById("formPropostaNovo").submit();
		}
		
		//Excluir
		if(botaoAcionado == 400)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EXCLUIR';
			document.getElementById("formPropostaNovo").submit();
		}	
	}
</script>
</head>
<body>
<a href="login.jsp"> SAIR </a><center> <b><u> CADASTRO DE PROPOSTA </u></b></center> 
<br></br>
	<form action="proposta_controller" method="get" id="formPropostaNovo">
		<input type="hidden" id="submitBotoes" value="" name="submitBotoes" />
		<input type="hidden" name="idEditar" id="idEditar" value="<%=(request.getAttribute("idPropostaEditar") != null) ? request.getAttribute("idPropostaEditar") : ""%>" />
	
		<table>
			<tr>
				<td> &nbsp;&nbsp;Cliente: </td>
				<td>
					<%
						List<Cliente> clientes =  ClienteController.getClientes();
						out.print("<select name=\"cliente\">");
						Integer clienteSelecionado = (Integer)request.getAttribute("cliente");
						for (int i = 0; i < clientes.size(); i++ )
						{
							if(clienteSelecionado!=null && clienteSelecionado==clientes.get(i).getID())
							{ out.print("  <option value=\"" + clientes.get(i).getID() + "\" selected>" + clientes.get(i).getNome() + "</option>"); }
							else
							{ out.print("  <option value=\"" + clientes.get(i).getID() + "\">" + clientes.get(i).getNome() + "</option>"); }
						}
						out.print("</select>");
					%>
				</td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Corretor: </td>
				<td>
					<%
						List<Funcionario> corretores =  FuncionarioController.getFuncionarios();
						out.print("<select name=\"corretor\">");
						Integer corretorSelecionado = (Integer)request.getAttribute("corretor");
						for (int i = 0; i < corretores.size(); i++ )
						{
							if(corretorSelecionado!=null && corretorSelecionado==corretores.get(i).getID())
							{ out.print("  <option value=\"" + corretores.get(i).getID() + "\" selected>" + corretores.get(i).getNome() + "</option>"); }
							else
							{ out.print("  <option value=\"" + corretores.get(i).getID() + "\">" + corretores.get(i).getNome() + "</option>"); }
						}
						out.print("</select>");
					%>
				</td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Data início: </td>
				<td><input type="text" size="35" name="datainicio" value="<%=(request.getAttribute("datainicio") != null) ? request.getAttribute("datainicio") : ""%>">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Venc/Proposta: </td>
				<td><input type="text" size="35" name="vencproposta" value="<%=(request.getAttribute("vencproposta") != null) ? request.getAttribute("vencproposta") : ""%>"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Valor: </td>
				<td><input type="text" size="35" name="valor" value="<%=(request.getAttribute("valor") != null) ? request.getAttribute("valor") : ""%>"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Desconto: </td>
				<td><input type="text" size="35" name="desconto" value="<%=(request.getAttribute("desconto") != null) ? request.getAttribute("desconto") : ""%>"></td>
			</tr>
		</table>
		<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Salvar" onclick="botaoSubmit(200)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="Cancelar" onclick="location.href='consultaproposta.jsp'">
	</form>
</body>
</html>