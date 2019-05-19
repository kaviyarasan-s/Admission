package com.chainsys.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chainsys.dao.AdmissionDAO;
import com.chainsys.model.User;
import com.cs.auth.Authentication;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("email");
		String password=request.getParameter("password");
		User user = new User();
		user.setEmail(username);
        user.setPassword(password);
        AdmissionDAO dao = new AdmissionDAO();
		int id=dao.get_user_id(user);
		System.out.println("servlet id=" + id);
		try {
			boolean success=Authentication.isLogin(username, password);
			System.out.println(success);
			if(success==true){
				//request.setAttribute("name", "karthika");
				HttpSession session=request.getSession();
				session.setAttribute("Id", id);
				RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
				rd.forward(request, response);
			}

			else {
				request.setAttribute("ERROR",
						"Invalid Email or Password. Try again");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}