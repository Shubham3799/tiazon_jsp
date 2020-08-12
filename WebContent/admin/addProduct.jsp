<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.glass.ui.Application"%>
<%@ page import="java.util.*,java.text.*,javax.servlet.http.*,java.io.*,java.sql.*,javax.servlet.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>

  <nav class="navbar navbar-expand-md bg-dark navbar-dark">  
    <h2 class="navbar-brand">Updating Products</h2> 
   <div class="navbar-collapse justify-content-end">
   
   <ul class="navbar-nav ">
    <li class="nav-item active">
      <a style="color:white;"class="nav-link" href="Admin?page=index">Home</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="Admin?page=addproduct">Add Product</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="Admin?page=settings">Settings</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="#">Pages</a>
    </li>
  </ul>
  </div>
 
  </nav>
	
	<div class="signup-header">
	 	<h2>Add Product</h2>
	 </div>

	 <form method="post" action="Admin">
	 
	 <input type="hidden" name="page" value="add_product">
     
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" placeholder="product name goes here"  required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Price</label>
	 		<input type="text" name="price" placeholder="product price" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Category</label>
	 		<input type="text" name="category" placeholder="product category" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Featured</label>
	 		<input type="text" name="featured" placeholder="yes/no" required>
	 	</div>
	 	<div class="signup-group">
	 		 <label for="fileupload"> Select an image to upload</label>
	 		<input type="file" name="image" required><br>
	 	</div>
	 	<div class="signup-group">
			<input type="submit" value="Process">	 
		</div>
	 </form>
	 
	 <footer style="position: absolute;left: 0;bottom: 0;width: 100%;">
		<div class="footer bg-dark"> &copy; 2018 Copyright:
	      Tiazon.com
	    </div>
	</footer>
</body>
</html>