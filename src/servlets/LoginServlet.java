package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.conexao.ConexaoBD;


@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		try 
		{
			ConexaoBD conexaoBD = new ConexaoBD();
			if(conexaoBD.verificaLogin(login, senha))
			{
				conexaoBD.closeConnection();
				response.sendRedirect("home.jsp");
				return;
			}
			conexaoBD.closeConnection();
		} 
		catch(Exception e) 
		{ e.printStackTrace(); }
		
		request.setAttribute("mensagemErro", "Login Inválido");
		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
	    rd.forward(request, response); 
	}

}
