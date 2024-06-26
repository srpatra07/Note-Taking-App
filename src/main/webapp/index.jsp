<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@ include file="components/bootstrapCss.jsp"%>
<link rel="icon" type="image/png" sizes="32x32" href="assets/favicon-32x32.png">
</head>
<body>

	<%@ include file="components/navbar.jsp"%>

	<div class="container col-xxl-8 px-4 py-5">
		<div class="row flex-lg-row-reverse align-items-center g-5 py-5">
			<div class="col-10 col-sm-8 col-lg-6">
				<img src="assets/Notes.jpg" class="d-block mx-lg-auto img-fluid"
					alt="Site Image" width="400" height="200" loading="lazy">
			</div>
			<div class="col-lg-6" style='margin-top: 15px'>
				<h1 class="display-5 fw-bold lh-1 mb-3">Note Taking Application</h1>
				<p class="lead">.</p>
				<div class="d-grid gap-2 d-md-flex justify-content-md-start">
					<button type="button" class="btn btn-primary btn-lg px-4 me-md-2">Primary</button>
					<button type="button" class="btn btn-outline-secondary btn-lg px-4">Default</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>