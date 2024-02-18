<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
	
	<style type="text/css">
			 .error{
 				color:red;
 			  }
			 .button{
				 padding: 5px;
				 width: 6%;
				 background: cornflowerblue;
				 color: white;
			 }
			 #msg
			 {
				 color:green;
				 text-align:center;
				 width:100%;
				 font-weight: bold;
				 font-size: 25px;
				 padding: 5px;

			 }
				
	
	</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<script>
		jQuery.validator.addMethod("checkemail", function(value, element) {
		 return (/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value));});
		 
		 jQuery(document).ready(function($) {$("#login").validate({
				 rules: {
					 em: {
						 required: true,
						 checkemail: true
					 },
					 pass: {
						 required: true,
						 minlength: 6
					 },
				 },
				 messages: {
					 em: {
					 	required: "Please enter the email.",
					 },
					 pass: {
						 required: "Please enter the password.",
						 minlength: "Please enter the password greater than or equal to 6.",
					 },
				 }
		 	});
		 });
		
	</script>
	
	<div class="container d-flex justify-content-center align-items-center">
		
        <div class="row border rounded-5 bg-transparent pd-3 shadow box-area my-6">
        <% if (request.getAttribute("status") != null) {%>
 			<div id="msg"> <%= request.getAttribute("status")%></div>
 			
 		<%}%>
          <div class="col-12">
            <div class="row align-items-center px-3">
	              <div class="header-text mb-2 mt-4">
	                <p class="h1" style="font-weight: 700;color: rgb(0,10,100); font-size: 30px;">Login</p>
	              </div> 
	        </div>
              <form action="register" method="post" id="login">
              	<div class="input-group mb-4">
                  <input
                    type="email"
                    name="em"
                    class="form-control form-control-lg w-100 bg-light fs-6"
                    placeholder="Enter Email address"
                  />
                </div>
                <div class="input-group mb-4">
                  <input
                    type="password"
                    name="pass"
                    id="pw"
                    class="form-control form-control-lg bg-light w-100 fs-6"
                    placeholder="Enter Password"
                  />
                </div>
              
                <button type="submit" class="btn btn-success w-100 fs-6" name="login">Submit</button>
                  
                <div style="text-align: center; margin-bottom: 15px;">
                    <a href="#" style="text-decoration: none; color: #fff;">Forgot password?</a>
                </div>
              </form>
            </div>
          </div>
        </div>
	

	<%@include file="footer.jsp"%>
</body>
</html>