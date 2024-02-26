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
	crossorigin="anonymous" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.key {
	border: 2px solid lightblue;
}

.error {
	color: rgb(255, 41, 41);
}

#msg {
	color: green;
	text-align: center;
	width: 100%;
	font-weight: bold;
	font-size: 25px;
	padding: 5px;
}
</style>
<title>Reset Password | PK</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<script>
		jQuery(document)
				.ready(
						function($) {
							$("#resetpass")
									.validate(
											{
												//ignore: [],
												rules : {

													newPW : {
														required : true,
														minlength : 6,
													},
													confirmPW : {
														required : true,
														minlength : 6,
														equalTo : "#pw",
													},
												},
												messages : {

													newPW : {
														required : "Please enter the password.",
														minlength : "Please enter the password greater than or equal to 6.",
													},
													confirmPW : {
														required : "Please reenter the password.",
														minlength : "Please enter the password greater than or equal to 6.",
														equalTo : "mismatch password",
													},
												},
											});
						});
	</script>
	<div class="container" style="padding-top: 80px">
		<%
		if (request.getAttribute("status") != null) {
		%>
		<div id="msg">
			<%=request.getAttribute("status")%></div>
		<%
		}
		%>
		<div class="col-md-5 shadow p-5 border rounded-5 mx-auto">
			
			<div class="icon fs-1 text-primary mb-3 text-center">
				<i class='bx bx-key fw-bolder rounded-5 p-2 key'></i>
			</div>
			<form action="register" method="post" id="resetpass">
				<label for="newPW" class="form-text my-1 ">Enter New
					password </label>
				<div class="input-group ">
					<input type="password" class="form-control w-100" id="pw" name="newPW">
				</div>
				<label for="confirmPW" class="form-text my-1 ">Enter Confirm
					password </label>
				<div class="input-group ">
					<input type="password" class="form-control w-100" name="confirmPW">
				</div>

				<div class="input-group mt-4 mb-2">
					<input type="submit"
						class="btn btn-outline-primary mx-auto fw-bolder" name="reset"
						value="Reset">
				</div>

			</form>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>