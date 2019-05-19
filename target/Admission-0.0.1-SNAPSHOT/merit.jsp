<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Merit</title>
</head>
<body>
<form action="PaymentServlet" method="post">
<h1>Merit payment</h1> <br>
<h2>Details</h2><br>
Course : ${COURSE} <br> <br>
Department : ${LIST.get(0)} <br><br>
Branch : ${LIST.get(1)} <br><br>
Fees : ${FEES} <br><br>
<button type="submit" name="pay" value="payment"> Pay now </button>
</form>
</body>
</html>