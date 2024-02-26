<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<style type="text/css">
.error {
	color: rgb(255, 41, 41);
}
</style>
<title>Forgot Password | PK</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<script>
		jQuery.validator
				.addMethod(
						"checkemail",
						function(value, element) {
							return (/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
									.test(value) || /^[0-9]{10}$/.test(value));
						});

		jQuery(document).ready(function($) {
			$("#forgot").validate({
				rules : {
					useremail : {
						required : true,
						checkemail : true
					},

				},
				messages : {
					useremail : {
						required : "Please enter the email.",
					}
				}
			});
		});
	</script>
	<div class="container " style="padding-top: 120px">

		<div class="col-md-6 border rounded-5 p-5 shadow my-auto mx-auto">
			<div class="text-center p-4">
				<span class="text-primary h1">Fill the Form</span>
			</div>
			<form action="forgot" method="post" id="forgot">
				<div class="input-group mb-2">
					<input type="text" class="form-control mb-3 w-100"
						placeholder="Enter User Name " name="username">
				</div>
				<div class="input-group mb-2">
					<input type="email" class="form-control mb-3 w-100"
						placeholder="Enter User Email " name="useremail">
				</div>
				<div class="input-group">
					<input type="submit"
						class="btn btn-primary w-25 fw-bolder mx-auto mb-3">
				</div>
			</form>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>