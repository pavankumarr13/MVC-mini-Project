<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page | PK</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="style.css" />
<script  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<style type="text/css">
	#msg{
		color:red;
		text-align:center;
		width:100%;
		font-weight: bold;
		font-size: 25px;
		padding: 5px;
		margin-top:10px;
	}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<script>
      jQuery(document).ready(function ($) {
        $("#signup").validate({
          //ignore: [],
          rules: {
            name: {
              required: true,
            },
            email: {
              required: true,
              checkemail: true,
            },
            phone: {
              required: true,
              minlength: 10,
              maxlength: 10,
            },
            pw: {
              required: true,
              minlength: 6,
            },
            cp: {
              required: true,
              minlength: 6,
              equalTo: "#pw",
            },
          },
          messages: {
            name: {
              required: "Please enter the name.",
            },
            email: {
              required: "Please enter the email.",
              email: "Please enter valid email id",
            },
            phone: {
              required: "Please enter the number.",
              minlength: "Please enter the 10 digit number .",
              maxlength: "more than 10 digits.",
            },
            pw: {
              required: "Please enter the password.",
              minlength:
                "Please enter the password greater than or equal to 6.",
            },
            cp: {
              required: "Please reenter the password.",
              minlength:
                "Please enter the password greater than or equal to 6.",
              equalTo: "mismatch password",
            },
          },
        });
      });

      jQuery.validator.addMethod("checkemail", function (value, element) {
        return (/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value));});
    </script>

   <div class="container d-flex justify-content-center align-items-center">
        <div
          class="row border rounded-5 bg-transparent pd-3 shadow box-area my-6">
          
          <div class="col-12">
          
            <div class="row align-items-center px-3">
            <% if (request.getAttribute("status") != null) {%>
 			<div id="msg" > <%= request.getAttribute("status")%></div>
 			<%}%>
              <div class="header-text mb-1 mt-2">
                <p class="h1" style="font-weight: 700;color: rgb(4, 255, 46); font-size: 30px;">Register</p>
              </div>
              <form action="register" method="post" id="signup">
                <div class="input-group mb-2">
                  <input
                    type="text"
                    name="name"
                    class="form-control form-control-sm bg-light fs-6 w-100"
                    placeholder="Enter Username"
                  />
                </div>
                <div class="input-group mb-2">
                  <input
                    type="number"
                    name="phone"
                    class="form-control form-control-sm bg-light w-100 fs-6"
                    placeholder="Enter Phone-Number"
                  />
                </div>
                <div class="input-group mb-2">
                  <input
                    type="email"
                    name="email"
                    class="form-control form-control-sm w-100 bg-light fs-6"
                    placeholder="Enter Email address"
                  />
                </div>
                <div class="input-group mb-2">
                  <input
                    type="password"
                    name="pw"
                    id="pw"
                    class="form-control form-control-sm bg-light w-100 fs-6"
                    placeholder="Enter Password"
                  />
                </div>
                <div class="input-group mb-2">
                  <input
                    type="password"
                    name="cp"
                    class="form-control form-control-sm bg-light w-100 fs-6"
                    placeholder="Confirm Password"
                  />
                </div>
                <div class="input-group mb-5">
                  <input
                    type="submit"
                    name="register"
                    value="Register"
                    class="btn btn-lg btn-primary w-100 fs-6"
                    placeholder="Enter Username"
                  />
                </div>
              </form>
            </div>
          </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</body>
</html>