package br.com.conexao;

import java.sql.Connection;

public class TesteConexao {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		Class.forName("org.postgresql.Driver");
		FactoryConnection factoryConnection = new FactoryConnection();

		ConexaoBD conexaoBD = new ConexaoBD();
		//Exemplo de consulta
		conexaoBD.consultaRegistro();
		
		//Exemplo de insert
		//conexaoBD.insereRegistro(conn);
		
		//Exemplo de update
		//conexaoBD.atualizaRegistro(conn);
		
		//Exemplo de delete
		conexaoBD.deletaRegistro();
		
		//Fecha a conexao que foi estabelecida
		conexaoBD.closeConnection();
		System.out.println("\n --Execucao finalizada--");
	}
}
