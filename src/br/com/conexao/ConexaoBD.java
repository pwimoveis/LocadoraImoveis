package br.com.conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.model.Cliente;
import br.com.model.Funcionario;
import br.com.utils.DataUtil;

public class ConexaoBD {
	
	private Connection conn;
	
	/**
	 * Cria a conexão com o banco de dados
	 * Esta conexão deve ser fechada. Após usada chame o metodo closeConnection()
	 * @throws Exception
	 */
	public ConexaoBD() throws Exception {
		super();
		FactoryConnection factoryConnection = new FactoryConnection();
		Class.forName("org.postgresql.Driver");
		this.conn = factoryConnection.getConexao("5432", "li", "postgres", "postgres");
	}
	
	public void closeConnection() throws SQLException{
		if(this.conn != null){
			this.conn.close();
		}
	}
	
	public Connection getConn() {
		return this.conn;
	}
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	///FUNCIONARIO
	public List<Funcionario> consultaFuncionario() throws SQLException{
		PreparedStatement prepared = this.conn.prepareStatement("select * from funcionario order by nome asc");
		ResultSet resultSet = prepared.executeQuery();
		
		List<Funcionario> funcionarioList = new ArrayList<Funcionario>();
		
		int i = 0;
		while (resultSet.next()) {
			i++;
			Funcionario funcionario = new Funcionario();
			funcionario.setCpf(resultSet.getString("CPF"));
			funcionario.setDataNascimento(resultSet.getDate(("DATA_NASC")));
			funcionario.setEmail(resultSet.getString("EMAIL"));
			funcionario.setEndereco(resultSet.getString("ENDERECO"));
			funcionario.setID(resultSet.getInt("ID"));
			funcionario.setLogin(resultSet.getString("LOGIN"));
			funcionario.setNome(resultSet.getString("NOME"));
			funcionario.setRg(resultSet.getString("RG"));
			funcionario.setSenha(resultSet.getString("SENHA"));
			funcionario.setTelefone(resultSet.getString("TELEFONE"));
			
			//Adiciona funcionario na lista de retorno
			funcionarioList.add(funcionario);
		}
		prepared.close();
		resultSet.close();
		
		if(i < 1){
			System.out.println("Nenhum registro encontrado.");
		}
		return funcionarioList;
	}
	
	public Funcionario pesquisaFuncionarioPorID(int id) throws SQLException{
		PreparedStatement prepared = this.conn.prepareStatement("select * from funcionario where id = " + id);
		ResultSet resultSet = prepared.executeQuery();
		
		Funcionario funcionario = new Funcionario();
		int i = 0;
		while (resultSet.next()) {
			i++;
			funcionario.setCpf(resultSet.getString("CPF"));
			funcionario.setDataNascimento(resultSet.getDate(("DATA_NASC")));
			funcionario.setEmail(resultSet.getString("EMAIL"));
			funcionario.setEndereco(resultSet.getString("ENDERECO"));
			funcionario.setID(resultSet.getInt("ID"));
			funcionario.setLogin(resultSet.getString("LOGIN"));
			funcionario.setNome(resultSet.getString("NOME"));
			funcionario.setRg(resultSet.getString("RG"));
			funcionario.setSenha(resultSet.getString("SENHA"));
			funcionario.setTelefone(resultSet.getString("TELEFONE"));
		}
		prepared.close();
		resultSet.close();
		
		return funcionario;
	}
	public void excluiFuncionario(int id) throws SQLException{
		StringBuilder sb = new StringBuilder();
		sb.append(" delete from funcionario where id in (" + id + ")");
		
		PreparedStatement prepared = this.conn.prepareStatement(sb.toString());
		int registroInserido = prepared.executeUpdate();
		prepared.close();
		System.out.println("Registro deletado: " + ((registroInserido == 1) ? "true" : "false"));
	}
	
