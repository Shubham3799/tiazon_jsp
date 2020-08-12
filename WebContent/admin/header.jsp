<%@ page import="java.util.*,java.text.*,javax.servlet.http.*,java.io.*,java.sql.*,javax.servlet.*" %>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
</head>
<body>
	
  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">  
    <h2 class="navbar-brand">Admin Settings</h2> 
   <div class="navbar-collapse justify-content-end">
   
   <ul class="navbar-nav">
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