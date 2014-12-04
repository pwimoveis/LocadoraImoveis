package br.com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.conexao.ConexaoBD;
import br.com.model.Contrato;
import br.com.model.Contrato;


@WebServlet("/contrato_controller")
public class ContratoController extends HttpServlet {
	
	public String teste;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContratoController() {
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
			List<Contrato> contratoList = new ArrayList<Contrato>();

			try {
				ConexaoBD conexaoBD = new ConexaoBD();
				contratoList = conexaoBD.consultaContrato(request.getParameter("cliente"), request.getParameter("numero"));
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			request.setAttribute("contratoListRequest", contratoList);
			request.setAttribute("nome", request.getParameter("nome"));
			request.setAttribute("rg", request.getParameter("rg"));

			/*
		RequestDispatcher rd = getServletContext().getRequestDispatcher("consultacontrato.jsp");
		rd.forward(request, response);
			 */

			//		Enumeration e = request.getAttributeNames();
			//	    while (e.hasMoreElements()) {
			//	      String name = (String) e.nextElement();
			//	      System.out.println(name + ": " + request.getAttribute(name) + "<BR>");
			//	    }
			//	    

			request.getRequestDispatcher("consultacontrato.jsp").forward(request, response);
			//Essa linha zera as variaveis do request
			//response.sendRedirect("consultacontrato.jsp");
		}
		
		//ACAO EXLUIR
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("EXCLUIR")){
			String idContrato = request.getParameter("idAcaoGrid");
			
			List<Contrato> contratoList = new ArrayList<Contrato>();
			try {
				ConexaoBD conexaoBD = new ConexaoBD();
				conexaoBD.excluiContrato(Integer.parseInt(idContrato));
				contratoList = conexaoBD.consultaContrato(request.getParameter("cliente"), request.getParameter("numero"));
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			request.setAttribute("contratoListRequest", contratoList);
			request.setAttribute("nome", request.getParameter("nome"));
			request.setAttribute("rg", request.getParameter("rg"));

			request.getRequestDispatcher("consultacontrato.jsp").forward(request, response);
		}
		
		//Botão NOVO e EDITAR
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("NOVO_EDITAR")){

			if(!validacao("NOVO_EDITAR", request.getParameter("datanasc"))){
				
				request.setAttribute("mensagemErro", "Data invalida (DD/MM/AAAA)");
				
				request.setAttribute("cpf", request.getParameter("cpf"));
				request.setAttribute("datanasc", request.getParameter("datanasc"));//datanasc
				request.setAttribute("email", request.getParameter("email"));
				request.setAttribute("endereco", request.getParameter("endereco"));
				request.setAttribute("idContratoEditar", request.getParameter("idEditar"));
				request.setAttribute("login", request.getParameter("login"));
				request.setAttribute("nome", request.getParameter("nome"));
				request.setAttribute("rg", request.getParameter("rg"));
				request.setAttribute("senha", request.getParameter("senha"));
				request.setAttribute("telefone", request.getParameter("telefone"));
				
				request.getRequestDispatcher("cadastrocontrato.jsp").forward(request, response);
			}else{

				List<Contrato> contratoList = new ArrayList<Contrato>();
				Contrato contrato = new Contrato();
				try {
					ConexaoBD conexaoBD = new ConexaoBD();

					Integer idContrato = ((request.getParameter("idEditar") != null && !request.getParameter("idEditar").isEmpty() ? Integer.parseInt(request.getParameter("idEditar")) : null));

//					contrato.setCpf(request.getParameter("cpf"));
//					contrato.setDataNascimento(getParseData(request.getParameter("datanasc")));//datanasc
//					contrato.setEmail(request.getParameter("email"));
//					contrato.setEndereco(request.getParameter("endereco"));
//					contrato.setID(idContrato);
//					contrato.setLogin(request.getParameter("login"));
//					contrato.setNome(request.getParameter("nome"));
//					contrato.setRg(request.getParameter("rg"));
//					contrato.setSenha(request.getParameter("senha"));
//					contrato.setTelefone(request.getParameter("telefone"));

					conexaoBD.insereContrato(contrato);
					contratoList = conexaoBD.consultaContrato(null, null);
					conexaoBD.closeConnection();
				} catch (Exception e1) {
					e1.printStackTrace();
				}

				request.setAttribute("contratoListRequest", contratoList);

				//request.getRequestDispatcher("cadastrocontrato.jsp").forward(request, response);

				//Essa linha zera as variaveis do request
				response.sendRedirect("consultacontrato.jsp");
			}
		}

		//ACAO EDITAR. Chamado no clique do icone na grid
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("EDITAR")){

			String idContrato = request.getParameter("idAcaoGrid");
			Contrato contrato = new Contrato();
			try {
				ConexaoBD conexaoBD = new ConexaoBD();
				contrato = conexaoBD.pesquisaContratoPorID(Integer.parseInt(idContrato));
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

//			request.setAttribute("cpf", contrato.getCpf());
//			request.setAttribute("datanasc", formataData((contrato.getDataNascimento() != null ? contrato.getDataNascimento().toString() : null)));//datanasc
//			request.setAttribute("email", contrato.getEmail());
//			request.setAttribute("endereco", contrato.getEndereco());
//			request.setAttribute("idContratoEditar", contrato.getID());
//			request.setAttribute("login", contrato.getLogin());
//			request.setAttribute("nome", contrato.getNome());
//			request.setAttribute("rg", contrato.getRg());
//			request.setAttribute("senha", contrato.getSenha());
//			request.setAttribute("telefone", contrato.getTelefone());

			request.getRequestDispatcher("cadastrocontrato.jsp").forward(request, response);

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
