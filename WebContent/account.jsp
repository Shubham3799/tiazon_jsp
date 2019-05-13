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
					  String usern=(String)session.getAttribute("username");%>
			
					<li><a href="Controller?page=logout" >Logout</a></li>
					<li><a href="Controller?page=Account">My Account(<%=usern%>)</a></li>
					<%} %>
		
				<li><a href="Controller?page=showcart"><span class="fa fa-cart-plus"></span>(<%=x%>)</a></li>
			</ul>
		</nav>
	</header>
		
	<h2 style="margin-left:36%;text-align: center;">Account Info</h2><br>
	
	<div class="tiazon-content">
 	<div class="container">
	<div class ="row">
	<div class="col-md-4 text-center">
	 <img src="<%=ssn.getAttribute("image") %>" class="img-fluid" alt="Responsive image">
	 <br><br>            	 	        	 
	 		<label for="files" class="btn btn-secondary">Edit</label>
            <input id="files" style="visibility:hidden;" type="file">	 	
	
	</div>
	
	<div class="col-md-8 ">
	<form style="border-style:none;float:left;">
	<input type="hidden" name="page" value="edit">
	
    <div class="column mx-auto text-center" style="width: 270px;">
             
    <div class="d-flex flex-column border border-primary rounded">
    
    <div class="p-1">Name:</div>
    <div class="p-2"><%= (String)session.getAttribute("name")%></div>
    <div class="signup-group">            	 
	        	 
	 		<button type="submit" name="edited" value="name" class="btn btn-secondary">Edit</button>	 	
	</div>	
    </div>
    
    <div class="d-flex flex-column border border-primary rounded">
    <div class="p-1">Username:</div>
    <div class="p-2"><%= ssn.getAttribute("username")%></div>
    <div class="signup-group">
	 			 
	 		<button type="submit" name="edited" value="username" class="btn btn-secondary">Edit</button>

	</div>
    </div>	 
	 
    <div class="d-flex flex-column border border-primary rounded">
    <div class="p-1">Email:</div>
    <div class="p-2"><%= ssn.getAttribute("email")%></div>
    <div class="signup-group">
	 		<button type="submit" name="edited" value="email" class="btn btn-secondary">Edit</button>
	</div>
    </div>
     	 
    <div class="d-flex flex-column border border-primary rounded">
    <div class="p-1">Address:</div>
    <div class="p-2"><%= ssn.getAttribute("address")%></div>
    <div class="signup-group">
	 		<button type="submit" name="edited" value="address" class="btn btn-secondary">Edit</button>
	</div>    
    </div>
    
    
    </div>
    
    </form>
    </div>
    </div>
    </div>
    </div>
	
	<footer>
		<div class="footer bg-dark" style="margin-bottom:0"> &copy; 2019 Copyright:
	      <a href="Controller?page=index"> Tiazon.com</a>
	    </div>
	</footer>
	
</body>
</html>	