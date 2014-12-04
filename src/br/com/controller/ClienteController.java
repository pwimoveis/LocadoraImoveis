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
import br.com.model.Cliente;
import br.com.model.Funcionario;
import br.com.utils.DataUtil;

/**
 * Servlet implementation class FuncionarioController
 */
@WebServlet("/cliente_controller")
public class ClienteController extends HttpServlet {
	
	public String teste;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClienteController() {
        super();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//ACAO PESQUISAR
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("PESQUISAR")){
			List<Cliente> clienteList = new ArrayList<Cliente>();

			try {
				
				String nome = request.getParameter("nome");
				String rg = request.getParameter("rg");
				String cpf = request.getParameter("cpfcnpj");
		
				ConexaoBD conexaoBD = new ConexaoBD();
				clienteList = conexaoBD.consultaCliente(nome, rg, cpf);
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			request.setAttribute("clienteListRequest", clienteList);
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

			request.getRequestDispatcher("consultacliente.jsp").forward(request, response);
			//Essa linha zera as variaveis do request
			//response.sendRedirect("consultafuncionario.jsp");
		}
		
		//ACAO EXLUIR
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("EXCLUIR")){
			String idCliente = request.getParameter("idAcaoGrid");
			
			String nome = request.getParameter("nome");
			String rg = request.getParameter("rg");
			String cpf = request.getParameter("cpfcnpj");
			
			List<Cliente> clienteList = new ArrayList<Cliente>();
			try {
				ConexaoBD conexaoBD = new ConexaoBD();
				conexaoBD.excluiCliente(Integer.parseInt(idCliente));
				clienteList = conexaoBD.consultaCliente(nome, rg, cpf);
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			request.setAttribute("clienteListRequest", clienteList);
			request.setAttribute("nome", request.getParameter("nome"));
			request.setAttribute("rg", request.getParameter("rg"));

			request.getRequestDispatcher("consultacliente.jsp").forward(request, response);
		}
		
		//Botão EDITAR e NOVO
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("NOVO_EDITAR")){

			List<Cliente> clienteList = new ArrayList<Cliente>();
			Cliente cliente = new Cliente();
			try {
				String nome = request.getParameter("nome");
				String rg = request.getParameter("rg");
				String cpf = request.getParameter("cpfcnpj");
				
				ConexaoBD conexaoBD = new ConexaoBD();
				
				Integer idCliente = ((request.getParameter("idEditar") != null && !request.getParameter("idEditar").isEmpty() ? Integer.parseInt(request.getParameter("idEditar")) : null));

				cliente.setID(idCliente);
				cliente.setTipo_pessoa(request.getParameter("tipopessoa"));
				cliente.setNome(request.getParameter("nome"));
				cliente.setRg(request.getParameter("rg"));
				cliente.setCpf_cnpj(request.getParameter("cpfcnpj"));
				cliente.setEndereco(request.getParameter("endereco"));
				cliente.setEmail(request.getParameter("email"));
				cliente.setTelefone(request.getParameter("telefone"));
				cliente.setData_nasc(DataUtil.toDate(request.getParameter("data_nasc"), "dd/MM/yyyy"));
				
				conexaoBD.insereCliente(cliente);
				clienteList = conexaoBD.consultaCliente(nome, rg, cpf);
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			request.setAttribute("clienteListRequest", clienteList);

			//request.getRequestDispatcher("cadastrofuncionario.jsp").forward(request, response);
			
			//Essa linha zera as variaveis do request
			response.sendRedirect("consultacliente.jsp");
		}

		//ACAO EDITAR. Chamado no clique do icone na grid
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("EDITAR")){

			String idCliente = request.getParameter("idAcaoGrid");
			Cliente cliente = new Cliente();
			try {
				ConexaoBD conexaoBD = new ConexaoBD();
				cliente = conexaoBD.pesquisaClientePorID(Integer.parseInt(idCliente));
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			request.setAttribute("tipo_pessoa", cliente.getTipo_pessoa());
			request.setAttribute("nome", cliente.getNome());
			request.setAttribute("rg", cliente.getRg());
			request.setAttribute("cpf_cnpj", cliente.getCpf_cnpj());
			request.setAttribute("endereco", cliente.getEndereco());
			request.setAttribute("email", cliente.getEmail());
			request.setAttribute("telefone", cliente.getTelefone());
			request.setAttribute("data_nasc", DataUtil.toString(cliente.getData_nasc(), "dd/MM/yyyy"));
			request.setAttribute("idClienteEditar", cliente.getID());

			request.getRequestDispatcher("cadastrocliente.jsp").forward(request, response);

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
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	public String getTeste() {
		return teste + "ok.";
	}

	public void setTeste(String teste) {
		this.teste = teste;
	}

}
