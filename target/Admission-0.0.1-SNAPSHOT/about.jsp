<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
<title>About us</title>
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
p {
 background-color: white;
  width: 1100px;
  padding: 50px;
  padding-bottom:100px;
  margin: 20px;
  text-align:justify;
  font-family: 'Kaushan Script', cursive;
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
       <a href="viewapplication.jsp">View Application</a>
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
<b>The best university in india  The best university in india</b>
</marquee>
</div>
<p>
As a publicly supported, regional teaching institution, chainsys university mission is to deliver a professional business education that offers our students the knowledge and skills to succeed in their careers and in society.

We are dedicated to providing an educational environment focused on student learning and delivered by qualified faculty.  We strive to offer our students a highly valuable professional business education that is accessible, affordable, and empowers people of all ages and backgrounds to transform their lives and realize their potential. 

We offer well-respected programs that add value primarily to the San Joaquin Valley.  Accordingly, we seek to maintain an environment dedicated to educating a diverse, multi-cultural student population.  To our regional community we represent a recognized talent pool of faculty and student resources.
</p>
<div class="image">.
</div>
</body>
</html>