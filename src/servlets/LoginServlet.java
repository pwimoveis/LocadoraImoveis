package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		if(login.equals("renato") && senha.equals("123"))
		{
			response.sendRedirect("home.jsp");
		}
		else
		{
			request.setAttribute("mensagemErro", "Login Inválido");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);  
		}
	}

}
