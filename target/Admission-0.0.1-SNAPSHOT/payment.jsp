<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<title>Payment</title>
<style>
h1 {
	text-align: center;
	font-family: 'Kaushan Script', cursive;
	background-color: #b3cbf2;
	width: 100%;
	text-align: center;
	padding-top: 5px;
	padding-bottom: 10px;
	background-color: #b0e8e2;
}

.navbar {
	overflow: hidden;
	background-color: white;
	border: 1px solid;
	padding: 10px;
	box-shadow: 5px 10px 18px #888888;
}

.navbar a {
	float: left;
	text-align: center;
	font-size: 16px;
	border: none;
	outline: none;
	color: black;
	padding: 14px 16px;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
	text-decoration: none;
}

.dropdown {
	float: left;
	overflow: hidden;
}

.dropdown .dropbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: black;
	padding: 14px 16px;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
	background-color: blue;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #709fea;
}

.logout {
	padding-left: 900px;
}

.dropdown:hover .dropdown-content {
	display: block;
}

b {
	font-color: red;
}

.scroll {
	font-size: 50px;
	background-color: yellow;
}

#merit {
	display: none;
}

#management {
	display: none;
}

}
.image {
	background-image: url("image/grat.jpg");
	width: 1300px;
	height: 780px;
}

.drop {
	width: 100px;
	height: 100px;
}

.action {
	margin-left: 550px;
}

table {
	text-align: left;
	width: 50%;
	font-size: 20px;
}

.button {
	background-color: #008CBA;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}

#paybtn {
	width: 150px;
	background-color: #4CAF50;
}

.h2 {
	margin-left: 20px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#drop").change(function() {
			//alert($("#drop").val());
			$
			.ajax({
				url : 'PaymentServlet',
				type : 'post',
				data : {
				   drop :$("#drop").val()
				},
				success : function(data) {
					var x = JSON.parse(data);
					console.log(x['1']);
					
					$(".course").text(x['1']);
					$(".department").text(x['2']);
					$(".branch").text(x['3']);
					$(".fees").text(x['4']);
					if($("#drop").val()=='merit')
						{
						        $("#merit").show();
						        $("#management").hide();      
						}
					else
						{
						$("#management").show();
						$("#merit").hide();
						}
					
				}
			})
		});
		
		$("#paybtn").click(function(){
			console.log('hi');
			console.log($(".fees").text());
			$.ajax({
				url : 'PaymentGateway.html',
				type : 'post',
				data : {
				   amount :$(".fees").text(),
				},
				success : function(data) {
					
				}
			});
		});
		
	});
</script>
</head>
<body>
	<h1>CHAINSYS UNIVERSITY</h1>
	<div class="navbar">
		<a href="homepage.jsp"><b>Home</b></a> <a href="about.jsp"><b>About
				us</b></a>
		<div class="dropdown">
			<button class="dropbtn">
				<b>Academic</b> <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="courses.jsp">Programmes</a> <a href="placement.jsp">Placement</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">
				<b>Admission</b> <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="procedures.jsp">Procedure</a> <a href="application.jsp">Apply
					online</a> <a href="viewapplication.jsp">View Application</a> <a
					href="result.jsp">View Result</a>
			</div>
		</div>
		<div class="logout">
			<a href="index.jsp"><b>Logout</b></a>
		</div>
	</div>
	<br>
	<div class="scroll">
		<marquee width="100%" direction="right" height="130%">
			<b>Confirm your admission confirm your admission</b>
		</marquee>
	</div>
	<div class="action">
		<h2>Apply successfully</h2>
		<h3>Choose your type of admission</h3>
		<div class="drop">
			<select name="type" id="drop" style="font-size: 21px;">
				<option>Select</option>
				<option value="merit">Merit</option>
				<option value="management">Management</option>
			</select>
		</div>

		<div id="merit">
			
				<h2>Merit</h2>
				<table>
					<tr>
						<th>Course</th>
						<td><p class="course"></p></td>
					</tr>
					<tr>
						<th>Department</th>
						<td><p class="department"></p></td>
					</tr>
					<tr>
						<th>Branch</th>
						<td>
							<p class="branch"></p>
						</td>
					</tr>
					<tr>
						<th>Fees</th>
						<td>
							<p class="fees"></p>
						</td>
					</tr>
					<tr>
						<td><button type="submit" id="paybtn" name="pay"
								value="payment">Pay now</td>
					</tr>
					</button>
				</table>
			
		</div>
		<div id="management">
			<form action="PaymentServlet" method="post">
				<h2>Management</h2>
				<table>
					<tr>
						<th>Course</th>
						<td><p class="course"></p></td>
					</tr>
					<tr>
						<th>Department</th>
						<td><p class="department"></p></td>
					</tr>
					<tr>
						<th>Branch</th>
						<td>
							<p class="branch"></p>
						</td>
					</tr>
				</table>
				<br> Enter your quotation : <input type="number" value="quote"
					name="quote" required> <br> <br>
				<button type="submit" id="paybtn" name="pay" value="quote">Quote</button>
			</form>
		</div>
	</div>
</body>
</html>