<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Events</title>
</head>
<body>
    <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
    </form>


	<h1>Welcome ${currentUser.firstname }</h1>
	<h3>Here are some of the events in your state</h3>
	
	<table>
		<tr>
			<th>Name</th>
			<th>Date</th>
			<th>Location</th>
			<th>Host</th>
			<th>Action/Status</th>
		</tr>
		<c:forEach var = "event" items = "${events }">
		<c:if test= "${currentUser.location.equals(event.location) }">
			<tr>
				<th><a href = "/events/${event.id}">${event.name }</a></th>
				<th><fmt:formatDate dateStyle = "long" type = "date" value = "${event.date }"/></th>
				<th>${event.location }</th>
				<th>${event.host.firstname }</th>
				<c:if test = "${event.host.id == currentUser.id }">
					<th><a href = "/events/${event.id }/edit">Edit</a>  <a href = "/delete/${event.id }">Delete</a></th>
				</c:if>
				<c:if test="${event.host.id != currentUser.id }">
    				<c:if test="${event.users.contains(currentUser) }">
						<td>Joining <a href="/cancel/${event.id}">Cancel</a></td>
					</c:if>
					<c:if test="${!event.users.contains(currentUser) }">
						<td><a href="/join/${event.id}">Join</a></td>
					</c:if>
    			</c:if>
			</tr>
		</c:if>
		</c:forEach>
	</table>
	
	<h3>Here are some of the events in other states: </h3>
	<table>
		<tr>
			<th>Name</th>
			<th>Date</th>
			<th>Location</th>
			<th>Host</th>
			<th>Action</th>
		</tr>
		<c:forEach var = "event" items = "${events }">
			<c:if test = "${!currentUser.location.equals(event.location) }">
				<tr>
					<td><a href = "/events/${event.id}">${event.name }</a></td>
					<th><fmt:formatDate dateStyle = "long" type = "date" value = "${event.date }"/></th>
					<th>${event.location }</th>
					<th>${event.host.firstname }</th>
					<c:if test="${event.users.contains(currentUser) }">
						<td>Joining <a href="/cancel/${event.id}">Cancel</a></td>
					</c:if>
					<c:if test="${!event.users.contains(currentUser) }">
						<td><a href="/join/${event.id}">Join</a></td>
					</c:if>
				</tr>
			</c:if>	
		</c:forEach>
	</table>
	
	
	<form:form method="POST" action="/addevent" modelAttribute="event">
		<form:hidden path="host" value = "${currentUser.id }"/>
		<h1>New Event</h1>
		
		<p>
		    <form:label path="name">Name:
		    <form:errors path="name"/>
			 <form:input path="name"/>
		    </form:label>
	    </p>
	    
	    <p>
		    <form:label path="date">Date:
		    <form:errors path="date"/>
		    <form:input path="date" type="date"/></form:label>
		</p>
		
       	<p>
       	<form:label path = "location">Location:</form:label>
       	<input type = "text" placeholder="City">
        	<select name = "location">
        		<option value="AL">Alabama</option>
				<option value="AK">Alaska</option>
				<option value="AZ">Arizona</option>
				<option value="AR">Arkansas</option>
				<option value="CA">California</option>
				<option value="CO">Colorado</option>
				<option value="CT">Connecticut</option>
				<option value="DE">Delaware</option>
				<option value="DC">District Of Columbia</option>
				<option value="FL">Florida</option>
				<option value="GA">Georgia</option>
				<option value="HI">Hawaii</option>
				<option value="ID">Idaho</option>
				<option value="IL">Illinois</option>
				<option value="IN">Indiana</option>
				<option value="IA">Iowa</option>
				<option value="KS">Kansas</option>
				<option value="KY">Kentucky</option>
				<option value="LA">Louisiana</option>
				<option value="ME">Maine</option>
				<option value="MD">Maryland</option>
				<option value="MA">Massachusetts</option>
				<option value="MI">Michigan</option>
				<option value="MN">Minnesota</option>
				<option value="MS">Mississippi</option>
				<option value="MO">Missouri</option>
				<option value="MT">Montana</option>
				<option value="NE">Nebraska</option>
				<option value="NV">Nevada</option>
				<option value="NH">New Hampshire</option>
				<option value="NJ">New Jersey</option>
				<option value="NM">New Mexico</option>
				<option value="NY">New York</option>
				<option value="NC">North Carolina</option>
				<option value="ND">North Dakota</option>
				<option value="OH">Ohio</option>
				<option value="OK">Oklahoma</option>
				<option value="OR">Oregon</option>
				<option value="PA">Pennsylvania</option>
				<option value="RI">Rhode Island</option>
				<option value="SC">South Carolina</option>
				<option value="SD">South Dakota</option>
				<option value="TN">Tennessee</option>
				<option value="TX">Texas</option>
				<option value="UT">Utah</option>
				<option value="VT">Vermont</option>
				<option value="VA">Virginia</option>
				<option value="WA">Washington</option>
				<option value="WV">West Virginia</option>
				<option value="WI">Wisconsin</option>
				<option value="WY">Wyoming</option>
        	</select>
       	</p>
	    
	    <input type="submit" value="Create"/>
	</form:form>
</body>
</html>