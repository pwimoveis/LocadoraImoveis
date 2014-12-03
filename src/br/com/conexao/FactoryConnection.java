package br.com.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class FactoryConnection {
	
	public Connection getConexao(String porta, String baseDados, String usuario, String senha) throws Exception{
		Class.forName("org.postgresql.Driver");
		Connection conn = DriverManager.getConnection( "jdbc:postgresql://localhost:" + porta + "/" + baseDados + "",usuario, senha);
		System.out.println("Conectado!!");
		return conn;
	}
}
