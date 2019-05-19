<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quotation</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>
	.center {
	margin: auto;
	width: 100%;
	border: 3px;
	padding-top: 150px;
	padding-right: 30px;
	padding-bottom: 50px;
	padding-left: 80px;
}
	</style>
</head>
<body>
<h1>Admission bidding process</h1>
<h2> ${result} </h2>
<div class="center">

		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">S.NO</th>
					<th scope="col">Name</th>
					<th scope="col">Course</th>
					<th scope="col">Branch</th>
					<th scope="col">Department</th>
					<th scope="col">HSC Mark</th>
					<th scope="col">Quotation Amount</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${USER}">
					<tr>
						<td>${user.id}</td>
						<td>${user.name}</td>
						<td>${user.course}</td>
						<td>${user.departmentname}</td>
						<td>${user.branchname}</td>
						<td>${user.total_mark}</td>
						<td>${user.quote}</td>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>