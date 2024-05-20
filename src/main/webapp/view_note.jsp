<%@page import="com.note.dto.Notes"%>
<%@page import="com.note.dao.NotesDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Notes</title>
<%@ include file="components/bootstrapCss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>

<% 
	User user = (User)session.getAttribute("userObj");
	if(user!= null)
	{
%>

<body>

<% 	
	int id = Integer.parseInt(request.getParameter("id"));
    NotesDao dao = new NotesDao();
    Notes note = dao.fetchNotesById(id);
%>

<%@ include file="components/homeBar.jsp" %>

<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<form action="update" method="post">
							<div class="mb-3">
								<label class="form-label"><b>Title</b></label> <input name="title"
									type="text" class="form-control" value="<%= note.getTitle() %>" required>
							</div>
							<div class="mb-3">
								<label class="form-label"><b>Description</b></label> 
								<textarea rows="4" cols="46" class="form-control" name="description"><%= note.getDescription() %></textarea>
							</div>
							
							<input type="hidden" name="id" value="<%= id %>">
							
							<button type="submit" class="btn bg-primary text-white col-md-12">Update</button>
							<br><br>
							<a href="home.jsp">
							<button class="btn bg-primary text-white col-md-12"> Back to Home</button>							
							</a>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>

<% 
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
%>

</html>