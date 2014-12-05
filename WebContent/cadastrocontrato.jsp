<%@page import="java.util.List"%>
<%@page import="br.com.model.Contrato"%>
<%@page import="br.com.model.Funcionario"%>
<%@page import="br.com.model.Cliente"%>
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
 	
	
	function botaoSubmit(botaoAcionado){
		//Pesquisar
		if(botaoAcionado == 100){
			//alert('botao pesquisar acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'PESQUISAR';
			
			//Submit do formulario
			document.getElementById("formContratoNovo").submit();
		}
		
		//Novo e Editar (tela de cadastro)
		if(botaoAcionado == 200){
			//alert('botao novo acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'NOVO_EDITAR';
			
			//Submit do formulario
			document.getElementById("formContratoNovo").submit();
		}
		
		//Editar (tela de consulta - botao grid)
		if(botaoAcionado == 300){
			//alert('botao editar acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EDITAR';
			
			//Submit do formulario
			document.getElementById("formContratoNovo").submit();
		}
		
		//Excluir
		if(botaoAcionado == 400){
			//alert('botao excluir acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EXCLUIR';
			
			//Submit do formulario
			document.getElementById("formContratoNovo").submit();
		}
				
	}
</script>
</head>
<body>
<a href="login.jsp"> SAIR </a><center> <b><u> CADASTRO DE CONTRATO </u></b></center> 
<br></br>
	<form action="contrato_controller" method="get" id="formContratoNovo">
	<input type="hidden" id="submitBotoes" value="" name="submitBotoes" />
	<input type="hidden" name="idEditar" id="idEditar" value="<%=(request.getAttribute("idContratoEditar") != null) ? request.getAttribute("idContratoEditar") : ""%>" />
	<table border="0" style="margin-left: auto; margin-right: auto; text-align: center" width="85%">
		<tr>
			<td>
				<font color="red" size="+1">
					<%  
					    if(null!=request.getAttribute("mensagemErro"))
					    {
					        out.println(request.getAttribute("mensagemErro"));
					    }
					%>
			</font>
			</td>
		</tr>
	</table>
		<table>
			<tr>
				<td> &nbsp;&nbsp;Número: </td>
				<td><input type="text" size="35" name="numero" value="<%=(request.getAttribute("numero") != null) ? request.getAttribute("numero") : ""%>" />
			</tr>
			<!-- 
			<tr>
				<td> &nbsp;&nbsp;Funcionário: </td>
				<td><input type="text" size="35" name="funcionario" value="<%=(request.getAttribute("funcionario") != null) ? request.getAttribute("funcionario") : ""%>" /></td>
			</tr>
			-->
			<tr>
				<td> &nbsp;&nbsp;Funcionário: </td>
				<td>
					<%
						List<Funcionario> funcionarioList = (request.getAttribute("funcionarioListRequest") != null ? (List<Funcionario>) request.getAttribute("funcionarioListRequest") : null);
						if(funcionarioList != null){
							out.print("<select name=\"funcionario\">");
							Integer funcionarioSelecionado = (Integer)request.getAttribute("funcionario");
							System.out.println("funcionarioSelecionado: " + funcionarioSelecionado);
							for (int i = 0; i < funcionarioList.size(); i++ )
							{
								System.out.println("funcionario corrente: " + funcionarioList.get(i).getID());
								if(funcionarioSelecionado != null && funcionarioSelecionado == funcionarioList.get(i).getID())
								{ out.print("  <option value=\"" + funcionarioList.get(i).getID() + "\" selected = \"true\">" + funcionarioList.get(i).getNome() + "</option>"); }
								else
								{ out.print("  <option value=\"" + funcionarioList.get(i).getID() + "\">" + funcionarioList.get(i).getNome() + "</option>"); }
							}
							out.print("</select>");
						}else{
							out.print("<select name=\"funcionario\">");
							out.print("</select>");
						}
					%>
				</td>
			</tr>
			<!--
			<tr>
				<td> &nbsp;&nbsp;Cliente: </td>
				<td><input type="text" size="35" name="cliente" value="<%=(request.getAttribute("cliente") != null) ? request.getAttribute("cliente") : ""%>" />
			</tr>
			-->
			
			<tr>
				<td> &nbsp;&nbsp;Cliente: </td>
				<td>
					<%
						List<Cliente> clienteList = (request.getAttribute("clienteListRequest") != null ? (List<Cliente>) request.getAttribute("clienteListRequest") : null);
									if(clienteList != null){
										out.print("<select name=\"cliente\">");
										Integer clienteSelecionado = (Integer)request.getAttribute("cliente");
										System.out.println("clienteSelecionado: " + clienteSelecionado);
										for (int i = 0; i < clienteList.size(); i++ )
										{
											System.out.println("cliente corrente: " + clienteList.get(i).getID());
											if(clienteSelecionado != null && clienteSelecionado == clienteList.get(i).getID())
											{ out.print("  <option value=\"" + clienteList.get(i).getID() + "\" selected = \"true\">" + clienteList.get(i).getNome() + "</option>"); }
											else
											{ out.print("  <option value=\"" + clienteList.get(i).getID() + "\">" + clienteList.get(i).getNome() + "</option>"); }
										}
										out.print("</select>");
									}else{
										out.print("<select name=\"cliente\">");
										out.print("</select>");
									}
					%>
				</td>
			</tr>
				<td> &nbsp;&nbsp;Data Início: </td>
				<td><input type="text" size="35" name="datainicio" value="<%=(request.getAttribute("datainicio") != null) ? request.getAttribute("datainicio") : ""%>" /></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Data Fim: </td>
				<td><input type="text" size="35" name="datafim" value="<%=(request.getAttribute("datafim") != null) ? request.getAttribute("datafim") : ""%>" /></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Valor: </td>
				<td><input type="text" size="35" name="valor" value="<%=(request.getAttribute("valor") != null) ? request.getAttribute("valor") : ""%>" /></td>
			</tr>
		</table>
		<br><br>
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="Salvar" onclick="botaoSubmit(200)" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		 <input type="button" value="Cancelar" onclick="location.href='consultacontrato.jsp'" />
	</form>
</body>
</html>