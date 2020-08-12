<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.glass.ui.Application"%>
<%@ page import="java.util.*,java.text.*,javax.servlet.http.*,java.io.*,java.sql.*,javax.servlet.*" %>
<%@ page import="com.controller.Controller,com.beans.Product,com.beans.User" %>

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Home</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="glyphicons/glyphicons-halflings-regular.css"  />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body style="height:100%;" class="fixed-nav sticky-footer">

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
					  {
						  String usern=(String)session.getAttribute("username");
						  ArrayList<String> alerts =(ArrayList<String>)session.getAttribute("alerts");%>
						  
				
						<li><a href="Controller?page=logout" >Logout</a></li>
						<li><a href="Controller?page=Account&uname=<%=usern%>">My Account(<%=usern%>)</a></li>
						<li><a href="Controller?page=alerts">
						<span class="fa-stack fa-1x has-badge" style="font-size:125%;" data-count="<%= alerts.size()%>">           
                        <i class="fa fa-bell"></i>
                         </span></a></li>
						<%} %>
		
		
				<li><a href="Controller?page=showcart"><span class="fa fa-cart-plus"></span>(<%=x%>)</a></li>
			</ul>
		</nav>
		</header>
		
    <div class="container">
	
	 
		<% if(x==1){%>
						<h4 style="margin-top: 40px;">My shopping bag(<%=x%> item)</h4>
		
		<%}
		else if(x > 1){%>
						<h4 style="margin-top: 40px;">My shopping bag(<%=x%> items)</h4>
		
		<% }
		 else 
		 {%> 
				<h4 style="margin-top: 40px;">Your Shopping Bag is Empty</h4>
	    <%} %>
	
	
	<table>
		<tr>
			<th>Item Name</th>
			<th>Price</th>
			<th>Category</th>
			<th>Remove Item</th>
		</tr>
	</table>
	
		<%int total=0;%>
		<%ArrayList<Product> list =(ArrayList<Product>)ssn.getAttribute("list"); 
		 for(String i:cartlist ) 
		 {
		  for(Product p:list)
 		   {
				if (i.compareTo(Integer.toString(p.getId()))==0)
				{
				total= total + Integer.parseInt(p.getPrice());%> 
				
			<table style="table-layout: fixed;width: 100%;">
				<tr>
					<td style="width: 100px;"><img src="<%= p.getImage()%>" height="100" width="150" >  (<%=p.getName()%>)</td>
					<td style="width: 50px;"><%=p.getPrice()%></td>
					<td style="width: 100px;"><%=p.getCategory()%></td>
					<td style="width: 100px;"><a href="Controller?page=remove&id=<%=p.getId()%>"><span class="btn btn-danger">X</span></a></td>
				</tr>
			</table>
				<%
				}
 		   }
		 }
		 %>
			
	
	<h4 style="margin-top: 40px;margin-bottom: 40px;">Order Total: &#x20b9; (<%=total%>)</h4>
	
	<a href="Controller?page=success"><input type="submit" value="Proceed to Checkout" class="btn btn-success" style="width:100%;padding:8px;font-size:16px;"></a><br>
	<a href="Controller?page=index"><input type="button" value="Continue Shopping" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
	
	
	</div>
		
		
    <footer style="margin-top: 120px;"class="sticky-footer">
        
		<div class="footer bg-dark" > &copy; 2019 Copyright:
	      <a href="Controller?page=index"> Tiazon.com</a>
	    
	    </div>
	</footer>   
    </body>

</html>