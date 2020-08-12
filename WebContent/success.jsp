<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.glass.ui.Application"%>
<%@ page import="java.util.*,java.text.*,javax.servlet.http.*,java.io.*,java.sql.*,javax.servlet.*" %>
<%@ page import="com.controller.Controller,com.beans.Product,com.beans.User" %>
<%@page import="javax.swing.JOptionPane"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="glyphicons/glyphicons-halflings-regular.css"  />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

    <%!int x=0;
     %>
        
	
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
						<li ><a href="Controller?page=login">Login</a></li>
						<li ><a href="Controller?page=sign-up">Sign-up</a></li>
						<%} 
					  else
					  {
					  String usern=(String)session.getAttribute("username");
					  ArrayList<String> alerts =(ArrayList<String>)session.getAttribute("alerts");%>
					  
			
					<li><a href="Controller?page=logout" >Logout</a></li>
					<li><a href="Controller?page=Account&uname=<%=usern%>">My Account(<%=usern%>)</a></li>
					<li><a href="Controller?page=alerts">
					<span class="fa-stack fa-1x has" style="font-size:125%;"data-count="<%=alerts.size()%>">           
                    <i class="fa fa-bell"></i>
                     </span></a></li>
					<%} %>
		
		
				<li><a href="Controller?page=showcart"><span class="fa fa-cart-plus"></span>(<%=x%>)</a></li>
			</ul>
		</nav>
		</header>
		
		
		<%
		        if(sess == null)
		        {
				JOptionPane.showMessageDialog(null, "Please Login first", "Info", JOptionPane.INFORMATION_MESSAGE);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				}
					
				 
				else if(x == 0)
				{	
				JOptionPane.showMessageDialog(null, "Your shopping bag is empty", "Info", JOptionPane.INFORMATION_MESSAGE);
				request.getRequestDispatcher("cart.jsp").forward(request, response);
				}
				%>
		
		
		<%if(sess!=null) 
		{%>
				
				
				<div class="container" style="margin-top: 60px;margin-bottom: 60px;">
					<h4>Thank you <font color="#6bb1f8"><%=session.getAttribute("name")%></font> for Shopping with us. We received your order and it will be delivered to <font color="#6bb1f8"><%=session.getAttribute("address")%></font> with in 4-5 working days.</h4>
					<h4>Confirmation mail will be sent shortly to your mail-ID&nbsp;<font color="#6bb1f8"><%=session.getAttribute("email")%></font>.</h4>					
					<br><br>
					<a href="Controller?page=index&action=success"><input type="button" value="Continue Shopping" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
				</div>
		<%} %>		
		

		<footer style="position: fixed;bottom: 0;left: 0;width: 100%;">
		<div class="footer bg-dark"> &copy; 2019 Copyright:
	      <a href="Controller?page=index"> Tiazon.com</a>
	    </div>
	    </footer>
</body>
</html>