<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="remixicon.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/139efa477f.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<style type="text/css">
	@import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
	* {
	  margin: 0;
	  padding: 0;
	  box-sizing: border-box;
	  font-family: "Poppins", sans-serif;
	}
	.navigation{
		display:flex;
		justify-content: space-between;
		flex-direction: row-reverse;
	}
	.uname i{
		margin-top:12px;
		font-size: 13px;
		margin-left:8px;
		border:1px solid #fff;	
		border-radius: 50%;
		padding-bottom: 0;
		width:15px;
		height:15px;
		text-align: center;
	}
	
	
</style>
<title>Header</title>
</head>
<body>

	<div class="navbar navbar-expand navbar-dark bg-dark position-fixed w-100 " style="height: 60px">
      <div class="container">
        <a href="#" class="navbar-brand h1 align-top">Pentagon Space</a>
        <ul class="navbar-nav navigation">
          
          <%if(session.getAttribute("uname")!=null){ %>
         	<div class="navigation">
         	<li class="nav-item uname d-flex">
            <i class='bx bx-user user text-light ' aria-hidden="true" ></i></i><a href="#" class="nav-link"><%=session.getAttribute("uname")%></a>
          </li>
          <li class="nav-item">
            <a href="register?logout=yes" class="nav-link" name="logout">Logout</a>
            
          </li>
          <%if(session.getAttribute("id").equals("1")){ %>
          <div class="navigation">
          	<li class="nav-item">
            <a href="Delete.jsp" class="nav-link">Delete</a>
          </li>
          <li class="nav-item">
            <a href="Search.jsp" class="nav-link">Search</a>
          </li>
          </div>
          <%} %>
          
          <li class="nav-item">
            <a href="EditForm.jsp" class="nav-link">Edit</a>
          </li>
          
          <%}else{ %>
          <div class="navigation">
          <li class="nav-item">
            <a href="Registration.jsp" class="nav-link">Register</a>
          </li>
          <li class="nav-item">
            <a href="login.jsp" class="nav-link">Login</a>
          </li>
          
          <%} %>
          <li class="nav-item">
            <a href="index.jsp" class="nav-link active">Home</a>
          </li>
          </div>
          
        </ul>
      </div>
    </div>
	
</body>
</html>