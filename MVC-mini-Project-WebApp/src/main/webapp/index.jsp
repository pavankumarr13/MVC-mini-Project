<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
<style type="text/css">
	
</style>
<title>Home</title>
</head>
<body class="bg-basic">
	<%@include file="header.jsp"%>
	<div class="container d-flex justify-content-center align-items-center flex-column">
		<h2 style="color:black; margin-top:80px;">
			Welcome to My First Module-View-Controller Project !!
		</h2>
		
		<%if(request.getAttribute("status")!=null) {%>
			<% if(request.getAttribute("status").equals("success")) { %>
			<h2>Hello <%= session.getAttribute("uname") %></h2>
	 		<h2>Your Id is <%=session.getAttribute("id") %></h2>
	 		<%} %>
	 		<%} else{ %>
	 		<h2>Please Login to access this !!!</h2>
	 		<%} %>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>