<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.glass.ui.Application"%>
<%@ page import="java.util.*,java.text.*,javax.servlet.http.*,java.io.*,java.sql.*,javax.servlet.*"%>
<%@ page import="com.controller.Controller,com.beans.Product,com.beans.User" %>


<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Notify</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
	
  <nav class="navbar navbar-expand-sm bg-primary navbar-dark">  
    <h2 class="navbar-brand">Notifications Windows</h2> 
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
	 	<h2>Push Notifications</h2>
	 </div>

	 <form method="post" action="Admin">

	 <input type="hidden" name="page" value="push_notif">
	 <input type="hidden" name="id" value="1">
     
	 	<div class="signup-group">
	 		<label>Notification</label>
	 		<textarea rows = "3" cols = "52" name = "message">Enter message..      
           </textarea>
	 	</div>
	 	<div class="signup-group">
	 		<label>Date of notification</label>
	 		<input type="text" name="date" placeholder="Date goes here" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Recepient id </label>
	 		<input type="text" name="user" placeholder="enter username/for all user enter all_users" required>
	 	</div>
	 
	 	<div class="signup-group">
			<input type="submit" value="Process">	 
		</div>
	 </form>
	 <br>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/6.0.4/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#config-web-app -->
<script src="https://www.gstatic.com/firebasejs/6.0.4/firebase-auth.js"></script>
 <script src="https://www.gstatic.com/firebasejs/6.0.4/firebase-firestore.js"></script>
<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyCWrEQNKl7MU9UngWPVxNMDOlM-fWhzHgE",
    authDomain: "ecommerce-tiazon.firebaseapp.com",
    databaseURL: "https://ecommerce-tiazon.firebaseio.com",
    projectId: "ecommerce-tiazon",
    storageBucket: "ecommerce-tiazon.appspot.com",
    messagingSenderId: "714945032045",
    appId: "1:714945032045:web:f9944eed1bd72e7b"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
</script>

<%@ include file="footer.jsp" %>    