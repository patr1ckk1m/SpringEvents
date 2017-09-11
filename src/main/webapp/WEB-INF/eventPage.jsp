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
<link rel="stylesheet" type="text/css" href="../static/css/style.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<style>
body, html {height: 100%}
body,h1,h2,h3,h4,h5,h6 {font-family: "Amatic SC", sans-serif}
.menu {display: none}
.bgimg {
    background-repeat: no-repeat;
    background-size: cover;
    background-image: url("../img/event.jpg");
    min-height: 90%;
}


    .formcontainer input {
        width: 100%;
        clear: both;
    }
    
    .formcontainer select {
    width: 100%;
    text-align: center;
    }
</style>
</head>
<body>
<ul>
  <li><a href="/events">Home</a></li>
  <li><a href="#">Contact</a></li>
  <li style = "float:right" id = "logout">    
  	<form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
    </form>
   </li>
</ul>


<div class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-padding">
    <span class="w3-tag w3-xlarge">Welcome back, ${currentUser.firstname }</span>
  </div>
  <div class="w3-display-middle w3-center">
    <span class="w3-text-white w3-hide-small" style="font-size:100px">find<br>your next event</span>

    <p><a href="#menu" class="w3-button w3-xxlarge w3-black">See events near ${currentUser.location }, ${currentUser.state }</a></p>
  </div>
</div>



<div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="menu">
  <div class="w3-content">
  
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px">All Events</h1>
    <div class="w3-row w3-center w3-border w3-border-dark-grey">
      <a href="javascript:void(0)" onclick="openMenu(event, 'Nearby');" id="myLink">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red">Near ${currentUser.location }, ${currentUser.state }</div>
      </a>
      <a href="javascript:void(0)" onclick="openMenu(event, 'Other');">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red">Other Events</div>
      </a>
      <a href="javascript:void(0)" onclick="openMenu(event, 'Addnew');">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red">Add Event</div>
      </a>
    </div>



    <div id="Nearby" class="w3-container menu w3-padding-32 w3-white">
    	<c:forEach var = "event" items = "${events }">
			<c:if test= "${currentUser.state.equals(event.state) }">
		      <h1><b><a href="/events/${event.id }" style = "color:black">${event.name }</a> &nbsp; <fmt:formatDate dateStyle = "long" type = "date" value = "${event.date }"/></b> 
		      <span class="w3-right w3-tag w3-dark-grey w3-round">
		      		<c:if test = "${event.host.id == currentUser.id }">
						<td><a href = "/events/${event.id }/edit">Edit</a>  <a href = "/delete/${event.id }">Delete</a></td>
					</c:if>
					<c:if test="${event.host.id != currentUser.id }">
			      		<c:if test="${event.users.contains(currentUser) }">
							<td>Going &nbsp; <a href="/cancel/${event.id}">Cancel</a></td>
						</c:if>
						<c:if test="${!event.users.contains(currentUser) }">
							<td><a href="/join/${event.id}">Join</a></td>
						</c:if>
					</c:if>
		      </span>
		      </h1>
		      <p class="w3-text-grey">Hosted by: <a href = "/users/${event.host.id}">${event.host.firstname }</a></p>
		      <p class="w3-text-grey">${event.location }, ${event.state }</p>
		      <p class="w3-text-grey">${event.description }</p>
		      <hr>
		   
          	</c:if>
    	</c:forEach>
    </div>

    <div id="Other" class="w3-container menu w3-padding-32 w3-white">
    	<c:forEach var="event" items="${events }">
    		<c:if test="${!currentUser.state.equals(event.state) }">
      			<h1><b><a href="/events/${event.id }" style = "color:black">${event.name }</a> &nbsp; <fmt:formatDate dateStyle = "long" type = "date" value = "${event.date }"/></b> 
      			<span class="w3-right w3-tag w3-dark-grey w3-round">
	      			<c:if test = "${event.host.id == currentUser.id }">
						<td><a href = "/events/${event.id }/edit">Edit</a>  <a href = "/delete/${event.id }">Delete</a></td>
					</c:if>
					<c:if test="${event.host.id != currentUser.id }">
			      		<c:if test="${event.users.contains(currentUser) }">
							<td>Going &nbsp; <a href="/cancel/${event.id}">Cancel</a></td>
						</c:if>
						<c:if test="${!event.users.contains(currentUser) }">
							<td><a href="/join/${event.id}">Join</a></td>
						</c:if>
					</c:if>
      			</span>
      			</h1>
      		  <p class="w3-text-grey">Hosted by: <a href = "/users/${event.host.id}">${event.host.firstname }</a></p>
		      <p class="w3-text-grey">${event.location }, ${event.state }</p>
		      <p class="w3-text-grey">${event.description }</p>
      <hr>
      </c:if>
      </c:forEach>
    </div>
    <div class = "formcontainer">
    <!-- NEW EVENT FORM -->
	    <div id="Addnew" class="w3-container menu w3-padding-32 w3-white">
	    <form:form method="POST" action="/addevent" modelAttribute="event">
	    	<form:hidden path="host" value = "${currentUser.id }"/>
		      <h1><b>New Event</b></h1>
		      <p class="w3-text-grey">
		      	<form:label path="name">Name:
		    	<form:errors path="name"/>
			 	<form:input path="name"/>
		    	</form:label>
		      </p>
		      <p class="w3-text-grey">
		    <form:label path="date">Date:
		    <form:errors path="date"/>
		    <form:input path="date" type="date"/></form:label>
		      </p>
		      
		      		      <p class="w3-text-grey">
		      	<form:label path="description">Description:
		    	<form:errors path="description"/>
			 	<form:input path="description"/>
		    	</form:label>
		      </p>
		      
		      	<p class="w3-text-grey">
       	    <form:label path="location">City:</form:label>
            <form:input path="location" class="shortinput"/>
            </p>
            
            <p class="w3-text-grey">
            <form:label path = "state">State:</form:label>
        	<form:select path = "state">
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
        	</form:select>
        	</p>

	    
	    <input type="submit" value="Create"/>
		      <hr>
		</form:form>
	</div>

    </div><br>

  </div>
</div>


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