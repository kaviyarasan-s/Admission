package com.chainsys.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chainsys.dao.AdmissionDAO;
import com.chainsys.model.Course;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class ApplicationServlet
 */

public class ApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String course = request.getParameter("course");
		Course courseobj = new Course();
		AdmissionDAO dao = new AdmissionDAO();
		if ("engineering".equals(course)) {
			int stream_id = 101;
			courseobj.setStream_id(stream_id);
		} else if ("arts".equals(course)) {
			int stream_id = 102;
			courseobj.setStream_id(stream_id);
		}

		Map<Integer, String> list = dao.findByStream(courseobj);

		// Get Gson object
		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		// create JSON String from Object
		String jsoncourse = gson.toJson(list);
		response.getWriter().write(jsoncourse);

		/*
		 * Enumeration e = req.getParameterNames(); while(e.hasMoreElements()) { Object
		 * obj = e.nextElement(); String fieldName = (String) obj; String fieldValue =
		 * req.getParameter(fieldName); System.out.println(fieldName + " : " +
		 * fieldValue ); }
		 */
	}
}