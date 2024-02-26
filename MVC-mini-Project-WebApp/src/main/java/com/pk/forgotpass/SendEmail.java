package com.pk.forgotpass;

import java.util.Properties;
import java.util.Random;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class SendEmail {
	public String getRandom() {
		Random rd = new Random();
		int otp = rd.nextInt(999999);
		
		return String.format("%06d", otp);
	}
	
	public boolean sendEmail(User user) {
		boolean check=false;
		
		String toEmail=user.getUseremail();
		String fromEmail="pavancreativity008@gmail.com";
		String pass="hjux tcap nlle hsri";
		
		try {
			Properties prop =new Properties();
			prop.put("mail.smtp.starttls.enable", "true");
	        prop.put("mail.smtp.host", "smtp.gmail.com");
//	        prop.put("mail.smtp.user", fromEmail);
//	        prop.put("mail.smtp.password", pass);
	        prop.put("mail.smtp.port", 587);
	        prop.put("mail.smtp.auth", "true");
	        
	        
	        Session session = Session.getInstance(prop, new Authenticator() {
	        	@Override
	        	protected PasswordAuthentication getPasswordAuthentication() {
	        		// TODO Auto-generated method stub
	        		return new PasswordAuthentication(fromEmail, pass);
	        	}
			});
	        
	        Message msg= new MimeMessage(session);
	        
	        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
	        msg.setFrom(new InternetAddress(fromEmail));
	        
	        msg.setSubject("Password Reset ");
	        msg.setText("Your OTP to reset the Password is "+ user.getUsercode());
	        
	        // send email 
	        
	        Transport.send(msg);
	        check=true;  
	        
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return check;
	}
}
