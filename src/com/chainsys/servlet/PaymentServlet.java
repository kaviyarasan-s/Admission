package com.chainsys.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chainsys.dao.AdmissionDAO;
import com.chainsys.model.Quotation;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("called");
		String type=request.getParameter("drop");
		System.out.println(type);
		String name=request.getParameter("pay");
		HttpSession session=request.getSession(false);
		String course=(String) session.getAttribute("myCourse");
		int branch=(int) session.getAttribute("myBranch");
		int department=(int) session.getAttribute("mydept");
		int total=(int) session.getAttribute("mymark");
		System.out.println(course);
		System.out.println(branch);
		String user_name=(String) session.getAttribute("myname");
		
		//System.out.println(type);
		AdmissionDAO dao = new AdmissionDAO();
		Quotation quotation = new Quotation();
		List<String> list=dao.getName(branch);
		if("payment".equalsIgnoreCase(name)) {
			request.setAttribute("result", "Payment Successful");
			RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
			rd.forward(request, response);
		}
		else if("quote".equalsIgnoreCase(name)) {
			request.setAttribute("result", user_name+ "Your quotation is noted");
			float quote = Float.parseFloat(request.getParameter("quote"));
			request.setAttribute("quote",quote);
			quotation.setQuote(quote);
			quotation.setBranch(branch);
			quotation.setName(user_name);
			quotation.setCourse(course);
			quotation.setDepartment(department);
			quotation.setTotal_mark(total);
			List<Quotation> quote_list=dao.insertQuotation(quotation);
			 request.setAttribute("USER", quote_list);
			RequestDispatcher rd = request.getRequestDispatcher("quotation.jsp");
			rd.forward(request, response);
		}
		float fees=dao.viewFees(branch);
		Map<Integer, String> map = new HashMap<>();
		map.put(1, course);
		map.put(2, list.get(0));
		map.put(3, list.get(1));
		map.put(4, String.valueOf(fees));
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsoncourse = gson.toJson(map);
		response.getWriter().write(jsoncourse);
		
		/*if("merit".equalsIgnoreCase(type)) {
			//float fees=dao.viewFees(branch);
			//request.setAttribute("FEES",fees);
			//request.setAttribute("COURSE",course);
			//request.setAttribute("LIST",list);
			map.put(1, course);
			map.put(2, list.get(0));
			map.put(3, list.get(1));
			map.put(4, String.valueOf(fees));
			Gson gson = new GsonBuilder().setPrettyPrinting().create();

			// create JSON String from Object
			String jsoncourse = gson.toJson(map);
			response.getWriter().write(jsoncourse);
			//RequestDispatcher rd = request.getRequestDispatcher("merit.jsp");
			//rd.forward(request, response);
		}
		else if("management".equalsIgnoreCase(type)) {
			//request.setAttribute("COURSE",course);
			//request.setAttribute("LIST",list);
			map.put(1, course);
			map.put(2, list.get(0));
			map.put(3, list.get(1));
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String jsoncourse = gson.toJson(map);
			response.getWriter().write(jsoncourse);
			//RequestDispatcher rd = request.getRequestDispatcher("management.jsp");
			//rd.forward(request, response);
		}*/
		
	}
}

