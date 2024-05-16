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
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>