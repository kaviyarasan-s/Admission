package com.chainsys.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chainsys.dao.AdmissionDAO;
import com.chainsys.model.Branch;
import com.chainsys.model.Course;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class BranchServlet
 */

public class BranchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		 int departments=Integer.parseInt(request.getParameter("departments"));
		 System.out.println(departments);
		    Branch branch = new Branch();
	        AdmissionDAO dao = new AdmissionDAO();
	        
	        branch.setCourse_id(departments);
	        Map<Integer,String> list=dao.findByCourse(branch);
	      
	     // Get Gson object
			Gson gson = new GsonBuilder().setPrettyPrinting().create();

			// create JSON String from Object
			String jsoncourse = gson.toJson(list);
			response.getWriter().write(jsoncourse);
			
        
        
	}

}
