<%@page import="java.util.List"%>
<%@page import="com.note.dao.UserDao"%>
<%@page import="com.note.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="components/bootstrapCss.jsp"%>
<body>

	<%
	User validateUserSession = (User) session.getAttribute("userObj");
	if (validateUserSession == null) {
		response.sendRedirect("login.jsp");
	} else {
	%>
	<%@include file="components/homeBar.jsp"%>

	<%
	User sessionUser = (User) session.getAttribute("userObj");
	%>
	<h1 class="text-center">
		Welcome
		<%=sessionUser.getName().toUpperCase()%>
		to Home Page
	</h1>
	
	<% String msg = (String)session.getAttribute("success");
						%>
						
						<% 
							if(msg!=null)
							%>
								<p class="text-center text-success fs-4"><%= msg %></p>
						<%
						session.removeAttribute("success");
						%>
	
	<div class="container border">
		<div>
			<a href="add_notes.jsp" class="btn bg-primary text-white">Add Notes</a>
		</div>
	</div>
	
	<div class="card">
		<div>
			
		</div>
	</div>
	
</body>
</html>