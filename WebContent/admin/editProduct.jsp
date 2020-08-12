<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.glass.ui.Application"%>
<%@ page import="java.util.*,java.text.*,javax.servlet.http.*,java.io.*,java.sql.*,javax.servlet.*"%>
<%@ page import="com.controller.Controller,com.beans.Product,com.beans.User" %>


<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
	
  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">  
    <h2 class="navbar-brand">Editing Window</h2> 
   <div class="navbar-collapse justify-content-end">
   
   <ul class="navbar-nav ">
    <li class="nav-item active">
      <a class="nav-link" href="Admin?page=index">Home</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link " href="Admin?page=addproduct">Add Product</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link " href="Admin?page=settings">Settings</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link " href="#">Pages</a>
    </li>
  </ul>
  </div>
 
</nav>


       
     <div class="signup-header">
	 	<h2>Edit Product</h2>
	 </div>

	 <form method="post" action="Admin">
	 <%Product p=(Product)request.getAttribute("p"); %>
	 <input type="hidden" name="page" value="edit_product">
	 <input type="hidden" name="id" value="<%=p.getId()%>">
     
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" value="<%=p.getName()%>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Price</label>
	 		<input type="text" name="price" value="<%=p.getPrice()%>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Category</label>
	 		<input type="text" name="category" value="<%=p.getCategory()%>" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Featured</label>
	 		<input type="text" name="featured" value="<%= p.getFeatured()%>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Image</label>
	 		<img style="height: 160px;width: 160px;" src="<%=p.getImage()%>">
	 	</div>
	 	<div class="signup-group">
			<input type="submit" value="Process">	 
		</div>
	 </form>
	 <br>
	 
	


    <footer>
		<div class="footer bg-dark" style="margin-bottom:0"> &copy; 2019 Copyright:
	      <a href="Controller?page=index"> Tiazon.com</a>
	    </div>
	</footer>

</body>
</html>