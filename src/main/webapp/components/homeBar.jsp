<%@page import="com.note.dto.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
		<div style="border-radius: 5px;">
     	</div>
			<a class="navbar-brand" href="home.jsp"><b>Mo Notes</b></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<% 
				User use =(User)session.getAttribute("userObj");
			%>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="profile.jsp?id=<%= use.getId() %>">Profile</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="changePassword.jsp?id=<%= use.getId() %>">Change Password</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="isLogout.jsp">Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>