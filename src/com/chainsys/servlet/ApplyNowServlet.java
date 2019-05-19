package com.chainsys.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chainsys.dao.AdmissionDAO;
import com.chainsys.model.Application;
import com.chainsys.model.User;

/**
 * Servlet implementation class ApplyNowServlet
 */
@WebServlet("/ApplyNowServlet")
public class ApplyNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    String name=request.getParameter("name");
	        String fathername=request.getParameter("fathername");
	        String param=request.getParameter("gender");
	        char gender=param.charAt(0);
	       // System.out.println(request.getParameter("dateofbirth"));
	        LocalDate dateofbirth=LocalDate.parse(request.getParameter("dateofbirth"));
	        Long phonenumber=Long.parseLong(request.getParameter("phoneNumber"));
	        String country=request.getParameter("country");
	        String state=request.getParameter("state");
	        String district=request.getParameter("district");
	        String schoolname=request.getParameter("schoolname");
	        int totalmark=Integer.parseInt(request.getParameter("totalmark"));
	        String course=request.getParameter("course");
	        int department = Integer.parseInt(request.getParameter("departments"));
	        int branch  = Integer.parseInt(request.getParameter("branch"));
	        //String type=request.getParameter("type");
		    
	        HttpSession session = request.getSession(false);
	       int id= (int) session.getAttribute("Id");
	       
	       System.out.println("Session called id " + id);
	       // System.out.println("apply"+ session.getAttribute("Id"));
	       // System.out.println("apply now servlet");
	        Application application = new Application();
	        application.setCountry(country);
	       
	        application.setCourse(course);
	        application.setDate_of_birth(dateofbirth);
	        application.setDistrict(district);
	        application.setGender(gender);
	        application.setPhone_number(phonenumber);
	        application.setFather_name(fathername);
	        application.setName(name);
	        application.setSchool_name(schoolname);
	        application.setState(state);
	        application.setTotal_mark(totalmark);
	        application.setDepartment(department);
	        application.setBranch(branch);
	       // application.setType(type);
	       application.setCreated_date(LocalDate.now());
	       application.setModified_date(LocalDate.now());
	       application.setCreated_by(id);
	       application.setModified_by(id);
	       application.setUser_id(id);
	       System.out.println("dept "+department);
	       System.out.println("branch "+branch);
	       session.setAttribute("myCourse", course);
	       session.setAttribute("myname", name);
	       session.setAttribute("mydept", department);
	       session.setAttribute("myBranch", branch);
	       session.setAttribute("mymark", totalmark);
	        AdmissionDAO dao = new AdmissionDAO();
          boolean result;
	        try {
				
				result = dao.insertApplication(application);
				System.out.println(result);
				if (result) {
					System.out.println("success !");
					/*List<Application> list = dao.findAll(application);
					for(Application s:list) {
						System.out.println(s);
					}*/
					//request.setAttribute("APPLY", list);
					
					//show fees
					
					RequestDispatcher rd = request.getRequestDispatcher("payment.jsp");
					rd.forward(request, response);
				}
			} 
	        catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
