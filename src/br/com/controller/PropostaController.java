package br.com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.conexao.ConexaoBD;
import br.com.model.Proposta;
import br.com.utils.DataUtil;

/**
 * Servlet implementation class FuncionarioController
 */
@WebServlet("/proposta_controller")
public class PropostaController extends HttpServlet 
{	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PropostaController() { super(); }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException { }

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() { }
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//ACAO PESQUISAR
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("PESQUISAR"))
		{
			List<Proposta> propostaList = new ArrayList<Proposta>();

			try 
			{
				String cliente = request.getParameter("cliente");
				String corretor = request.getParameter("corretor");
						
				ConexaoBD conexaoBD = new ConexaoBD();
				propostaList = conexaoBD.consultaProposta(cliente, corretor);
				conexaoBD.closeConnection();
			} 
			catch (Exception e1) 
			{ e1.printStackTrace(); }

			request.setAttribute("propostaListRequest", propostaList);
			request.setAttribute("cliente", request.getParameter("cliente"));
			request.setAttribute("corretor", request.getParameter("corretor"));

			request.getRequestDispatcher("consultaproposta.jsp").forward(request, response);
		}
		
		//ACAO EXLUIR
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("EXCLUIR"))
		{
			String idRemover = request.getParameter("idAcaoGrid");
			
			String cliente = request.getParameter("cliente");
			String corretor = request.getParameter("corretor");
				
			List<Proposta> propostaList = new ArrayList<Proposta>();
			try
			{
				ConexaoBD conexaoBD = new ConexaoBD();
				conexaoBD.excluiProposta(Integer.parseInt(idRemover));
				propostaList = conexaoBD.consultaProposta(cliente, corretor);
				conexaoBD.closeConnection();
			} 
			catch (Exception e1) 
			{ e1.printStackTrace(); }

			request.setAttribute("propostaListRequest", propostaList);
			request.setAttribute("cliente", request.getParameter("cliente"));
			request.setAttribute("corretor", request.getParameter("corretor"));

			request.getRequestDispatcher("consultaproposta.jsp").forward(request, response);
		}
		
		//Botão EDITAR e NOVO
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("NOVO_EDITAR"))
		{
			List<Proposta> propostaList = new ArrayList<Proposta>();
			Proposta proposta = new Proposta();
			try 
			{
				ConexaoBD conexaoBD = new ConexaoBD();
				
				Integer idProposta = ((request.getParameter("idEditar") != null && !request.getParameter("idEditar").isEmpty() ? Integer.parseInt(request.getParameter("idEditar")) : null));

				proposta.setId(idProposta);
				proposta.setDesconto(toDoubleNotNULL(request.getParameter("desconto")));
				proposta.setValor(toDoubleNotNULL(request.getParameter("valor")));
				proposta.setData_venc_proposta(DataUtil.toDate(request.getParameter("vencproposta"), "dd/MM/yyyy"));
				proposta.setData_inicio(DataUtil.toDate(request.getParameter("datainicio"), "dd/MM/yyyy"));
				proposta.setId_cliente(toID(request.getParameter("cliente")));
				proposta.setId_funcionario(toID(request.getParameter("corretor")));
				
				//proposta.setData_fim(request.getParameter("datafim"));
				//proposta.setData_proposta(request.getParameter("dataproposta"));

				conexaoBD.insereProposta(proposta);
				propostaList = conexaoBD.consultaProposta(null, null);
				conexaoBD.closeConnection();
			} 
			catch (Exception e1) 
			{ e1.printStackTrace(); }

			request.setAttribute("propostaListRequest", propostaList);

			//Essa linha zera as variaveis do request
			response.sendRedirect("consultaproposta.jsp");
		}

		//ACAO EDITAR. Chamado no clique do icone na grid
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("EDITAR"))
		{
			String idProposta = request.getParameter("idAcaoGrid");
			Proposta proposta = new Proposta();
			try 
			{
				ConexaoBD conexaoBD = new ConexaoBD();
				proposta = conexaoBD.pesquisaPropostaPorID(Integer.parseInt(idProposta));
				conexaoBD.closeConnection();
			} 
			catch (Exception e1) 
			{ e1.printStackTrace(); }

			request.setAttribute("idPropostaEditar", proposta.getId());
			request.setAttribute("desconto", proposta.getDesconto());
			request.setAttribute("valor", proposta.getValor());
			request.setAttribute("vencproposta", DataUtil.toString(proposta.getData_venc_proposta(), "dd/MM/yyyy"));
			request.setAttribute("datainicio", DataUtil.toString(proposta.getData_inicio(), "dd/MM/yyyy"));
			request.setAttribute("corretor", proposta.getId_funcionario());
			request.setAttribute("cliente", proposta.getId_cliente());
			
			//request.setAttribute("datafim", DataUtil.toString(proposta.getData_fim(), "dd/MM/yyyy"));
			//request.setAttribute("dataproposta", DataUtil.toString(proposta.getData_proposta(), "dd/MM/yyyy"));

			request.getRequestDispatcher("cadastroproposta.jsp").forward(request, response);
		} 
	}
	
	public Double toDouble(String valor)
	{
		try
		{
			return Double.parseDouble(valor);
		}
		catch(Exception e) { }
		return null;
	}
	
	public Integer toID(String id)
	{
		try
		{
			int idValor = Integer.parseInt(id);
			if(idValor>0)
			{
				return idValor;
			}
		}
		catch(Exception e) { }
		return null;
	}
	
	public double toDoubleNotNULL(String valor)
	{
		try
		{
			return Double.parseDouble(valor);
		}
		catch(Exception e) { }
		return 0.0;
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }
}
