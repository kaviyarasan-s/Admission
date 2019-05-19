<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="PaymentServlet" method="post">
<h1>Management quota</h1> <br>
<h2>Details</h2> <br>
Course : ${COURSE} <br> <br>
Department : ${LIST.get(0)} <br> <br>
Branch : ${LIST.get(1)} <br> <br>
Enter your quotation : <input type="number" value="quote" name="quote" required> <br> <br>
<button type="submit" name="pay" value="quote"> Quote </button>
</form>
</body>
</html>