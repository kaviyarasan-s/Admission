<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
<title>success</title>
<style>
h1 {
 text-align:center;
font-family: 'Kaushan Script', cursive;
background-color:#b3cbf2;
width:100%;
text-align:center;
padding-top:5px;
padding-bottom:10px;
background-color:#b0e8e2;
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
  text-decoration:none;
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
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
 padding-left:900px;
}
.dropdown:hover .dropdown-content {
  display: block;
}
b{
font-color:red;
}
.scroll {
font-size:50px;
background-color:yellow;
}
.image {
background-image:url("image/grat.jpg");
width:1300px;
height:780px;
}
</style>
</head>
<body>
<h1>CHAINSYS UNIVERSITY</h1>
<div class="navbar">
<a href="homepage.jsp"><b>Home</b></a>
  <a href="about.jsp"><b>About us</b></a>
    <div class="dropdown">
    <button class="dropbtn"><b>Academic</b>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="courses.jsp">Programmes</a>
      <a href="placement.jsp">Placement</a>
     </div>
    </div> 
   <div class="dropdown">
    <button class="dropbtn"><b>Admission</b>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="procedures.jsp">Procedure</a>
      <a href="application.jsp">Apply online</a>
      <a href="result.jsp">View Result</a>
     </div>
  </div> 
  <div class="logout">
  <a href="index.jsp"><b>Logout</b></a>
  </div>
  </div>
  <br>
  <div class="scroll">
  <marquee width="100%" direction="right" height="130%">
<b>Payment successful wait for the result</b>
</marquee>
</div>
<h1> ${result} </h1>
</body>
</html>