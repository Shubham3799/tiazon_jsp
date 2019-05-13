package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.mail.*;
import javax.mail.internet.*;


import com.beans.Product;
import com.beans.User;
import com.model.DB;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<Product> list = new ArrayList<>();
	static ArrayList<String> cartlist = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
    HttpSession session;
    
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
				
		ServletContext sc=getServletContext();
		sc.setAttribute("Controller", this);
		 
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		String action=request.getParameter("action");
		if(page == null || page.equals("index")) {
			
			DB db = new DB();
			 try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 if(action!=null && action.equals("success") )
				 cartlist.clear();
			 session = request.getSession();
			 System.out.println(session.getId());
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", list);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page.equals("login")) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		if(page.equals("sign-up")) {
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		
		if(page.equals("sign-up-form")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String address = request.getParameter("address");
			String password_1 = request.getParameter("password_1");
			String password_2 = request.getParameter("password_2");
			
			if(password_1.equals(password_2)) {
				
				User user = new User();
				user.setAddress(address);
				user.setEmail(email);
				user.setName(name);
				user.setUsername(username);
				user.setPassword(password_1);
				
				DB db = new DB();
				try {
					db.addUser(user);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				request.setAttribute("username", username);
				request.setAttribute("msg", "Account created successfully, Please Login!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
			}else {
				request.setAttribute("msg", "The two passwords do not match");
				request.setAttribute("name", name);
				request.setAttribute("address", address);
				request.setAttribute("email", email);
				request.setAttribute("username", username);
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			
		}
		
		if(page.equals("login-form")) {
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			DB db = new DB();
			User user = new User();
			boolean status = false;
			try {
				status = db.checkUser(username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(status) {
				session = request.getSession();
				session.setAttribute("session", session);
				
				try {
					userList = db.fetchUser();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				session.setAttribute("address", user.fetchadd(userList,username));
				session.setAttribute("email", user.fetchemail(userList,username));
				session.setAttribute("name", user.fetchname(userList,username));
				session.setAttribute("username", username);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "Invalid Crediantials");
				request.setAttribute("username", username);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		}
		if(page.equals("Account"))
		{
			session = request.getSession();
			
			DB db = new DB();
			User user = new User();
			String username=request.getParameter("uname");
			System.out.println(username);
			try {
				userList = db.fetchUser();
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
			session.setAttribute("address", user.fetchadd(userList,username));
			session.setAttribute("email", user.fetchemail(userList,username));
			session.setAttribute("name", user.fetchname(userList,username));
			session.setAttribute("image", user.fetchimage(userList,username));
			session.setAttribute("username", username);
			
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}
		
		if(page.equals("edit"))
		{
			String field=request.getParameter("edited");
				request.setAttribute("field", field);
			
			request.getRequestDispatcher("edit.jsp").forward(request, response);
		}
		
		if(page.equals("update"))
		{
			String edit=request.getParameter("edit");
			String field=request.getParameter("field");
			String username=(String)session.getAttribute("username");
			DB db=new DB();
			if(field.equals("name"))
			{
				//DB db=new DB();
				try{
				db.upadteName(edit, username);
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
				
			}
			else if(field.equals("username"))
			{
				//DB db=new DB();
				try{
				db.upadteUserame(edit, username);
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
			} 
			
			else if(field.equals("email"))
			{

				try{
				db.upadteEmail(edit, username);
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
			}
			
			else if(field.equals("address"))
			{
				
				try{
				db.upadteAddress(edit, username);
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
			}
			
			User user = new User();
		

			try {
				userList = db.fetchUser();
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
			session.setAttribute("address", user.fetchadd(userList,username));
			session.setAttribute("email", user.fetchemail(userList,username));
			session.setAttribute("name", user.fetchname(userList,username));
			session.setAttribute("username", username);
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}
		
		
		if(page.equals("logout")) {
			session = request.getSession();
			session.invalidate();
			
			 session = request.getSession();
			 cartlist.clear();
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", list);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		if(page.equals("mobiles") || page.equals("laptops") || page.equals("clothing") || page.equals("home-decor") || page.equals("all-products")) {
			DB db = new DB();
			 try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("list", list);
			
			if(page.equals("mobiles"))
				request.getRequestDispatcher("mobiles.jsp").forward(request, response);
			if(page.equals("laptops"))
				request.getRequestDispatcher("laptops.jsp").forward(request, response);
			if(page.equals("clothing"))
				request.getRequestDispatcher("clothing.jsp").forward(request, response);
			if(page.equals("home-decor"))
				request.getRequestDispatcher("home-decor.jsp").forward(request, response);
			if(page.equals("all-products"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
		}
		
		
		
		if(page.equals("showcart")) {
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(page.equals("addtocart")) {
			String id = request.getParameter("id");
			String action = request.getParameter("action");
			Product p = new Product();
			boolean check = p.check(cartlist,id);
			
			if(check)
				JOptionPane.showMessageDialog(null, "Product is already added to Cart", "Info", JOptionPane.INFORMATION_MESSAGE);
			else {
			cartlist.add(id);
			System.out.println(id);
			JOptionPane.showMessageDialog(null, "Product successfully added to Cart", "Info", JOptionPane.INFORMATION_MESSAGE);
			}
			
			if(action.equals("index"))
				request.getRequestDispatcher("index.jsp").forward(request, response);
			if(action.equals("allproducts"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
			if(action.equals("clothing"))
				request.getRequestDispatcher("clothing.jsp").forward(request, response);
			if(action.equals("home-decor"))
				request.getRequestDispatcher("home-decor.jsp").forward(request, response);
			if(action.equals("laptops"))
				request.getRequestDispatcher("laptops.jsp").forward(request, response);
			if(action.equals("mobiles"))
				request.getRequestDispatcher("mobiles.jsp").forward(request, response);
		}
		
		if(page.equals("success")) {
			
			request.getRequestDispatcher("success.jsp").forward(request, response);
			
			/*session = request.getSession();
			 cartlist.clear();
			 session.setAttribute("cartlist", cartlist);*/
		}
		
		if(page.equals("remove")) {
			String id = request.getParameter("id");
			Product p = new Product();
			cartlist = p.remove(cartlist,id);
			
			session = request.getSession();
			session.setAttribute("cartlist", cartlist);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(page.equals("price-sort")) {
			String price = request.getParameter("sort");
			String action = request.getParameter("action");
			Product p = new Product();
			if(price.equals("low-to-high"))
				list = p.lowtohigh(list);
			else
				list = p.hightolow(list);
			
			session.setAttribute("list", list);
			
			if(action.equals("index"))
				request.getRequestDispatcher("index.jsp").forward(request, response);
			if(action.equals("all-products"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
			if(action.equals("mobiles"))
				request.getRequestDispatcher("mobiles.jsp").forward(request, response);
			if(action.equals("laptops"))
				request.getRequestDispatcher("laptops.jsp").forward(request, response);
			if(action.equals("clothing"))
				request.getRequestDispatcher("clothing.jsp").forward(request, response);
			if(action.equals("home-decor"))
				request.getRequestDispatcher("home-decor.jsp").forward(request, response);
		}
		if(page.equals("forgot"))
		{
			request.getRequestDispatcher("forgot.jsp").forward(request, response);
		}
		
		if(page.equals("reset_password"))
		{
			request.getRequestDispatcher("reset_password.jsp").forward(request, response);
		}
		
		if(page.equals("updpass"))
		{
			String pass1=request.getParameter(("pass1"));
			String pass2=request.getParameter(("pass2"));
			String email=request.getParameter("email");
			if(pass1.equals(pass2))
			{
				DB db=new DB();
				
				try{
				    db.upadtePass(email, pass1);	
				}
				
				catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				JOptionPane.showMessageDialog(null, "Password changed successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
			}
			else
			{
				request.setAttribute("msg","Password do not match");
				request.getRequestDispatcher("reset_password.jsp").forward(request, response);
			}
		}
		
		if(page.equals("fogpass"))
		{
			String email=request.getParameter("email");
			DB db=new DB();
			boolean reg=false;
			try{
			 reg=db.checkMail(email);}
			
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(reg)
			{
				String link = "http://localhost/ecommerce/Controller?page=reset_password&email="+email;     
				  //bhagawat till here, you have fetch email and verified with the email 
				 //from 
				  //datbase and retrived password from the db.
				    //-----------------------------------------------
				String host="", user="", pass=""; 
				host = "smtp.gmail.com"; user = "yoyosrkshubham@gmail.com"; 
				//"email@removed" // email id to send the emails 
				pass = "kalla1234!"; 
				String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory"; 
				String to = email;  
				String from = "yoyosrkshubham@gmail.com";  
				String subject = "Password Reset"; 
				 String messageText = " Click <a href="+link+">Here</a> To" 
				  +" Reset your Password. You must reset your password within 20 minutes."; 
				   String fileAttachment = ""; 
				   boolean WasEmailSent ; 
				  boolean sessionDebug = true; 
				  Properties props = System.getProperties(); 
				  props.put("mail.host", host); 
				  props.put("mail.transport.protocol.", "smtp"); 
				  props.put("mail.smtp.auth", "true"); 
				  props.put("mail.smtp.", "true"); 
				  props.put("mail.smtp.port", "465"); 
				  props.put("mail.smtp.socketFactory.fallback", "false"); 
				  props.put("mail.smtp.socketFactory.class", SSL_FACTORY); 
				  Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					  protected PasswordAuthentication getPasswordAuthentication() {
						  return new PasswordAuthentication("yoyosrkshubham@gmail.com","kalla1234!");
						  }
						  }); 
				  mailSession.setDebug(sessionDebug); 
				  Message msg = new MimeMessage(mailSession);
				  try{
				  msg.setFrom(new InternetAddress(from)); 
				  InternetAddress address = new InternetAddress(to); 
				  msg.setRecipient(Message.RecipientType.TO, address); 
				  msg.setSubject(subject); 
				  msg.setContent(messageText, "text/html");  
				  }
				  catch(Exception err)
				  {
					  System.out.println("Message process error");
				  }
				  
				  request.setAttribute("email", email);
				  request.getRequestDispatcher("mailsent.jsp").forward(request, response);
				  
				  try {
					  System.out.println("666");
					  /*Transport transport = mailSession.getTransport("smtp"); 
					  System.out.println("1");
					  transport.connect(host, user, pass);
					  System.out.println("2");*/
					  Transport.send(msg);
					  System.out.println("3");
					  WasEmailSent = true; // assume it was sent
					  
					  } 
					  catch (Exception err) { 
					  WasEmailSent = false; // assume it's a fail
					  System.out.println("Transport error");
					  }					   
				  
			}
			
			else
			{
				request.setAttribute("msg", "Enter valid Email-ID");
				request.getRequestDispatcher("forgot.jsp").forward(request, response);
			}
			
		}
	}
	

}