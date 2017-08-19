<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${event.name }</title>
</head>
<body>
	<a href="/events">Back to Events</a>
	<h1>${event.name }</h1>
	<p>Host: ${event.host.firstname }</p>
	<p>Date: ${event.date }</p>
	<p>Location: ${event.location }</p>
	<p>People who are attending this event: ${event.users.size() }</p>
	
	<table>
		<tr>
			<th>Name</th>
			<th>Location</th>
		</tr>
		<c:forEach var = "user" items = "${event.users }">
			<tr>
				<td>${user.firstname } ${user.lastname }</td>
				<td>${user.location }</td>
			</tr>
		</c:forEach>
	</table>
	
	<h1>Message Wall</h1>
	<c:forEach var = "message" items = "${event.messages }">
		<p>${message.name } says: ${message.userMessage }</p>
	</c:forEach>
	
	<form:form method = "POST" action="/message" modelAttribute = "message">
		<p>Add Comment: </p>
		<form:textarea path = "userMessage" rows = "2" cols = "20"/>
		<form:hidden path = "name" value = "${currentUser.firstname } ${currentUser.lastname }"/>
		<form:hidden path = "event" value = "${event.id }"/>
		<input type = "submit" value = "Submit">
	</form:form>
	
</body>
</html>