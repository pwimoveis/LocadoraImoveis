package br.com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
				funcionarioList = conexaoBD.consultaFuncionario(request.getParameter("nome"), request.getParameter("rg"));
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
				funcionarioList = conexaoBD.consultaFuncionario(request.getParameter("nome"), request.getParameter("rg"));
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			request.setAttribute("funcionarioListRequest", funcionarioList);
			request.setAttribute("nome", request.getParameter("nome"));
			request.setAttribute("rg", request.getParameter("rg"));

			request.getRequestDispatcher("consultafuncionario.jsp").forward(request, response);
		}
		
		//Botão NOVO e EDITAR
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("NOVO_EDITAR")){

			if(!validacao("NOVO_EDITAR", request.getParameter("datanasc"))){
				
				request.setAttribute("mensagemErro", "Data invalida (DD/MM/AAAA)");
				
				request.setAttribute("cpf", request.getParameter("cpf"));
				request.setAttribute("datanasc", request.getParameter("datanasc"));//datanasc
				request.setAttribute("email", request.getParameter("email"));
				request.setAttribute("endereco", request.getParameter("endereco"));
				request.setAttribute("idFuncionarioEditar", request.getParameter("idEditar"));
				request.setAttribute("login", request.getParameter("login"));
				request.setAttribute("nome", request.getParameter("nome"));
				request.setAttribute("rg", request.getParameter("rg"));
				request.setAttribute("senha", request.getParameter("senha"));
				request.setAttribute("telefone", request.getParameter("telefone"));
				
				request.getRequestDispatcher("cadastrofuncionario.jsp").forward(request, response);
			}else{

				List<Funcionario> funcionarioList = new ArrayList<Funcionario>();
				Funcionario funcionario = new Funcionario();
				try {
					ConexaoBD conexaoBD = new ConexaoBD();

					Integer idFuncionario = ((request.getParameter("idEditar") != null && !request.getParameter("idEditar").isEmpty() ? Integer.parseInt(request.getParameter("idEditar")) : null));

					funcionario.setCpf(request.getParameter("cpf"));
					funcionario.setDataNascimento(getParseData(request.getParameter("datanasc")));//datanasc
					funcionario.setEmail(request.getParameter("email"));
					funcionario.setEndereco(request.getParameter("endereco"));
					funcionario.setID(idFuncionario);
					funcionario.setLogin(request.getParameter("login"));
					funcionario.setNome(request.getParameter("nome"));
					funcionario.setRg(request.getParameter("rg"));
					funcionario.setSenha(request.getParameter("senha"));
					funcionario.setTelefone(request.getParameter("telefone"));

					conexaoBD.insereFuncionario(funcionario);
					funcionarioList = conexaoBD.consultaFuncionario(null, null);
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

		//ACAO EDITAR. Chamado no clique do icone na grid
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("EDITAR")){

			String idFuncionario = request.getParameter("idAcaoGrid");
			Funcionario funcionario = new Funcionario();
			try {
				ConexaoBD conexaoBD = new ConexaoBD();
				funcionario = conexaoBD.pesquisaFuncionarioPorID(Integer.parseInt(idFuncionario));
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			request.setAttribute("cpf", funcionario.getCpf());
			request.setAttribute("datanasc", formataData((funcionario.getDataNascimento() != null ? funcionario.getDataNascimento().toString() : null)));//datanasc
			request.setAttribute("email", funcionario.getEmail());
			request.setAttribute("endereco", funcionario.getEndereco());
			request.setAttribute("idFuncionarioEditar", funcionario.getID());
			request.setAttribute("login", funcionario.getLogin());
			request.setAttribute("nome", funcionario.getNome());
			request.setAttribute("rg", funcionario.getRg());
			request.setAttribute("senha", funcionario.getSenha());
			request.setAttribute("telefone", funcionario.getTelefone());

			request.getRequestDispatcher("cadastrofuncionario.jsp").forward(request, response);

		} 
	}
	
	public static List<Funcionario> getFuncionarios()
	{
		List<Funcionario> funcionarios = new ArrayList<Funcionario>();
		try 
		{
			ConexaoBD conexaoBD = new ConexaoBD();
			funcionarios = conexaoBD.obtemTodosFuncionarios();
			conexaoBD.closeConnection();
		} 
		catch (Exception e1) 
		{ e1.printStackTrace(); }
		return funcionarios;
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

	
	public boolean validacao(String acao, String campo){
		if(acao != null && acao.equals("NOVO_EDITAR")){
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			try{
				Date data = sdf.parse(campo);
				Calendar cal = Calendar.getInstance();
				cal.setTime(data);
				if(cal.get(Calendar.YEAR) < 1900){
					return false;
				}
			}catch(Exception e){
				return false;
			}
			
		}
		return true;
	}
	
	/**
	 * Formata STRING em DATE
	 * @param value
	 * @return
	 */
	public Date getParseData(String value){
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		try{
			Date data = sdf.parse(value);
			return data;
		}catch(Exception e){
			return null;
		}
	}
	
	/**
	 * Formata data de yyyy-mm-dd para dd-mm-yyyy
	 * @param value
	 * @return
	 */
	public String formataData(String value){
		if(value != null ){
			String[] result = value.split("-");
			value = result[2] + '/' + result[1] + "/" + result[0];
			System.out.println("Value: " + value);
			System.out.println("res: " + result[0].toString());
		}
		return value;
	}

}
