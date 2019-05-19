package com.chainsys.model;

public class Quotation {
	private int id;
	private String name;
	private String course;
	private int branch;
	private int department;
	private float quote;
	private String departmentname;
	private String branchname;
	private int total_mark;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public int getBranch() {
		return branch;
	}
	public void setBranch(int branch) {
		this.branch = branch;
	}
	public int getDepartment() {
		return department;
	}
	public void setDepartment(int department) {
		this.department = department;
	}
	public float getQuote() {
		return quote;
	}
	public void setQuote(float quote) {
		this.quote = quote;
	}
	public String getDepartmentname() {
		return departmentname;
	}
	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}
	public String getBranchname() {
		return branchname;
	}
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}
	public int getTotal_mark() {
		return total_mark;
	}
	public void setTotal_mark(int total_mark) {
		this.total_mark = total_mark;
	}
	
	

}
