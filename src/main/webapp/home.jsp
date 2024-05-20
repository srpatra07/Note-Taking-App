<%@page import="com.note.dao.UserDao"%>
<%@page import="com.note.dto.Notes"%>
<%@page import="java.util.List"%>
<%@page import="com.note.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="components/bootstrapCss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>

<% 
	User user = (User)session.getAttribute("userObj");
	if(user!=null){
%>
	<body>

<%@ include file="components/homeBar.jsp" %>
<h3 style="text-align: center; color:red"> Welcome to Home page</h3>

  <% String successmsg=(String)session.getAttribute("success"); 
    if(successmsg!=null){%>
		<p class="text-center text-success fs-4"><%= successmsg%></p>
	 <% 
	 session.removeAttribute("success");
						    }
	%>
	<% String updatesuccess=(String)session.getAttribute("updatesuccess"); 
    if(updatesuccess!=null){%>
		<p class="text-center text-success fs-4"><%= updatesuccess%></p>
	 <% 
	 session.removeAttribute("updatesuccess");
						    }
	%>
	<% 
	    int id=user.getId();
	    UserDao dao=new UserDao();
	    User u=dao.fetchUserById(id);
	    List<Notes> list= u.getNotes();
	%>
<div class="container border">
  <div>
  <a href="add_notes.jsp" class="btn btn-sm btn-primary">Add Note</a>
  </div>

<div class="row">
   <% for(Notes n:list){
	   %>
	   
	   <div class="col-md-3 card border border-primary m-3" style="width:15em;" > 
	       <div class="card-body">
	       
	       <div class="d-flex flex-wrap justly-content-evenly">
	       <div>
	         <h2 class="text-success card-title"><%=n.getTitle() %></h2>
	         <a href="view_note.jsp?id=<%=n.getId()%>" class="btn btn-sm btn-info">view</a>
	         <a href="view_note.jsp?id=<%=n.getId()%>" class="btn btn-sm btn-info">update</a>
	         <a href="delete?id=<%=n.getId()%>" class="btn btn-sm btn-info btn-danger">delete</a>
	         </div>
	       </div>
	       
	       </div>
	   </div>
	   <% 
   }
	   %>
   </div>
</div>
</body>


<% 
	}
else{
		response.sendRedirect("login.jsp");
}

%>

</html>