	public void insereFuncionario(Funcionario funcionario) throws SQLException{
		StringBuilder sb = new StringBuilder();
		
		//Identifica se é insert ou update
		boolean isInsert = (funcionario.getID() == null ? true : false);
		
		if(isInsert){
			sb.append(" insert into FUNCIONARIO ( ID, CPF, DATA_NASC, EMAIL, ENDERECO, LOGIN, NOME, RG, SENHA, TELEFONE ) ");
			sb.append(" values (nextval('ID_FUNCIONARIO'), '" + funcionario.getCpf() + "', '" + "2000-02-02" + "', '" + funcionario.getEmail() + 
					"', '" + funcionario.getEndereco() + "', '" + funcionario.getLogin() + "', '" + funcionario.getNome() + "', '" + funcionario.getRg() + "', '" + 
					funcionario.getSenha() + "', '" + funcionario.getTelefone() + "');");

		}else{
			sb.append(" update FUNCIONARIO set CPF = '" + funcionario.getCpf() + "', DATA_NASC = '2000-02-02', EMAIL = '" + funcionario.getEmail() + "', ENDERECO = '" + funcionario.getEndereco() +
					"', LOGIN = '" + funcionario.getLogin() + "', NOME = '" + funcionario.getNome() + "', RG = '" + funcionario.getRg() + "', SENHA = '" + funcionario.getSenha() + "', TELEFONE = '" + funcionario.getTelefone() + "'");
			sb.append(" where ID = " + funcionario.getID());
		}
		
		
		PreparedStatement prepared = this.conn.prepareStatement(sb.toString());
		int registroInserido = prepared.executeUpdate();
		prepared.close();
		System.out.println("Registro inserido: " + ((registroInserido == 1) ? "true" : "false"));
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	///CLIENTE
	public List<Cliente> consultaCliente(String nome, String rg, String cpfcnpj) throws SQLException
	{
		StringBuffer query = new StringBuffer();
		query.append("SELECT * FROM cliente");
		query.append(" WHERE id IS NOT NULL");
		
		if(nome!=null && nome.trim().length()>0)
		{ query.append(" AND UPPER(nome) LIKE UPPER('%" + nome + "%')"); }
	
		if(rg!=null && rg.trim().length()>0)
		{ query.append(" AND UPPER(rg) LIKE UPPER('%" + rg + "%')"); }
	
		if(cpfcnpj!=null && cpfcnpj.trim().length()>0)
		{ query.append(" AND UPPER(cpfcnpj) LIKE UPPER('%" + cpfcnpj + "%')"); }
	
		query.append(" ORDER BY nome ASC");
		
		
		PreparedStatement prepared = this.conn.prepareStatement(query.toString());
		ResultSet resultSet = prepared.executeQuery();
		
		List<Cliente> clienteList = new ArrayList<Cliente>();
		
		int i = 0;
		while (resultSet.next()) {
			i++;
			Cliente cliente = new Cliente();
			cliente.setID(resultSet.getInt("id"));
			cliente.setTipo_pessoa(resultSet.getString("tipo_pessoa"));
			cliente.setNome(resultSet.getString("nome"));
			cliente.setRg(resultSet.getString("rg"));
			cliente.setCpf_cnpj(resultSet.getString("cpf_cnpj"));
			cliente.setEndereco(resultSet.getString("endereco"));
			cliente.setEmail(resultSet.getString("email"));
			cliente.setTelefone(resultSet.getString("telefone"));
			cliente.setData_nasc(resultSet.getDate("data_nasc"));
			
			//Adiciona funcionario na lista de retorno
			clienteList.add(cliente);
		}
		prepared.close();
		resultSet.close();
		
		if(i < 1){
			System.out.println("Nenhum registro encontrado.");
		}
		return clienteList;
	}
	
	public Cliente pesquisaClientePorID(int id) throws SQLException{
		PreparedStatement prepared = this.conn.prepareStatement("select * from cliente where id = " + id);
		ResultSet resultSet = prepared.executeQuery();
		
		Cliente cliente = new Cliente();
		int i = 0;
		while (resultSet.next()) {
			i++;
			
			cliente.setID(resultSet.getInt("id"));
			cliente.setTipo_pessoa(resultSet.getString("tipo_pessoa"));
			cliente.setNome(resultSet.getString("nome"));
			cliente.setRg(resultSet.getString("rg"));
			cliente.setCpf_cnpj(resultSet.getString("cpf_cnpj"));
			cliente.setEndereco(resultSet.getString("endereco"));
			cliente.setEmail(resultSet.getString("email"));
			cliente.setTelefone(resultSet.getString("telefone"));
			cliente.setData_nasc(resultSet.getDate("data_nasc"));
		}
		prepared.close();
		resultSet.close();
		
		return cliente;
	}
	public void excluiCliente(int id) throws SQLException{
		StringBuilder sb = new StringBuilder();
		sb.append(" delete from cliente where id in (" + id + ")");
		
		PreparedStatement prepared = this.conn.prepareStatement(sb.toString());
		int registroInserido = prepared.executeUpdate();
		prepared.close();
		System.out.println("Registro deletado: " + ((registroInserido == 1) ? "true" : "false"));
	}
	
	public void insereCliente(Cliente cliente) throws SQLException{
		StringBuilder sb = new StringBuilder();
		
		//Identifica se é insert ou update
		boolean isInsert = (cliente.getID() == null ? true : false);
		
		if(isInsert){
			sb.append(" insert into CLIENTE ( id, tipo_pessoa, nome, rg, cpf_cnpj, endereco, email, telefone, data_nasc ) ");
			sb.append(" values (nextval('ID_CLIENTE'), '" + cliente.getTipo_pessoa() + "', '" + cliente.getNome() + "', '" + cliente.getRg() + 
					"', '" + cliente.getCpf_cnpj() + "', '" + cliente.getEndereco() + "', '" + cliente.getEmail() + "', '" + cliente.getTelefone() + "', " + 
					((cliente.getData_nasc()!=null) ? "'" + DataUtil.toString(cliente.getData_nasc(), "yyyy-MM-dd") + "'" : null) + ");");

		}else{
			sb.append(" update CLIENTE set tipo_pessoa = '" + cliente.getTipo_pessoa() + "', data_nasc = " + ((cliente.getData_nasc()!=null) ? "'" + DataUtil.toString(cliente.getData_nasc(), "yyyy-MM-dd") + "'" : null) + ", email = '" + cliente.getEmail() + "', ENDERECO = '" + cliente.getEndereco() +
					"', NOME = '" + cliente.getNome() + "', RG = '" + cliente.getRg() + "', cpf_cnpj = '" + cliente.getCpf_cnpj() + "', TELEFONE = '" + cliente.getTelefone() + "'");
			sb.append(" where ID = " + cliente.getID());
		}

		PreparedStatement prepared = this.conn.prepareStatement(sb.toString());
		int registroInserido = prepared.executeUpdate();
		prepared.close();
		System.out.println("Registro inserido: " + ((registroInserido == 1) ? "true" : "false"));
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public void consultaRegistro() throws SQLException{

		PreparedStatement prepared = this.conn.prepareStatement("select * from cliente order by id asc");
		ResultSet resultSet = prepared.executeQuery();
		
		int i = 0;
		while (resultSet.next()) {
			i++;
			System.out.println("-------------");
			System.out.println("ID: " + resultSet.getString("ID"));
			System.out.println("TIPO_PESSOA: " + resultSet.getString("TIPO_PESSOA"));
			System.out.println("NOME: " + resultSet.getString("NOME"));
			System.out.println("RG: " + resultSet.getString("RG"));
			System.out.println("CPF_CNPJ: " + resultSet.getString("CPF_CNPJ"));
			System.out.println("ENDERECO: " + resultSet.getString("ENDERECO"));
			System.out.println("EMAIL: " + resultSet.getString("EMAIL"));
			System.out.println("TELEFONE: " + resultSet.getString("TELEFONE"));
			System.out.println("DATA_NASC: " + resultSet.getString("DATA_NASC"));
		}
		prepared.close();
		resultSet.close();
		
		if(i < 1){
			System.out.println("Nenhum registro encontrado.");
		}
	}
	
	public void insereRegistro() throws SQLException{
		String ID = "2";
		StringBuilder sb = new StringBuilder();
		sb.append(" insert into CLIENTE ( id, tipo_pessoa, nome, rg, cpf_cnpj, endereco, email, telefone, data_nasc) ");
		sb.append(" values (" + ID + ", 'M', 'Alex Fagundes', '478930256', '87656522907', 'Avenida jaragua', 'alex@alex.com.br', '39372011', '1985-10-29');");
		
		PreparedStatement prepared = this.conn.prepareStatement(sb.toString());
		int registroInserido = prepared.executeUpdate();
		prepared.close();
		System.out.println("Registro inserido: " + ((registroInserido == 1) ? "true" : "false"));
	}
	
	public void atualizaRegistro() throws SQLException{
		String ID = "2";
		StringBuilder sb = new StringBuilder();
		sb.append(" update CLIENTE set ID = 2, TIPO_PESSOA = 'M', NOME = 'Alex Fagundes.', RG = '478930257',CPF_CNPJ = '87656522908',");
		sb.append("ENDERECO = 'Avenida Jaragua', EMAIL = 'alex@alex.com', telefone = '39372012', DATA_NASC = '2000-10-29' where id = " + ID);
		
		PreparedStatement prepared = this.conn.prepareStatement(sb.toString());
		int registroInserido = prepared.executeUpdate();
		prepared.close();
		System.out.println("Registro atualizado: " + ((registroInserido == 1) ? "true" : "false"));
	}

	public void deletaRegistro() throws SQLException{
		String ID = "1";
		StringBuilder sb = new StringBuilder();
		sb.append(" delete from cliente where id in (" + ID + ")");
		
		PreparedStatement prepared = this.conn.prepareStatement(sb.toString());
		int registroInserido = prepared.executeUpdate();
		prepared.close();
		System.out.println("Registro deletado: " + ((registroInserido == 1) ? "true" : "false"));
	}
}
