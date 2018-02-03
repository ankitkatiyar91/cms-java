<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Properties</title>
</head>
<body>
<h1>Properties</h1>
<%
	Properties properties=System.getProperties();
Enumeration keys=properties.keys();
Object obj;
while(keys.hasMoreElements()){
	obj=keys.nextElement();
	out.print("<b>"+obj+"</b>:  "+properties.getProperty((String)obj)+"</br>");
} %>
</body>
</html>