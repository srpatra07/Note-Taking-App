<%@page import="com.note.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>isLogout</title>
<%@ include file="components/bootstrapCss.jsp" %>
</head>
	<%
	User user = (User) session.getAttribute("userObj");
	if (user == null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{
	%>
	
<body>
	<%@ include file="components/homeBar.jsp" %>

	<div class="fs-3 text-center">
		<h3 style="margin-top: 40px;">Are You Sure to Log out ?</h3><br>
		<a href="logout" class="btn btn-danger text-decoration-none">Yes, Logout</a><br>
		<a href="home.jsp" class="btn btn-success text-decoration-none">No, Back to Home Page</a>
	</div>


</body>
	
	<% } %>
</html>