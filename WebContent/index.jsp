<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<style type="text/css">
body {
	background-image: url("image/clg.jpg");
	background-size: 1700px 700px;
	padding-top: 100px;
	padding-left: 250px;
}

a {
	text-decoration: none !important;
}

h1 {
	font-family: 'Kaushan Script', cursive;
}

.myform {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	padding: 1rem;
	-ms-flex-direction: column;
	flex-direction: column;
	width: 100%;
	pointer-events: auto;
	outline: 0;
	max-width: 500px;
}

.tx-tfm {
	text-transform: uppercase;
}

.mybtn {
	border-radius: 50px;
}


#second {
	display: none;
}
h3 {
font-color:red;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div id="first">
					<div class="myform form ">
						<div class="logo mb-3">
							<div class="col-md-12 text-center">
								<h1>
									<b>CHAIN SYS UNIVERSITY</b>
								</h1>
							</div>
						</div>
						<form  method="post" action="LoginServlet" >
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control" id="email"
									required placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input
									type="password" name="password" id="password"
									class="form-control" required placeholder="Enter Password">
							</div>
							<div class="col-md-12 text-center ">
								<button type="submit"
									class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
							</div>
							<div class="form-group">
								<p class="text-center">
									Don't have account? <a href="signup.jsp" id="signup">Sign
										up here</a>
								</p>
							</div>
						<h3><b>${ERROR}</b></h3>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
