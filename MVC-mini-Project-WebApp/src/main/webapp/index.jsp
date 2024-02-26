<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
<style type="text/css">
	
	#errormsg{
	 	background: green;
		padding: 10px;
		width: 50%;
		color: white;
		font-size:25px;
		font-weight: bold;
		text-align: center;
		margin-bottom:20px;
 	}
	
</style>
<title>Home</title>
</head>
<body class="bg-basic">
	<%@include file="header.jsp"%>
	
	<div class="container d-flex justify-content-center align-items-center flex-column" style="padding-top:80px;">
		<% if (request.getAttribute("status") != null) {%>
 			<div id="errormsg" > <%= request.getAttribute("status")%></div>
 			
 		<%}%>
		<h2 style="color:black; ">
			Welcome to My First Module-View-Controller Project !!
		</h2>
		
		<%if(session.getAttribute("uname")!=null) {%>
			
			<h2>Hello <span class="fw-bolder  text-success"><%= session.getAttribute("uname") %></span></h2>
			<h2>Your Email :- <span class="fw-bolder  text-success"><%= session.getAttribute("email") %></span></h2>
	 		<h2>Your Id :- <span class="fw-bolder  text-success"><%=session.getAttribute("id") %></span></h2>
	 		
	 		<%} else{ %>
	 		<h2>Please Login to access this !!!</h2>
	 		<%} %>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>