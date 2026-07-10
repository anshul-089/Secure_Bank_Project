package controllers;

import jakarta.servlet.annotation.*;

@SuppressWarnings("serial")
public class UserBean 
{
	private String user_id,f_name,l_name,email,password,address,transaction_pin;
	private long phone_no,account_number;
	private float open_balance;
	
	public String getTransaction_pin() {
		return transaction_pin;
	}
	public void setTransaction_pin(String transaction_pin) {
		this.transaction_pin = transaction_pin;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public long getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(long phone_no) {
		this.phone_no = phone_no;
	}
	public long getAccount_number() {
		return account_number;
	}
	public void setAccount_number(long account_number) {
		this.account_number = account_number;
	}
	public float getOpen_balance() {
		return open_balance;
	}
	public void setOpen_balance(float open_balance) {
		this.open_balance = open_balance;
	}
	
	
}
