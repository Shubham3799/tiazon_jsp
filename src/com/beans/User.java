package com.beans;

import java.util.ArrayList;

public class User {
	
	private int id;
	private String name;
	private String email;
	private String username;
	private String password;
	private String address;
	private String image;
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Object fetchadd(ArrayList<User> userList, String username) {
		for(User u : userList) {
			if(u.getUsername().equals(username))
				return u.getAddress();
		}
		return "";
	}
	public Object fetchemail(ArrayList<User> userList, String username) {
		for(User u : userList) {
			if(u.getUsername().equals(username))
				return u.getEmail();
		}
		return "";
	}
	public Object fetchname(ArrayList<User> userList, String username) {
		for(User u : userList) {
			if(u.getUsername().equals(username))
				return u.getName();
		}
		return "";
	}
	
	public Object fetchimage(ArrayList<User> userList, String username) {
		for(User u : userList) {
			if(u.getUsername().equals(username))
				return u.getImage();
		}
		return "";
	}
	public Object fetchStatus(ArrayList<User> userList, String username) {
		for(User u : userList) {
			if(u.getUsername().equals(username))
				return u.getStatus();
		}
		return "";
	}
	
	
	
}

