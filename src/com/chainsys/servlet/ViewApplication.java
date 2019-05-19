package com.chainsys.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chainsys.dao.AdmissionDAO;
import com.chainsys.model.Application;

/**
 * Servlet implementation class ViewApplication
 */
@WebServlet("/ViewApplication")
public class ViewApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewApplication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       /*HttpSession session=request.getSession(false);
       int id=(int) session.getAttribute("Id");*/
		Long phonenumber=Long.parseLong(request.getParameter("phonenumber"));
		
		
       
       AdmissionDAO dao = new AdmissionDAO();
       List<Application> list=dao.findAll(phonenumber);
       System.out.println("called");
       for(Application a:list) {
    	   System.out.println(a);
       }
       request.setAttribute("USER", list);
		RequestDispatcher rd = request
				.getRequestDispatcher("user.jsp");
		rd.forward(request, response);
	}

}
