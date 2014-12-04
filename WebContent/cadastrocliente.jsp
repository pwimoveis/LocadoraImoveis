<%@page import="br.com.utils.auxiliar.TipoPessoa"%>
<%@page import="br.com.utils.PessoaUtil"%>
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
 	
	function botaoSubmit(botaoAcionado){
		//Pesquisar
		if(botaoAcionado == 100){
			//alert('botao pesquisar acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'PESQUISAR';
			
			//Submit do formulario
			document.getElementById("formClienteNovo").submit();
		}
		
		//Novo e Editar (tela de cadastro)
		if(botaoAcionado == 200){
			//alert('botao novo acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'NOVO_EDITAR';
			
			//Submit do formulario
			document.getElementById("formClienteNovo").submit();
		}
		
		//Editar (tela de consulta - botao grid)
		if(botaoAcionado == 300){
			//alert('botao editar acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EDITAR';
			
			//Submit do formulario
			document.getElementById("formClienteNovo").submit();
		}
		
		//Excluir
		if(botaoAcionado == 400){
			//alert('botao excluir acionado');
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EXCLUIR';
			
			//Submit do formulario
			document.getElementById("formClienteNovo").submit();
		}
				
	}
</script>
</head>
<body>
<a href="login.jsp"> SAIR </a><center> <b><u> CADASTRO DE CLIENTE </u></b></center> 
<br></br>
	<form action="cliente_controller" method="get" id="formClienteNovo">
		<input type="hidden" id="submitBotoes" value="" name="submitBotoes" />
		<input type="hidden" name="idEditar" id="idEditar" value="<%=(request.getAttribute("idClienteEditar") != null) ? request.getAttribute("idClienteEditar") : ""%>" />
	
		<table>
			<tr>
				<td> &nbsp;&nbsp;Nome: </td>
				<td><input type="text" size="35" name="nome" value="<%=(request.getAttribute("nome") != null) ? request.getAttribute("nome") : ""%>">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Tipo de Pessoa: </td>
				<td>
					<%
						List<TipoPessoa> tipos = PessoaUtil.getTiposPessoa();
						out.print("<select name=\"tipopessoa\">");
						String tipoSelecionado = (String)request.getAttribute("tipopessoa");
						for (int i = 0; i < tipos.size(); i++ )
						{
							if(tipoSelecionado!=null && tipoSelecionado.equalsIgnoreCase(Integer.toString(i)))
							{ out.print("  <option value=\"" + i + "\" selected>" + PessoaUtil.tipoToString(i) + "</option>"); }
							else
							{ out.print("  <option value=\"" + i + "\">" + PessoaUtil.tipoToString(i) + "</option>"); }
						}
						out.print("</select>");
					%>
				</td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;RG: </td>
				<td><input type="text" size="35" name="rg" value="<%=(request.getAttribute("rg") != null) ? request.getAttribute("rg") : ""%>">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;CPF/CNPJ: </td>
				<td><input type="text" size="35" name="cpfcnpj" value="<%=(request.getAttribute("cpfcnpj") != null) ? request.getAttribute("cpfcnpj") : ""%>"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Endereço: </td>
				<td><input type="text" size="35" name="endereco" value="<%=(request.getAttribute("endereco") != null) ? request.getAttribute("endereco") : ""%>"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;E-mail: </td>
				<td><input type="text" size="35" name="email" value="<%=(request.getAttribute("email") != null) ? request.getAttribute("email") : ""%>"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Telefone: </td>
				<td><input type="text" size="35" name="telefone" value="<%=(request.getAttribute("telefone") != null) ? request.getAttribute("telefone") : ""%>"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Data de Nascimento: </td>
				<td><input type="text" size="35" name="data_nasc" value="<%=(request.getAttribute("data_nasc") != null) ? request.getAttribute("data_nasc") : ""%>"></td>
			</tr>
		</table>
		<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Salvar" onclick="botaoSubmit(200)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		 <input type="button" value="Cancelar" onclick="location.href='consultacliente.jsp'">
	</form>
</body>
</html>