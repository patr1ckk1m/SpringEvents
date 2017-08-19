<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${event.name }</title>
</head>
<body>
	<h1>${event.name }</h1>
	<p>Host: ${event.host.firstname }</p>
	<p>Date: ${event.date }</p>
	<p>Location: ${event.location }</p>
	<p>People who are attending this event: </p>
</body>
</html>