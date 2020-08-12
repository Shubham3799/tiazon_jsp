<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.glass.ui.Application"%>
<%@ page import="java.util.*,java.text.*,javax.servlet.http.*,java.io.*,java.sql.*,javax.servlet.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Portal</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/style.css ">

</head>

<body>
	
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">  
    <h2 class="navbar-brand">Welcome admin</h2> 
   <div class="navbar-collapse justify-content-end">
   
   <ul class="navbar-nav ">
    <li>
      <a class="nav-item nav-link active" href="<%=request.getContextPath() %>/Admin?page=index">Home</a>
    </li>
    <li>
      <a class="nav-item nav-link active" href="<%=request.getContextPath() %>/Admin?page=addproduct">Add Product</a>
    </li>
    <li>
      <a class="nav-item nav-link active" href="<%=request.getContextPath() %>/Admin?page=settings">Settings</a>
    </li>
    <li>
      <a class="nav-item nav-link active" href="#">Pages</a>
    </li>
  </ul>
  </div>
 
  </nav>
	
	
	 <%! 
   private Statement pst,prt;
	 ResultSet rs;
   public void jspInit()
     {
		// TODO Auto-generated method stub
	
		try
		{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject","root","shubham@mysql");
		 pst=cn.createStatement();
		 //ResultSet rs=pst.executeQuery("select * from product");
		}  
		
		catch(ClassNotFoundException e)
		{
			System.out.println("Driver not found -"+e.getMessage());
		}
		
		catch(SQLException e)
		{
			System.out.println("SQL Alert[1] -"+e.getMessage());
		}
		
	}
   
%>	   
	  
	<div class="tiazon-content">
	<div class="container">
	<h2>Products List:</h2>
		 <table>
			<tr>
			<th style="width: 50px;">Item id</th>
			<th style="width: 100px;">Name</th>
			<th style="width: 100px;">Price</th>
			<th style="width: 100px;">Category</th>
			<th style="width: 100px;">Image</th>
			<th style="width: 100px;">Option</th>
		</tr>
	</table>
		
		 <%  try
		       {
		    	rs=pst.executeQuery("select * from product");
				while(rs.next())
				{
				%>
		  <table style="table-layout: fixed;width: 100%;">
		  	
				<tr>
					<td style="width: 50px;"><%=rs.getInt("id") %></td>
					<td style="width: 100px;"><%=rs.getString("name") %></td>
					<td style="width: 100px;"><%=rs.getInt("price") %></td>
					<td style="width: 100px;"><%=rs.getString("category") %></td>
					<td style="width: 100px;"><img src="<%= request.getContextPath() %>/<%=rs.getString("image") %>" height="100" width="150" ></td>
					<td style="width: 100px;"><a href="<%= request.getContextPath() %>/Admin?page=edit&id=<%=rs.getInt("id") %>" style="color: #6bb1f8;">edit</a> ||
					<a href="<%= request.getContextPath() %>/Admin?page=delete&id=<%=rs.getInt("id") %>" style="color:#6bb1f8;">delete</a></td>
				</tr>
			</table>
		 <%}
		       } 
			
	       catch (SQLException e) 
			 {
			  System.out.println("SQL Alert - "+e.getMessage());
		 	 }
		 %>
		 </div>
		 </div>
	 <footer>
		<div class="footer bg-dark"> &copy; 2019 Copyright:
	      Tiazon.com
	    </div>
	</footer>
	
</body>
</html>