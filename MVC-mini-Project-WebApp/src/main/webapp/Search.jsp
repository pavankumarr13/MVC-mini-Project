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
      crossorigin="anonymous"
    />
<title>Search Module | PK</title>
</head>
<body>
		<%@include file="header.jsp"%>
		
		<% if (session.getAttribute("id") != null && session.getAttribute("id").equals("1")) {%>
		<div class="container" style="padding-top:80px;">
      <div class="row d-flex justify-content-center align-items-center mt-5">
        <div class="col-8 text-center">
          <form action="search" method="post">
            <div class="text-primary fw-bolder h3 mb-4 text-uppercase">
              Search Module
            </div>

            <div class="input-group">
              <span class="input-group-text mb-3 fw-bold text-dark">
                ID :</span
              >
              <input
                type="text"
                class="form-control bg-light mb-3"
                name="id"
              />
            </div>
            <div class="input-group ">
              <input
                type="submit"
                class="btn btn-success submit mb-3 fw-bold w-25 mx-auto"
                name="search"
                value="Search"
              />
            </div>
          </form>
        </div>
      </div>
      <% if (request.getParameter("id") != null) {%>
      <table
        class="table table-responsive table-bordered border-dark table-hover text-center text-capitalize mt-5"
      >
      
      
        <tr class="table-dark table-active text-uppercase text-white">
          <th>ID</th>
          <th>Name</th>
          <th>Phone</th>
          <th>Email</th>
          <th>Date</th>
        </tr>
        
        <% Registration reg = new Registration(session);
                            ArrayList<Student> mydata = reg.getUserinfo(request.getParameter("id"));
                            Iterator<Student> itr = mydata.iterator();
                            while (itr.hasNext()) {
                                Student s = itr.next();  %>
        <tr>
          <td><%=s.getId() %></td>
          <td><%=s.getName() %></td>
          <td><%=s.getPhone() %></td>
          <td><%=s.getEmail() %></td>
          <td><%=s.getDate() %></td>
        </tr>
        <%}%>
      </table>
      <%}
      }%>
    </div>
		
		<%@include file="footer.jsp"%>
</body>
</html>