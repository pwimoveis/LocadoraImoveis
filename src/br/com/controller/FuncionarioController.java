package br.com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.conexao.ConexaoBD;
import br.com.model.Funcionario;

/**
 * Servlet implementation class FuncionarioController
 */
@WebServlet("/funcionario_controller")
public class FuncionarioController extends HttpServlet {
	
	public String teste;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FuncionarioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//ACAO PESQUISAR
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("PESQUISAR")){
			List<Funcionario> funcionarioList = new ArrayList<Funcionario>();

			try {
				ConexaoBD conexaoBD = new ConexaoBD();
				funcionarioList = conexaoBD.consultaFuncionario();
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			request.setAttribute("funcionarioListRequest", funcionarioList);
			request.setAttribute("nome", request.getParameter("nome"));
			request.setAttribute("rg", request.getParameter("rg"));

			/*
		RequestDispatcher rd = getServletContext().getRequestDispatcher("consultafuncionario.jsp");
		rd.forward(request, response);
			 */

			//		Enumeration e = request.getAttributeNames();
			//	    while (e.hasMoreElements()) {
			//	      String name = (String) e.nextElement();
			//	      System.out.println(name + ": " + request.getAttribute(name) + "<BR>");
			//	    }
			//	    

			request.getRequestDispatcher("consultafuncionario.jsp").forward(request, response);
			//Essa linha zera as variaveis do request
			//response.sendRedirect("consultafuncionario.jsp");
		}
		
		//ACAO EXLUIR
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("EXCLUIR")){
			String idFuncionario = request.getParameter("idAcaoGrid");
			
			List<Funcionario> funcionarioList = new ArrayList<Funcionario>();
			try {
				ConexaoBD conexaoBD = new ConexaoBD();
				conexaoBD.excluiFuncionario(Integer.parseInt(idFuncionario));
				funcionarioList = conexaoBD.consultaFuncionario();
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			request.setAttribute("funcionarioListRequest", funcionarioList);
			request.setAttribute("nome", request.getParameter("nome"));
			request.setAttribute("rg", request.getParameter("rg"));

			request.getRequestDispatcher("consultafuncionario.jsp").forward(request, response);
		}
		
		//ACAO NOVO
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("NOVO")){

			List<Funcionario> funcionarioList = new ArrayList<Funcionario>();
			Funcionario funcionario = new Funcionario();
			try {
				ConexaoBD conexaoBD = new ConexaoBD();
				
				funcionario.setCpf(request.getParameter("cpf"));
				funcionario.setDataNascimento(new Date());//datanasc
				funcionario.setEmail(request.getParameter("email"));
				funcionario.setEndereco(request.getParameter("endereco"));
				funcionario.setID(10);
				funcionario.setLogin(request.getParameter("login"));
				funcionario.setNome(request.getParameter("nome"));
				funcionario.setRg(request.getParameter("rg"));
				funcionario.setSenha(request.getParameter("senha"));
				funcionario.setTelefone(request.getParameter("telefone"));
				
				conexaoBD.insereFuncionario(funcionario);
				funcionarioList = conexaoBD.consultaFuncionario();
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			request.setAttribute("funcionarioListRequest", funcionarioList);

			//request.getRequestDispatcher("cadastrofuncionario.jsp").forward(request, response);
			
			//Essa linha zera as variaveis do request
			response.sendRedirect("consultafuncionario.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	public String getTeste() {
		return teste + "ok.";
	}

	public void setTeste(String teste) {
		this.teste = teste;
	}

}
