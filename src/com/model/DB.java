package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;


import com.beans.Notification;
import com.beans.Product;
import com.beans.User;
public class DB {
	private String username = "root";
	private String password = "shubham@mysql";
	private String dbName = "myproject";
	private String url = "jdbc:mysql://localhost:3306/" + dbName;
	private String driver = "com.mysql.jdbc.Driver";
	
	ArrayList<Product> list = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	ArrayList<Notification> notifList = new ArrayList<>();
	
	private Connection con;
	private void dbConnect() {
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, username, password);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void addUser(User user) throws SQLException {
		dbConnect();
		String sql = "Insert into user(name,email,username,address,password) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, user.getName());
		st.setString(2, user.getEmail());
		st.setString(3, user.getUsername());
		st.setString(4, user.getAddress());
		st.setString(5, user.getPassword());
		
		
		st.executeUpdate();
		dbClose();
	}

	public boolean checkUser(String username, String password) throws SQLException {
		dbConnect();
		int count = 0;
		String sql = "Select * from user where username = ? and password = ?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, username);
		st.setString(2, password);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			count = 1;
		}
		
		dbClose();
		if(count == 0)
			return false;
		
		return true;
	}
	
	public boolean checkMail(String email) throws SQLException
	{
		dbConnect();
		String sql="select  email from user where email=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1,email);
		ResultSet rs=st.executeQuery();
		
		if(rs.first())
			return true;
		else 
			return false;
	}
	
	
	public void upadtePass(String email,String pass) throws SQLException
	{
		dbConnect();
		String sql="Update user set password=? where email=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,pass);
		st.setString(2,email);
        st.executeUpdate();
        dbClose();
	}
	
	public void upadteName(String name,String username) throws SQLException
	{
		dbConnect();
		String sql="Update user set name=? where username=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,name);
		st.setString(2,username);
        st.executeUpdate();
        dbClose();
	}
	
	public void upadteUserame(String uname,String username) throws SQLException
	{
		dbConnect();
		String sql="Update user set username=? where username=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,uname);
		st.setString(2,username);
        st.executeUpdate();
        dbClose();
	}
	
	public void upadteAddress(String address,String username) throws SQLException
	{
		dbConnect();
		String sql="Update user set address=? where username=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,address);
		st.setString(2,username);
        st.executeUpdate();
        dbClose();
	}
	
	public void upadteEmail(String email,String username) throws SQLException
	{
		dbConnect();
		String sql="Update user set email=? where username=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,email);
		st.setString(2,username);
        st.executeUpdate();
        dbClose();
	}
  
	public void upadteStatus(String status,String username) throws SQLException
	{
		dbConnect();
		String sql="Update user set status=? where username=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,status);
		st.setString(2,username);
        st.executeUpdate();
        dbClose();
	}
	
	public ArrayList<Product> fetch() throws SQLException {
		dbConnect();
		String sql = "Select * from product";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			int id=rs.getInt("id");
			String name= rs.getString("name");
			String category= rs.getString("category");
			String price= rs.getString("price");
			String featured= rs.getString("featured");
			String image= rs.getString("image");
			
			Product p = new Product();
			p.setCategory(category);
			p.setFeatured(featured);
			p.setId(id);
			p.setImage(image);
			p.setName(name);
			p.setPrice(price);
			System.out.println(p.getId());
			list.add(p);
			p=null;
			
		}
		
		dbClose();
		return list;
	}
	
	public ArrayList<Notification> fetchNotifications() throws SQLException {
		dbConnect();
		String sql = "Select * from notifications";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			int id=rs.getInt("id");
			String message= rs.getString("message");
			String date= rs.getString("date");
	 		String user= rs.getString("user");
           // Date dte=new Date(date); 
			
			Notification n = new Notification();
			n.setId(id);
		    n.setMessage(message);
		    n.setDate(date);
		    n.setUser(user);
		    
			
			notifList.add(n);
			n=null;
			
		}
		
		dbClose();
		return notifList;
	}

	public ArrayList<User> fetchUser() throws SQLException {
		dbConnect();
		String sql = "Select * from user";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			String address = rs.getString("address");
			String user = rs.getString("username");
			String email = rs.getString("email");
			String name = rs.getString("name");
			int id = rs.getInt("id");
			String password = rs.getString("password");
			String image=rs.getString("image");
			String status=rs.getString("status");
			
			User u = new User();
			u.setAddress(address);
			u.setEmail(email);
			u.setId(id);
			u.setName(name);
			u.setUsername(user);
			u.setPassword(password);
			u.setImage(image);
			u.setStatus(status);
			userList.add(u);
			u=null;
				
		}
		
		dbClose();
		return userList;
	}
	
	
	
	

	public void deleteProduct(String id) throws SQLException {
		
		dbConnect();
		String sql = "Delete from product where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();
		
	}

	public Product fetchProduct(String id) throws SQLException {
		dbConnect();
		String sql = "select * from product where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rst = pstmt.executeQuery();
		Product p = new Product();
		while(rst.next()){
			
			p.setId(rst.getInt("id"));
			p.setName(rst.getString("name"));
			p.setPrice(rst.getString("price"));
			p.setCategory(rst.getString("category"));
			p.setFeatured(rst.getString("featured"));
			p.setImage(rst.getString("image"));
		}
		dbClose();
		return p;
	}
	
	

	public void updateProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "update product set name=?,price=?,category=?,featured=? where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		st.setString(4, p.getFeatured());
		st.setInt(5, p.getId());
		st.executeUpdate();
		dbClose();
	}

	public void addProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "Insert into product(name,price,category,featured,image) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		st.setString(4, p.getFeatured());
		st.setString(5, p.getImage());
		
		
		st.executeUpdate();
		dbClose();
	}
	
	public void addNotification(Notification n) throws SQLException {
		dbConnect();
		String sql = "Insert into notifications(message,date,user) values(?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, n.getMessage());
		st.setString(2, (String)n.getDate());
		st.setString(3, n.getUser());
		
		
		
		st.executeUpdate();
		dbClose();
	}

}
