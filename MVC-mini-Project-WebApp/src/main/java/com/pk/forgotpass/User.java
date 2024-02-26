package com.pk.forgotpass;

public class User {
	private String username;
	private String useremail;
	private String usercode;

	public User(String username, String useremail, String usercode) {
		super();
		this.username = username;
		this.useremail = useremail;
		this.usercode = usercode;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUsercode() {
		return usercode;
	}

	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}

}
