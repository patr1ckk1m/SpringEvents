<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>

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
  <li><a href="#"><b>Events</b></a></li>
  <li style = "float:right" id = "logout">    
  	<form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
    </form>
   </li>
</ul>


	    <c:if test="${logoutMessage != null}">
        <c:out value="${logoutMessage}"></c:out>
    </c:if>

<div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="menu">
  <div class="w3-content">
  
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px">Login/Register</h1>
    <div class="w3-row w3-center w3-border w3-border-dark-grey">
      <a href="javascript:void(0)" onclick="openMenu(event, 'Login');" id="myLink">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red">Login</div>
      </a>
      <a href="javascript:void(0)" onclick="openMenu(event, 'register');">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red">Register</div>
      </a>
    </div>

    <div id="Login" class="w3-container menu w3-padding-32 w3-white">
 		<h1>Login</h1>
        <c:if test="${errorMessage != null}">
        	<c:out value="${errorMessage}"></c:out>
    	</c:if>
    <form method="POST" action="/login">
        <p>
            <label for="username">Email</label>
            <input type="text" id="username" name="username" value = "pktest@gmail.com"/>
        </p>
        <p>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" value = "pkpkpkpk1"/>
        </p>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Login!"/>
    </form>
   
    </div>

    <div id="register" class="w3-container menu w3-padding-32 w3-white">
		<h1>Register!</h1>
		<p><form:errors path="user.*"/></p>
    
    <form:form method="POST" action="/registration" modelAttribute="user">
        <p>
            <form:label path="email">Email:</form:label>
            <form:input path="email"/>
        </p>
        <p>
            <form:label path="firstname">First Name:</form:label>
            <form:input path="firstname"/>
        </p>
        <p>
            <form:label path="lastname">Last Name:</form:label>
            <form:input path="lastname"/>
        </p>
        
        <p>
            <form:label path="location">Location:</form:label>
            <form:input path="location" class="shortinput"/>
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
        
        <p>
            <form:label path="password">Password:</form:label>
            <form:password path="password"/>
        </p>
        <p>
            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
            <form:password path="passwordConfirmation"/>
        </p>
        <input type="submit" value="Register!"/>
    </form:form>

    </div>


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