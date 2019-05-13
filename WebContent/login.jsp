<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.glass.ui.Application"%>
<%@ page import="com.controller.Controller,com.beans.Product,com.beans.User" %>
<%@ page import="java.util.*,java.text.*,javax.servlet.http.*,java.io.*,java.sql.*,javax.servlet.*" %>




    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login-page</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="glyphicons/glyphicons-halflings-regular.css"  />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link rel="stylesheet" type="text/css" href="css/style.css">
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
					
					  if(sess==null) 
					   {%>
						<li ><a href="Controller?page=login">Login</a></li>
						<li ><a href="Controller?page=sign-up">Sign-up</a></li>
						<%}
					  else
						  {
						  String usern=(String)session.getAttribute("username");%>
				
						<li><a href="Controller?page=logout" >Logout</a></li>
						<li><a href="#">My Account(<%=usern%>)</a></li>
						<%} %>
		
		
				<li><a href="Controller?page=showcart"><span class="fa fa-cart-plus"></span>(<%=x%>)</a></li>
			</ul>
		</nav>
		</header>

    <div class="signup-header">
	 	<h2>Login to <mark>Tiazon</mark></h2>
	</div>

	 <form method="post" action="Controller">
	 
	 <input type="hidden" name="page" value="login-form">
	 
	 	<!-- Validations errors -->
	 	<%String msg,username;
	 	  msg=(String)request.getAttribute("msg");
	 	  username=(String)request.getAttribute("username");
	 	 %>
	 	<font color="#F24638"><% if(msg!=null)%><%=msg %></font>
	 
	 	<div class="signup-group">
	 		<label>Username</label>
	 		<input type="text" name="username" placeholder="Your Username" <%if(username!=null) %>value=<%=username%> >
	 	</div>
	 	<div class="signup-group">
	 		<label>Password</label>
	 		<input type="password" name="password" placeholder="Enter password">
	 	</div>
	 	<div class="signup-group">
	 		<button type="submit" name="login" class="signup-btn">Log in</button>
	 		<a style="text-decoration : none; color : #FFF;" href="Controller?page=forgot" class="signup-btn">Forgot Password?</a>
	 	</div>
	 	<p>
	 		New to Tiazon? <a href="Controller?page=sign-up" style="color:#F24638;">Create Account</a>
	 	</p>
	 </form>
	<br><br><br>
	
		
    <footer style="position: fixed;bottom: 0;left: 0;width: 100%;">
		<div class="footer bg-dark"> &copy; 2018 Copyright:
	      <a href="Controller?page=index"> Tiazon.com</a>
	    </div>
	</footer>
	
</body>
</html>		