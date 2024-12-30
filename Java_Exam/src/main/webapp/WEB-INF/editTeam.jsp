<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Team</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-8 col-lg-6">
				<div class="card shadow-lg">
					<div class="card-body">
						<h2 class="text-center mb-4">Edit Team</h2>

						<form:form action="/teams/${team.id}/update" method="post"
							modelAttribute="team">
							<div class="mb-3">
								<form:label path="name" cssClass="form-label" for="teamName">Team Name</form:label>
								<form:input path="name" id="teamName" class="form-control"
									placeholder="Enter team name" />
								<form:errors path="name" cssClass="text-danger" />
							</div>

							<div class="mb-3">
								<form:label path="skillLevel" cssClass="form-label"
									for="skillLevel">Skill Level</form:label>
								<form:input path="skillLevel" id="skillLevel"
									class="form-control" placeholder="Enter skill level" />
								<form:errors path="skillLevel" cssClass="text-danger" />
							</div>

							<div class="mb-3">
								<form:label path="gameDay" cssClass="form-label" for="gameDay">Game Day</form:label>
								<form:input path="gameDay" id="gameDay" class="form-control"
									placeholder="Enter game day" />
								<form:errors path="gameDay" cssClass="text-danger" />
							</div>

							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form:form>

						<div class="text-center mt-4">
							<a href="/home" class="btn btn-secondary btn-lg">Back to Home</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
