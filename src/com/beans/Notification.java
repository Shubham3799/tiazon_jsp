package com.beans;

import java.util.*;



public class Notification {
	private int id;
	private String message;
	private String dateSent;
	private String user;
	
	public void setId(int id){
		this.id=id;
	}
	
	public int getId(){
		return id;
	}
	
	public void setMessage(String message){
		this.message=message;
	}
	
	public String getMessage(){
		return message;
	}
	
	public String getDate(){
		return dateSent;
	}
	public void setDate(String dateSent){
		this.dateSent=dateSent;
	}
	
	public String getUser(){
		return user;
	}
	public void setUser(String user){
		this.user=user;
	}
	
	

}
