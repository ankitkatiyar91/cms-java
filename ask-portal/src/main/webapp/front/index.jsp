<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<jsp:forward page="home"></jsp:forward>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<h1>Welcome! Go to cpanel for now</h1>
<s:url action="login" var="login" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<a href="${login}" >Cpanel</a>
</body>
</html>