package br.com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.conexao.ConexaoBD;
import br.com.model.Cliente;
import br.com.model.Contrato;
import br.com.model.Contrato;
import br.com.model.Funcionario;


@WebServlet("/contrato_controller")
public class ContratoController extends HttpServlet {
	
	@PostConstruct
	public void testeConstruct(){
		System.out.println("passou no poscontruct");
	}
	
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
			request.setAttribute("cliente", request.getParameter("cliente"));
			request.setAttribute("numero", request.getParameter("numero"));

			request.getRequestDispatcher("consultacontrato.jsp").forward(request, response);
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
			request.setAttribute("cliente", request.getParameter("cliente"));
			request.setAttribute("numero", request.getParameter("numero"));

			request.getRequestDispatcher("consultacontrato.jsp").forward(request, response);
		}
		
		//Botão NOVO e EDITAR
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("NOVO_EDITAR")){

			if(!validacao("NOVO_EDITAR", request.getParameter("datainicio")) || !validacao("NOVO_EDITAR", request.getParameter("datafim"))){
				
				request.setAttribute("mensagemErro", "Data invalida (DD/MM/AAAA)");
				
				request.setAttribute("idContratoEditar", request.getParameter("idEditar"));
				request.setAttribute("funcionario", null);
				request.setAttribute("cliente", null);
				request.setAttribute("datainicio", request.getParameter("datainicio"));
				request.setAttribute("datafim", request.getParameter("datafim"));
				request.setAttribute("numero", request.getParameter("numero"));
				request.setAttribute("valor", request.getParameter("valor"));
				
				request.getRequestDispatcher("cadastrocontrato.jsp").forward(request, response);
			}else{

				List<Contrato> contratoList = new ArrayList<Contrato>();
				Contrato contrato = new Contrato();
				try {
					ConexaoBD conexaoBD = new ConexaoBD();

					Integer idContrato = ((request.getParameter("idEditar") != null && !request.getParameter("idEditar").isEmpty() ? Integer.parseInt(request.getParameter("idEditar")) : null));

					Funcionario funcionario = new Funcionario();
					funcionario.setID((request.getParameter("funcionario") != null && !request.getParameter("funcionario").isEmpty() ? Integer.parseInt(request.getParameter("funcionario")) : 
						null ));
					Cliente cliente = new Cliente();
					cliente.setID((request.getParameter("cliente") != null && !request.getParameter("cliente").isEmpty() ? Integer.parseInt(request.getParameter("cliente")) : 
						null ));
					
					contrato.setCliente(cliente);//request.getParameter("cliente")
					contrato.setDataInicio(getParseData(request.getParameter("datainicio")));//datainicio
					contrato.setDataFim(getParseData(request.getParameter("datafim")));//datafim
					contrato.setFuncionario(funcionario);//request.getParameter("funcionario")
					contrato.setId(idContrato);
					contrato.setNumero((request.getParameter("numero") != null ? Integer.parseInt(request.getParameter("numero")) : null));
					contrato.setValor((request.getParameter("valor") != null ? new Double(request.getParameter("valor")) : null));
					
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
		
		//Botão NOVO Carrega Combos
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("NOVO_COMBO")){


				List<Funcionario> funcionarioList = new ArrayList<Funcionario>();
				List<Cliente> clienteList = new ArrayList<Cliente>();
				
				try {
					ConexaoBD conexaoBD = new ConexaoBD();
					funcionarioList = conexaoBD.consultaFuncionario(null, null);
					clienteList = conexaoBD.consultaCliente(null, null, null);
					conexaoBD.closeConnection();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				request.setAttribute("funcionarioListRequest", funcionarioList);
				request.setAttribute("clienteListRequest", clienteList);

				request.getRequestDispatcher("cadastrocontrato.jsp").forward(request, response);

				//Essa linha zera as variaveis do request
				//response.sendRedirect("cadastrocontrato.jsp");
		}

		//ACAO EDITAR. Chamado no clique do icone na grid
		if(request.getParameter("submitBotoes") != null && request.getParameter("submitBotoes").equals("EDITAR")){
			
			List<Funcionario> funcionarioList = new ArrayList<Funcionario>();
			List<Cliente> clienteList = new ArrayList<Cliente>();
			
			String idContrato = request.getParameter("idAcaoGrid");
			Contrato contrato = new Contrato();
			try {
				ConexaoBD conexaoBD = new ConexaoBD();
				contrato = conexaoBD.pesquisaContratoPorID(Integer.parseInt(idContrato));
				funcionarioList = conexaoBD.consultaFuncionario(null, null);
				clienteList = conexaoBD.consultaCliente(null, null, null);
				conexaoBD.closeConnection();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			request.setAttribute("funcionario", null);
			request.setAttribute("cliente", null);
			request.setAttribute("datainicio", formataData((contrato.getDataInicio() != null ? contrato.getDataInicio().toString() : null)));
			request.setAttribute("datafim", formataData((contrato.getDataFim() != null ? contrato.getDataFim().toString() : null)));
			request.setAttribute("numero", contrato.getNumero());
			request.setAttribute("valor", contrato.getValor());
			
			request.setAttribute("funcionario", (contrato.getFuncionario() != null ? contrato.getFuncionario().getID() : null));
			request.setAttribute("cliente", (contrato.getCliente() != null ? contrato.getCliente().getID() : null));
			
			request.setAttribute("idContratoEditar", contrato.getId());			
			request.setAttribute("funcionarioListRequest", funcionarioList);
			request.setAttribute("clienteListRequest", clienteList);
			
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
