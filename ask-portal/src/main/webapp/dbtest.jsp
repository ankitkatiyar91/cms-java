<%@page import="java.sql.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Testing DB</title>
</head>
<body>
<%
try{
String url="jdbc:mysql://localhost:3306/";
String user="orajpoin_main";
String password="orajpoin_main";
Driver mysqlDriver = (Driver) Class.forName("com.mysql.jdbc.Driver").newInstance();
DriverManager.registerDriver(mysqlDriver);
Connection connection=DriverManager.getConnection(url, user, password);
out.print("<b>Connection OK </b></br>");
ResultSet rst= connection.createStatement().executeQuery("Select * from orajpoin_main.user_");
rst.next();
out.print("</br>Got OK with Data-"+rst.getString(1)+"  - "+rst.getString("email"));
}catch(Exception  ex){
ex.printStackTrace(response.getWriter());
}
%>
</body>
</html>