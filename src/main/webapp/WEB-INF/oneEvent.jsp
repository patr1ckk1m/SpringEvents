<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event Info</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" type="text/css" href="../static/css/style.css" />
<style>
body, html {height: 100%}
body,h1,h2,h3,h4,h5,h6 {font-family: "Amatic SC", sans-serif}
.menu {display: none}
</style>
</head>
<body>
<div class = "msgcontainer">
<div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="menu">
  <div class="w3-content">
  
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px">Event Info</h1>
    <div class="w3-row w3-center w3-border w3-border-dark-grey">
      <a href="javascript:void(0)" onclick="openMenu(event, 'Eventinfo');" id="myLink">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red">${event.name }</div>
      </a>
      <a href="javascript:void(0)" onclick="openMenu(event, 'Attending');">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red">People Attending</div>
      </a>
      <a href="/events">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red">Home</div>
      </a>
    </div>


    <div id="Eventinfo" class="w3-container menu w3-padding-32 w3-white">
    	<div id = "msgcontainer">
      <h1><b><span style ="color: black;">${event.name }</span> &nbsp; <fmt:formatDate dateStyle = "long" type = "date" value = "${event.date }"/></b></h1>
      <p class="w3-text-grey">Hosted by: <a href = "/users/${event.host.id}">${event.host.firstname }</a></p>
      <p class="w3-text-grey">${event.location }, ${event.state }</p>
      <p class="w3-text-grey">People who are attending this event: ${event.users.size() }</p>
      
	<div class="message">
		<h1>Message Wall</h1>
		<div class="box">
		<c:forEach var="msg" items="${event.messages }">
			<p>${msg.name } says: ${msg.userMessage }</p>
		</c:forEach>
		</div>
		<form:form method="POST" action="/message" modelAttribute="message">
			<p>Add Comment:</p>
			<form:textarea path="userMessage" rows="2" cols="20"/>
			<form:hidden path="name" value="${event.host.firstname } ${event.host.lastname }"/>
			<form:hidden path="event" value="${event.id }"/>
			<input type="submit" value="Submit">
		</form:form>
	</div>
	</div>
      
      <hr>
		
    </div>
    


    <div id="Attending" class="w3-container menu w3-padding-32 w3-white">
    <c:forEach var = "user" items = "${event.users }">
      <h1><b><span style = "color:black;"><a href = "/users/${user.id}">${user.firstname } ${user.lastname }</a></span> &nbsp; ${user.email }</b> </h1>
    </c:forEach>
      <hr>

    </div>


</div>
</div>




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
<script>
function openMenu(evt, menuName) {
	  var i, x, tablinks;
	  x = document.getElementsByClassName("menu");
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablink");
	  for (i = 0; i < x.length; i++) {
	     tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
	  }
	  document.getElementById(menuName).style.display = "block";
	  evt.currentTarget.firstElementChild.className += " w3-red";
	}
	document.getElementById("myLink").click();
</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script>
</html>