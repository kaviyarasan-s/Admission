<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<title>Application form</title>
<style>
*[role="form"] {
	max-width: 530px;
	padding: 15px;
	margin: 0 auto;
	border-radius: 0.3em;
}

*[role="form"] h2 {
	font-family: 'Open Sans', sans-serif;
	font-size: 40px;
	font-weight: 600;
	color: #000000;
	text-align: center;
	text-transform: uppercase;
	letter-spacing: 4px;
}

.above {
	text-align: center;
	font-family: 'Kaushan Script', cursive;
	padding-top: 5px;
	padding-bottom: 10px;
	background-color: #b0e8e2;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
	$(document)
			.ready(
					function() {

						$("#course")
								.change(
										function() {
											$('#departments').empty();
											$
													.ajax({
														url : 'ApplicationServlet',
														type : 'post',
														data : {
															course : $(
																	"#course")
																	.val()
														},
														success : function(data) {
															var x = JSON
																	.parse(data);
															/* var x=JSON.parse(data,(key,value)=>{
																 $('#departments').append('<option value='+key+'>'+value+'</option>');
															});
															 */
															$('#departments')
																	.append(
																			'<option value="">Select</option>');
															for ( var key in x) {
																if (x
																		.hasOwnProperty(key)) {
																	$(
																			'#departments')
																			.append(
																					'<option value='+key+'>'
																							+ x[key]
																							+ '</option>');
																}
															}
														}

													});
											//alert("hi");

										});

						$("#departments")
								.change(
										function() {
											//alert($("#departments").val());
											$
													.ajax({
														url : 'BranchServlet',
														type : 'post',
														data : {
															departments : $(
																	"#departments")
																	.val()
														},
														success : function(data) {
															console.log(data);
															var x = JSON
																	.parse(data);

															$('#branch')
																	.append(
																			'<option value="">Select</option>');
															for ( var key in x) {
																if (x
																		.hasOwnProperty(key)) {
																	$('#branch')
																			.append(
																					'<option value='+key+'>'
																							+ x[key]
																							+ '</option>');
																}
															}
														}

													});
											//alert("hi");

										});

					});
</script>
	
</head>
<body>
	<div class="above">
		<h1>CHAINSYS UNIVERSITY</h1>
		<h2>ONLINE APPLICATION FORM</h2>
	</div>
	<div class="container">
		<form class="form-horizontal" role="form" action="ApplyNowServlet"
			method="post">
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">Name*</label>
				<div class="col-sm-9">
					<input type="text" name="name" placeholder="Name"
						class="form-control" autofocus required>
				</div>
			</div>
			<div class="form-group">
				<label for="fathername" class="col-sm-3 control-label">Father's
					Name*</label>
				<div class="col-sm-9">
					<input type="text" name="fathername" placeholder="Father's  Name"
						class="form-control" autofocus required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">Gender</label>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio"
								name="gender" value="Female">Female
							</label>
						</div>
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio"
								name="gender" value="Male">Male
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="birthDate" class="col-sm-3 control-label">Date
					of Birth*</label>
				<div class="col-sm-9">
					<input type="date"  name="dateofbirth"
						class="form-control" required>
				</div>
			</div>
			<div class="form-group">
				<label for="phoneNumber" class="col-sm-3 control-label">Phone
					number* </label>
				<div class="col-sm-9">
					<input type="tell" name="phoneNumber"
						placeholder="Phone number" class="form-control" required>
					<span class="help-block">Your phone number won't be
						disclosed anywhere </span>
				</div>
			</div>
			<div class="form-group">
				<label for="Nationality" class="col-sm-3 control-label">Nationality*
				</label>
				<div class="col-sm-9">
					<input type="text" id="country" placeholder="Nationality"
						class="form-control" name="country" required>
				</div>
			</div>
			<div class="form-group">
				<label for="state" class="col-sm-3 control-label">State*</label>
				<div class="col-sm-9">
					<input type="text" name="state" placeholder="State"
						class="form-control" required>
				</div>
			</div>
			<div class="form-group">
				<label for="district" class="col-sm-3 control-label">District*</label>
				<div class="col-sm-9">
					<input type="text" name="district" placeholder="District"
						class="form-control" required>
				</div>
			</div>

			<div class="form-group">
				<label for="schoolname" class="col-sm-3 control-label">School
					Name* </label>
				<div class="col-sm-9">
					<input type="text" name="schoolname" placeholder="School name"
						class="form-control" required>
				</div>
			</div>
			<div class="form-group">
				<label for="totalmark" class="col-sm-3 control-label">Total
					marks* </label>
				<div class="col-sm-9">
					<input type="number" name="totalmark"
						placeholder="Total marks you scored in HSC" class="form-control"
						required>
				</div>
			</div>
			<div class="form-group">
				<label for="course" class="col-sm-3 control-label">Course</label>
				<div class="col-sm-9">
					<select class="browser-default custom-select" name="course"
						id="course">
						<option value="engineering">Engineering</option>
						<option value="arts">Arts</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="course" class="col-sm-3 control-label">Departments</label>
				<div class="col-sm-9">
					<select class="browser-default custom-select" name="departments"
						id="departments">
						<option value="">Select</option>
						<%-- <c:forEach items="${STREAM}" var="stream">
					<option value="${stream.id}">${stream.name}</option>
				</c:forEach> --%>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="course" class="col-sm-3 control-label">Branch</label>
				<div class="col-sm-9">
					<select class="browser-default custom-select" name="branch"
						id="branch">
						<%-- <c:forEach items="${STREAM}" var="stream">
					<option value="${stream.id}">${stream.name}</option>
				</c:forEach> --%>
					</select>
				</div>
			</div>

			

			<!-- /.form-group -->
			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<span class="help-block">*Required fields</span>
				</div>
			</div>
			<button type="submit" class="btn btn-primary btn-block">Apply</button>
		</form>
		<!-- /form -->
	</div>
	<!-- ./container -->
</body>
</html>