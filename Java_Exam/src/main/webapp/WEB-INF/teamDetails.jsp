<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Team Details</title>
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
						<h2 class="text-center mb-4">${team.name}</h2>
						<p class="text-center">Skill Level: ${team.skillLevel}</p>
						<p class="text-center">Game Day: ${team.gameDay}</p>
						<p class="text-center">Creator: ${team.creator.peopleName}</p>

						<h4 class="text-center mt-4">Players:</h4>
						<ul class="list-group">
							<c:forEach var="player" items="${team.players}">
								<li class="list-group-item">${player.peopleName}</li>
							</c:forEach>
						</ul>

						<div class="form-section mt-4">
							<h4 class="text-center">Add New Player</h4>
							<form:form action="/teams/${team.id}/players" method="post"
								modelAttribute="newPlayer">
								<div class="mb-3">
									<form:label path="peopleName" cssClass="form-label"
										for="playerName">Player Name</form:label>
									<form:input path="peopleName" id="playerName"
										class="form-control" placeholder="Enter player name" />
									<form:errors path="peopleName" cssClass="text-danger" />
								</div>

								<div class="d-grid">
									<button type="submit" class="btn btn-primary">Add
										Player</button>
								</div>
							</form:form>
						</div>

						<div class="text-center mt-4">
							<a href="/teams/${team.id}/edit" class="btn btn-warning btn-lg">Edit
								Team</a> <a href="/teams/${team.id}/delete"
								class="btn btn-danger btn-lg">Delete Team</a>
						</div>

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
