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
import br.com.model.Imovel;

/**
 * Servlet implementation class FuncionarioController
 */
@WebServlet("/imovel_controller")
public class ImovelController extends HttpServlet 
{	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImovelController() { super(); }

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
			List<Imovel> imovelList = new ArrayList<Imovel>();

			try 
			{
				String codigo = request.getParameter("codigo");
				String endereco = request.getParameter("endereco");
						
				ConexaoBD conexaoBD = new ConexaoBD();
				imovelList = conexaoBD.consultaImovel(toInt(codigo), endereco);
				conexaoBD.closeConnection();
			} 
			catch (Exception e1) 
			{ e1.printStackTrace(); }

			request.setAttribute("imovelListRequest", imovelList);
			request.setAttribute("codigo", request.getParameter("codigo"));
			request.setAttribute("endereco", request.getParameter("endereco"));

			request.getRequestDispatcher("consultaimovel.jsp").forward(request, response);
		}
		
		//ACAO EXLUIR
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("EXCLUIR"))
		{
			String idRemover = request.getParameter("idAcaoGrid");
			
			String codigo = request.getParameter("codigo");
			String endereco = request.getParameter("endereco");
				
			List<Imovel> imovelList = new ArrayList<Imovel>();
			try
			{
				ConexaoBD conexaoBD = new ConexaoBD();
				conexaoBD.excluiImovel(Integer.parseInt(idRemover));
				imovelList = conexaoBD.consultaImovel(toInt(codigo), endereco);
				conexaoBD.closeConnection();
			} 
			catch (Exception e1) 
			{ e1.printStackTrace(); }

			request.setAttribute("imovelListRequest", imovelList);
			request.setAttribute("codigo", request.getParameter("codigo"));
			request.setAttribute("endereco", request.getParameter("endereco"));

			request.getRequestDispatcher("consultaimovel.jsp").forward(request, response);
		}
		
		//Botão EDITAR e NOVO
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("NOVO_EDITAR")){

			List<Imovel> imovelList = new ArrayList<Imovel>();
			Imovel imovel = new Imovel();
			try 
			{
				ConexaoBD conexaoBD = new ConexaoBD();
				
				Integer idImovel = ((request.getParameter("idEditar") != null && !request.getParameter("idEditar").isEmpty() ? Integer.parseInt(request.getParameter("idEditar")) : null));

				imovel.setID(idImovel);
				imovel.setEndereco(request.getParameter("endereco"));
				imovel.setComodos(toIntNotNULL(request.getParameter("comodos")));
				imovel.setDescricao(request.getParameter("descricao"));
				imovel.setTipo_imovel(toIntNotNULL(request.getParameter("tipo")));

				conexaoBD.insereImovel(imovel);
				imovelList = conexaoBD.consultaImovel(null, null);
				conexaoBD.closeConnection();
			} 
			catch (Exception e1) 
			{ e1.printStackTrace(); }

			request.setAttribute("imovelListRequest", imovelList);

			//Essa linha zera as variaveis do request
			response.sendRedirect("consultaimovel.jsp");
		}

		//ACAO EDITAR. Chamado no clique do icone na grid
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("EDITAR"))
		{
			String idImovel = request.getParameter("idAcaoGrid");
			Imovel imovel = new Imovel();
			try 
			{
				ConexaoBD conexaoBD = new ConexaoBD();
				imovel = conexaoBD.pesquisaImovelPorID(Integer.parseInt(idImovel));
				conexaoBD.closeConnection();
			} 
			catch (Exception e1) 
			{ e1.printStackTrace(); }
			
			request.setAttribute("codigo", imovel.getID());
			request.setAttribute("endereco", imovel.getEndereco());
			request.setAttribute("comodos", imovel.getComodos());
			request.setAttribute("descricao", imovel.getDescricao());
			request.setAttribute("tipo", imovel.getTipo_imovel());
			request.setAttribute("idImovelEditar", imovel.getID());

			request.getRequestDispatcher("cadastroimovel.jsp").forward(request, response);
		} 
	}
	
	public Integer toInt(String valor)
	{
		try
		{
			return Integer.parseInt(valor);
		}
		catch(Exception e) { }
		return null;
	}
	
	public int toIntNotNULL(String valor)
	{
		try
		{
			return Integer.parseInt(valor);
		}
		catch(Exception e) { }
		return 0;
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
