<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.glass.ui.Application"%>
<%@ page import="java.util.*,java.text.*,javax.servlet.http.*,java.io.*,java.sql.*,javax.servlet.*"%>
<%@ page import="com.controller.Controller,com.beans.Product,com.beans.User" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Accounts</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">  
    <h2 class="navbar-brand">Accounts</h2> 
   <div class="navbar-collapse justify-content-end">
   
   <ul class="navbar-nav ">
    <li class="nav-item active">
      <a class="nav-link" href="Admin?page=index">Home</a>
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

<div class="tiazon-content">
	<div class="container">
	<h2>User Registered:</h2>
		 <table>
			<tr>
			<th style="width: 50px;">Serial id</th>
			<th style="width: 100px;">Name</th>
			<th style="width: 120px;">Address</th>
			<th style="width: 120px;">Email</th>
			<th style="width: 100px;">Username</th>
			<th style="width: 100px;">Status</th>
		</tr>
	</table>

<%ArrayList<User> userList =(ArrayList<User>)request.getAttribute("userList");  
 						  for(User u:userList)
 						  {
 							 //System.out.println(p.getName());  
 							
 						  %>
 				<table style="table-layout: fixed;width: 100%;">
		  	
				<tr>
					<td style="width: 50px;"><%=u.getId() %></td>
					<td style="width: 100px;"><%=u.getName() %></td>
					<td style="width: 120px;"><%=u.getAddress() %></td>
					<td style="width: 120px;"><%=u.getEmail() %></td>
					<td style="width: 100px" ><%=u.getUsername() %></td>
					<%String status=u.getStatus();
					  //System.out.println(status);
					  if(status.equals("active"))
					  {
					%>
					<td style="width: 100px;"><span style="color: #6bb1f8;">Active</span>
					<a href="Admin?page=control&status=block&uname=<%=u.getUsername() %>" ><input type="submit" value="Block"></a></td>
					<%}
					  else if(status.equals("block"))
					  {%>
					<td style="width: 100px;"><span style="color: #6bb1f8;">Blocked</span>
					<a href="Admin?page=control&status=active&uname=<%=u.getUsername() %>"><input type="submit" value="Activate"></a></td>
					<%} %>  
				</tr>
			</table>
		 <%}%>
		 </div>
		 </div>

<%@ include file="footer.jsp"%>