package com.chainsys.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chainsys.model.Application;
import com.chainsys.model.Branch;
import com.chainsys.model.Course;
import com.chainsys.model.Quotation;
import com.chainsys.model.User;
import com.chainsys.util.ConnectionUtil;

import oracle.net.aso.r;

/**
 * @author kart2115
 *
 */
public class AdmissionDAO {
	public boolean insertUser(User user) throws ClassNotFoundException {
		boolean success = false;
		try {
			Connection connection = ConnectionUtil.getConnection();
			String sql = "insert into trn_user_reg(user_id,name,email,password) values(user_id_seq.nextval,?,?,?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getPassword());
			int rows = preparedStatement.executeUpdate();
			System.out.println("Rows inserted: " + rows);
			if (rows > 0) {
				success = true;
				String sql1 = "insert into login values(user_id_seq.currval,?,?)";
				PreparedStatement preparedStatement2 = connection.prepareStatement(sql1);
				preparedStatement2.setString(1, user.getEmail());
				preparedStatement2.setString(2, user.getPassword());
				preparedStatement2.executeUpdate();
			}
			ConnectionUtil.close(connection, preparedStatement, null);
		} catch (SQLException e) {
			e.printStackTrace();
			success = false;
		}
		return success;
	}

	/**
	 * @param course
	 * @return
	 */
	public Map<Integer, String> findByStream(Course course) {
		Map<Integer, String> list = new HashMap<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = ConnectionUtil.getConnection();
			String sql = "select course_id,name from course where stream_id=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, course.getStream_id());
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				list.put(resultSet.getInt("course_id"), resultSet.getString("name"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(connection, preparedStatement, resultSet);
		}
		return list;
	}

	public Map<Integer, String> findByCourse(Branch branch) {
		Map<Integer, String> list = new HashMap<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = ConnectionUtil.getConnection();
			String sql = "select branch_id,name from branch where course_id=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, branch.getCourse_id());
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				list.put(resultSet.getInt("branch_id"), resultSet.getString("name"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(connection, preparedStatement, resultSet);
		}
		return list;
	}

	public boolean insertApplication(Application application) throws ClassNotFoundException {
		boolean success = false;
		try {
			Connection connection = ConnectionUtil.getConnection();
			String sql = "insert into trn_application(application_id,name,father_name,gender,date_of_birth,phone_number,country,state,district,school_name,total_mark,course,department,branch,created_by,created_date,modified_by,modified_date,user_id) values(application_id_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, application.getName());
			preparedStatement.setString(2, application.getFather_name());
			preparedStatement.setString(3, String.valueOf(application.getGender()));
			preparedStatement.setDate(4, Date.valueOf(application.getDate_of_birth()));
			preparedStatement.setLong(5, application.getPhone_number());
			preparedStatement.setString(6, application.getCountry());
			preparedStatement.setString(7, application.getState());
			preparedStatement.setString(8, application.getDistrict());
			preparedStatement.setString(9, application.getSchool_name());
			preparedStatement.setInt(10, application.getTotal_mark());
			preparedStatement.setString(11, application.getCourse());
			preparedStatement.setInt(12, application.getDepartment());
			preparedStatement.setInt(13, application.getBranch());
			preparedStatement.setInt(14, application.getCreated_by());
			preparedStatement.setDate(15, Date.valueOf(application.getCreated_date()));
			preparedStatement.setInt(16, application.getModified_by());
			preparedStatement.setDate(17, Date.valueOf(application.getModified_date()));
			preparedStatement.setInt(18, application.getUser_id());
			int rows = preparedStatement.executeUpdate();
			System.out.println("Rows inserted: " + rows);
			if (rows > 0) {
				success = true;
				// findAll();
			}
			ConnectionUtil.close(connection, preparedStatement, null);
		} catch (SQLException e) {
			e.printStackTrace();
			success = false;
		}
		return success;
	}

	public int get_user_id(User user) {
		int id = 0;
		try {
			Connection connection = ConnectionUtil.getConnection();
			String sql = "select login_id from login where user_name=? and password=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getEmail());
			preparedStatement.setString(2, user.getPassword());
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {

				id = resultSet.getInt("login_id");
				System.out.println(id);

			}
			ConnectionUtil.close(connection, preparedStatement, resultSet);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return id;
	}

	public List<Application> findAll(Long phonenumber) {
		List<Application> list = new ArrayList<Application>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Application application;
		System.out.println(phonenumber);
		try {
			connection = ConnectionUtil.getConnection();
			String sql = "select a.application_id as application_id, a.name as name,a.father_name as father_name,a.gender as gender,a.date_of_birth as date_of_birth,\r\n"
					+ "a.phone_number as phone_number,a.country as country,a.state as state,a.district as district,a.school_name as school_name,\r\n"
					+ "a.total_mark as total_mark,a.course as course,c.name as department,b.name as branch from trn_application a join branch b on\r\n"
					+ "b.branch_id=a.branch join course c on c.course_id=a.department where a.phone_number=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setLong(1, phonenumber);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				application = new Application();
				application.setApplication_id(resultSet.getInt("application_id"));
				application.setName(resultSet.getString("name"));
				application.setFather_name(resultSet.getString("father_name"));
				application.setGender(resultSet.getString("gender").charAt(0));
				application.setDate_of_birth(resultSet.getDate("date_of_birth").toLocalDate());
				application.setPhone_number(resultSet.getLong("phone_number"));
				application.setCountry(resultSet.getString("country"));
				application.setState(resultSet.getString("state"));
				application.setDistrict(resultSet.getString("district"));
				application.setSchool_name(resultSet.getString("school_name"));
				application.setTotal_mark(resultSet.getInt("total_mark"));
				application.setCourse(resultSet.getString("course"));
				application.setDepartmentname(resultSet.getString("department"));
				application.setBranchname(resultSet.getString("branch"));
				list.add(application);
			}
			ConnectionUtil.close(connection, preparedStatement, resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Float viewFees(int branch) {
		float fees = 0;
		try {
			Connection connection = ConnectionUtil.getConnection();
			String sql = "select total_fees from merit where branch_id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,branch);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {

				fees = resultSet.getFloat("total_fees");
				System.out.println(fees);

			}
			ConnectionUtil.close(connection, preparedStatement, resultSet);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return fees;
	}
	
	public List<String> getName(int branch) {
		List<String> list=new ArrayList<String>();
		try {
			Connection connection = ConnectionUtil.getConnection();
			String sql = "select a.name as branch_name, b.name as course_name from branch a join course b on a.course_id=b.course_id where a.branch_id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, branch);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
               String branchname=resultSet.getString("branch_name");
               String coursename=resultSet.getString("course_name");
               list.add(branchname);
               list.add(coursename);

			}
			ConnectionUtil.close(connection, preparedStatement, resultSet);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
		
	}
	
	public List<Quotation> insertQuotation(Quotation quotation) {
		List<Quotation> list = new ArrayList<Quotation>();
		//boolean success = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = ConnectionUtil.getConnection();
			String sql = "insert into quotation(quotation_id,user_name,course,department,branch,total_mark,quote) values(quatation_id_seq.nextval,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, quotation.getName());
			preparedStatement.setString(2, quotation.getCourse());
			preparedStatement.setInt(3, quotation.getDepartment());
			preparedStatement.setInt(4, quotation.getBranch());
			preparedStatement.setInt(5, quotation.getTotal_mark());
			preparedStatement.setFloat(6, quotation.getQuote());
			int rows = preparedStatement.executeUpdate();
			System.out.println("Quotation Rows inserted: " + rows);
			if (rows > 0) {
			//	success = true;
				String sql1 = "select a.quotation_id,a.user_name,a.course,b.name as department_name,\r\n" + 
						"c.name as branch_name,a.total_mark,a.quote from quotation a \r\n" + 
						"join course b on a.department=b.course_id join branch c on c.branch_id = a.branch";
				preparedStatement = connection.prepareStatement(sql1);
				resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					quotation=new Quotation();
					quotation.setId(resultSet.getInt("quotation_id"));
	               quotation.setName(resultSet.getString("user_name"));
	               quotation.setCourse(resultSet.getString("course"));
	               quotation.setDepartmentname(resultSet.getString("department_name"));
	               quotation.setBranchname(resultSet.getString("branch_name"));
	               quotation.setTotal_mark(resultSet.getInt("total_mark"));
	               quotation.setQuote(resultSet.getFloat("quote"));
	               list.add(quotation);

				}
				
			}
			
			ConnectionUtil.close(connection, preparedStatement, resultSet);
		}
	     catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
