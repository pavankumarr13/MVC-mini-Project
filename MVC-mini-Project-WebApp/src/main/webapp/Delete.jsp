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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<style type="text/css">
.area{
	padding-top:80px;
}
.errmsg {
	background: green;
	padding: 6px;
	width: 50%;
	color: white;
	font-weight: bold;
	font-size: 23px;
}
	
</style>
<title>Delete User</title>
</head>
<body>
	<%@include file="header.jsp"%>

	
	<div class="container">
		<div class="row d-flex justify-content-center align-items-center area">
			<div class="col-8 text-center">
				<% if (request.getAttribute("status") != null) {%>
				<h1 class="errmsg w-100 mx-auto ">
					<%= request.getAttribute("status")%></h1>
				<%}%>
				
					<div class="text-primary fw-bolder h3 mb-4 text-uppercase">
						Delete User</div>
						<input class="form-control mx-auto w-100" id="search" type="text" placeholder="Search..">
					
			
			</div>
		</div>
		
		<table
			class="table table-responsive table-bordered border-dark table-hover text-center text-capitalize mt-5">
			<tr class="table-dark table-active text-uppercase text-white">
				<th>ID</th>
				<th>Name</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Date</th>
				<th class="w-25">Delete</th>
			</tr>
		
			<% 
			if (session.getAttribute("id") != null && session.getAttribute("id").equals("1")) {
	        Registration reg = new Registration(session);
	        ArrayList<Student> mydata = reg.getUserDetails();
	        Iterator<Student> itr = mydata.iterator();
	        while (itr.hasNext()) {
	        Student s = itr.next();
        %>
			<tr>
				<td><%=s.getId() %></td>
				<td><%=s.getName() %></td>
				<td><%=s.getPhone() %></td>
				<td><%=s.getEmail() %></td>
				<td><%=s.getDate() %></td>
				<td>
					<form action="delete" method="post">
						<input type="hidden" class="form-control w-25" name="userid"
							value="<%=s.getId() %>" /> <input type="submit"
							class="btn btn-danger text-white p-1 w-50" value="Delete" />
					</form>

				</td>
			</tr>
			<%} %>
		</table>
	</div>
	<%
	}%>

	<script>
		$(document).ready(function(){
		$("#search").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		//alert(value);
		$("#table tr").filter(function() {
		$(this).toggle($(this).text().toLowerCase().indexOf(value) > 0)
		//alert(this);
		});
		});
		});
</script>

	<%@include file="footer.jsp"%>
</body>
</html>