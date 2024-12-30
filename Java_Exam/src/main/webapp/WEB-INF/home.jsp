<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<style>
#loadingScreen {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgb(255, 255, 255);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 9999;
}

.spinner-border {
	width: 3rem;
	height: 3rem;
	border-width: 0.3em;
}
</style>
</head>

<body>
	<div id="loadingScreen">
		<div class="spinner-border text-primary" role="status">
			<span class="visually-hidden">Loading...</span>
		</div>
	</div>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-10">
				<div class="card shadow-lg">
					<div class="card-body">
						<h1 class="text-center mb-4">Welcome,
							${loggedPeople.peopleName}</h1>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Team Name</th>
									<th scope="col">Skill Level(1-5)</th>
									<th scope="col">Game Day</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="team" items="${loggedPeople.createdTeams}">
									<tr>
										<td><a href="/teams/${team.id}">${team.name}</a></td>
										<td>${team.skillLevel}</td>
										<td>${team.gameDay}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class="text-center mb-4">
							<a href="/teams/new" class="btn btn-primary">Create New Team</a>
						</div>

						<div class="text-center mt-4">
							<a href="/logout" class="btn btn-danger btn-lg">Logout</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script>
        window.addEventListener("load", function () {
            document.getElementById("loadingScreen").style.display = "none"; 
        });
    </script>
</body>

</html>
