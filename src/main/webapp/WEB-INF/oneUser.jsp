<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Info</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<style>
body, html {height: 100%}
body,h1,h2,h3,h4,h5,h6 {font-family: "Amatic SC", sans-serif}
.menu {display: none}
</style>
</head>
<body>
<!-- Menu Container -->
<div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="menu">
  <div class="w3-content">
  
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px">username</h1>
    <div class="w3-row w3-center w3-border w3-border-dark-grey">
      <a href="javascript:void(0)" onclick="openMenu(event, 'Pizza');" id="myLink">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red">username</div>
      </a>
      <a href="javascript:void(0)" onclick="openMenu(event, 'Pasta');">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red">Attending Events</div>
      </a>
      <a href="/events">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red">Home</div>
      </a>
    </div>

    <div id="Pizza" class="w3-container menu w3-padding-32 w3-white">
      <h1><b>${user.firstname } ${user.lastname }</b> </h1>
      <p class="w3-text-grey">Email: ${user.email }</p>
      <p class="w3-text-grey">Location: ${user.location }, ${user.state }</p>
      <hr>
   
    </div>

    <div id="Pasta" class="w3-container menu w3-padding-32 w3-white">
      <h1><b>Event</b> <span class="w3-tag w3-grey w3-round">Date</span> </h1>
      <p class="w3-text-grey">blah blah cool event</p>
      <hr>

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