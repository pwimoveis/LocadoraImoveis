<%@page import="br.com.utils.auxiliar.TipoImovel"%>
<%@page import="java.util.List"%>
<%@page import="br.com.utils.ImovelUtil"%>
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
			document.getElementById("formImovelNovo").submit();
		}
		
		//Novo e Editar (tela de cadastro)
		if(botaoAcionado == 200)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'NOVO_EDITAR';
			document.getElementById("formImovelNovo").submit();
		}
		
		//Editar (tela de consulta - botao grid)
		if(botaoAcionado == 300)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EDITAR';
			document.getElementById("formImovelNovo").submit();
		}
		
		//Excluir
		if(botaoAcionado == 400)
		{
			var elem = document.getElementById("submitBotoes");
			elem.value = 'EXCLUIR';
			document.getElementById("formImovelNovo").submit();
		}	
	}
</script>
</head>
<body>
<a href="login.jsp"> SAIR </a><center> <b><u> CADASTRO DE IMÓVEL </u></b></center> 
<br></br>
	<form action="imovel_controller" method="get" id="formImovelNovo">
		<input type="hidden" id="submitBotoes" value="" name="submitBotoes" />
		<input type="hidden" name="idEditar" id="idEditar" value="<%=(request.getAttribute("idImovelEditar") != null) ? request.getAttribute("idImovelEditar") : ""%>" />
	
		<table>
			<tr>
				<td> &nbsp;&nbsp;Código Imóvel: </td>
				<td><input type="text" size="15" name="codigo" readonly value="<%=(request.getAttribute("codigo") != null) ? request.getAttribute("codigo") : ""%>" /> </td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Endereço: </td>
				<td><input type="text" size="35" name="endereco" value="<%=(request.getAttribute("endereco") != null) ? request.getAttribute("endereco") : ""%>"></td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Comodos: </td>
				<td><input type="text" size="35" name="comodos" value="<%=(request.getAttribute("comodos") != null) ? request.getAttribute("comodos") : ""%>">
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Tipo: </td>
				<td>
					<%
						List<TipoImovel> tipos = ImovelUtil.getTiposImovel();
						out.print("<select name=\"tipo\">");
						Integer tipoSelecionado = (Integer)request.getAttribute("tipo");
						for (int i = 0; i < tipos.size(); i++ )
						{
							if(tipoSelecionado!=null && tipoSelecionado==i)
							{ out.print("  <option value=\"" + i + "\" selected>" + ImovelUtil.tipoToString(i) + "</option>"); }
							else
							{ out.print("  <option value=\"" + i + "\">" + ImovelUtil.tipoToString(i) + "</option>"); }
						}
						out.print("</select>");
					%>
				</td>
			</tr>
			<tr>
				<td> &nbsp;&nbsp;Descrição: </td>
				<td>
					<textarea rows="4" cols="50" name="descricao"><%=(request.getAttribute("descricao") != null) ? request.getAttribute("descricao") : ""%></textarea>
				</td>
			</tr>
		</table>
		<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		<input type="submit" value="Salvar" onclick="botaoSubmit(200)">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		<input type="button" value="Cancelar" onclick="location.href='consultaimovel.jsp'">
	</form>
</body>
</html>