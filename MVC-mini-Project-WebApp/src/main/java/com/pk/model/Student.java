package com.pk.model;

public class Student {
	String id;
    String name;
    String phone;
    String email;
    String date;

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }
    
     public String getDate() {
        return date;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone(String phonenumber) {
        this.phone = phonenumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

     public void setDate(String date) {
        this.date = date;
    }

}
