<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pk.model.Student"%>
<%@page import="com.pk.model.Registration"%>

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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap")
	;

.text {
	text-align: center;
	font-size: 25px;
}

body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

.submit {
	font-size: 18px;
	letter-spacing: 1px;
}
</style>

<title>Edit Form</title>
</head>
<body>
	<%@include file="header.jsp"%>

	<%
	if (session.getAttribute("uname") != null) {
		Registration reg = new Registration(session);
		Student s = reg.getInfo();
	%>


	<div
		class="container d-flex justify-content-center align-items-center min-vh-100 flex-column">
		<div
			class="row border-dark rounded-5 bg-light pd-3 shadow-lg box-area my-6">
			<div class="col d-flex justify-content-center align-items-center p-4">
				<form action="register" method="post">
					<div class="text-primary fw-bolder text mb-4">Edit-Profile</div>
					<div class="input-group">
						<span class="input-group-text mb-3 fw-bold text-dark"> Name
							:</span> <input type="text" class="form-control bg-light mb-3 "
							name="uname" value="<%=s.getName()%>">
					</div>
					<div class="input-group">
						<span class="input-group-text mb-3 fw-bold text-dark">
							Phone :</span> <input type="text" class="form-control bg-light mb-3"
							name="phone" value="<%=s.getPhone()%>">
					</div>
					<div class="input-group">
						<span class="input-group-text mb-3 fw-bold text-dark">
							Email :</span> <input type="text" class="form-control bg-light mb-3"
							name="email" value="<%=s.getEmail()%>">
					</div>
					<div class="input-group">

						<input type="submit"
							class="btn btn-success w-100 submit mb-3 fw-bold " name="submit"
							value="Update" />
					</div>
			</div>
			</form>
			<%
			}
			%>

		</div>
	</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>