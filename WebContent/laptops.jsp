<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.glass.ui.Application"%>
<%@ page import="java.util.*,java.text.*,javax.servlet.http.*,java.io.*,java.sql.*,javax.servlet.*" %>
<%@ page import="com.controller.Controller,com.beans.Product,com.beans.User" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="css/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
</head>
<body>

    <%!int x=0;%>
        
	<header>
		<h1>
			Tiazon
		</h1>
		<nav>
			<ul>
				<li><a href="Controller?page=index">Home</a></li>
				
					<%
					HttpSession ssn=request.getSession(false);
					HttpSession sess =(HttpSession)ssn.getAttribute("session");
					ArrayList<String> cartlist =(ArrayList<String>)session.getAttribute("cartlist");
					x=0;
					for(String item:cartlist)
						x=x+1;
					  if(sess==null) 
					   {%>
						<li><a href="Controller?page=login">Login</a></li>
						<li><a href="Controller?page=sign-up">Sign-up</a></li>
						<%}
					  else
					  {
						  String usern=(String)session.getAttribute("username");
						  ArrayList<String> alerts =(ArrayList<String>)session.getAttribute("alerts");%>
						  
				
						<li><a href="Controller?page=logout" >Logout</a></li>
						<li><a href="Controller?page=Account&uname=<%=usern%>">My Account(<%=usern%>)</a></li>
						<li><a href="Controller?page=alerts">
						<span class="fa-stack fa-1x has-badge" style="font-size:125%;" data-count="<%=alerts.size()%>">           
                        <i class="fa fa-bell"></i>
                         </span></a></li>
						<%} %>
		
		
				<li><a href="Controller?page=showcart"><span class="fa fa-cart-plus">(<%=x%>)</span></a></li>
			</ul>
		</nav>
	</header>
	
	<div class="tiazon-content">
 	<div class="container">
 		<div class="row">
 				<div class="col-md-4"><!-- left -->
 						<div class="list-group"><!-- products -->
						  <a href="Controller?page=all-products" class="list-group-item" style="background:  #d6d4d3;">
						    All Products
						  </a>
						  <a href="Controller?page=mobiles" class="list-group-item" style="color: #cc0080">Mobiles</a>
						  <a href="Controller?page=laptops" class="list-group-item" style="color: #cc0080">Laptops</a>
						  <a href="Controller?page=clothing" class="list-group-item" style="color: #cc0080">Clothing</a>
						  <a href="Controller?page=home-decor" class="list-group-item" style="color: #cc0080">Home Decor</a>
						</div> 
 				</div><!-- left -->

 				<div class="col-md-8"><!-- right -->
 				
 					<h2 style="text-align: center;">Laptops</h2><br>
 					
 					<h5>Sort by(Price):</h5>
					<form action="Controller" method="get" style="border: none;margin:0px;padding: 0px;margin-bottom: 20px;">
					<input type="hidden" name="page" value="price-sort">
					<input type="hidden" name="action" value="laptops">
					<select name="sort">
					<option value="low-to-high">Low to high</option>
					<option value="high-to-high">high to low</option>
					</select>
					<input type="submit" value="Go!">
					</form>
 					<div class="row">
 					<%ArrayList<Product> list =(ArrayList<Product>)session.getAttribute("list");  
 						  for(Product p:list)
 						  {
 							 //System.out.println(p.getName());  
 							if(p.getCategory().equals("laptops"))
 							{
 						  %>
 				
 							
		 					<div class="col-md-4">
		 						<img alt="error" src="<%=p.getImage() %>" class="img-responsive" style="width:60%;height:50%; margin-left:21%" ><br>
		 						<div class="text-center"><a style="color: black;"><%=p.getName() %><%System.out.println(p.getName()); %></a></div>	
		 						<p style="text-align: center;"> &#x20b9;  <%=p.getPrice() %></p>
		 						<div class="text-center">  <a class="btn btn-primary" href="Controller?page=addtocart&action=laptops&id=<%=p.getId()%>">Add to Cart</a> </div><br>
		 					</div>
		 					
		 					<%}
		 					}%>
 				 </div>					
 				</div>
 			</div>
 		</div>
 	</div>
	
	
	<footer>
		<div class="footer bg-dark" style="margin-bottom:0px;"> &copy; 2018 Copyright:
	      <a href="Controller?page=index"> Tiazon.com</a>
	    </div>
	</footer>
	
</body>
</html>