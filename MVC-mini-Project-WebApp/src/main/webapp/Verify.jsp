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
<style type="text/css">
#msg {
	color: red;
	text-align: center;
	width: 100%;
	font-weight: bold;
	font-size: 25px;
	padding: 5px;
	margin-top: 10px;
}
</style>
<title>Verify | PK</title>
</head>
<body>
	<%@include file="header.jsp"%>

	<div class="container " style="padding-top: 140px">
		<%
		if (request.getAttribute("status") != null) {
		%>
		<div id="msg">
			<%=request.getAttribute("status")%></div>
		<%
		}
		%>
		<div class="col-md-6 border rounded-5 p-5 shadow mx-auto">
			<div class="text-center p-4">
				<span class="text-primary h1">Verify</span>
			</div>
			<form action="verify" method="post">
				<div class="input-group">
					<input type="text" class="form-control mb-3"
						placeholder="Enter The OTP" name="usercode">
				</div>

				<div class="input-group">
					<input type="submit"
						class="btn btn-primary  fw-bolder mx-auto mb-3">
				</div>
			</form>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>