<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="front/header-includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <s:url action="home" namespace="/" includeContext="false"   forceAddSchemeHostAndPort="true" var="home" ></s:url>
URL:- Home:-<c:url value="home1" /><br>

In Menu:- <a href='${home}?mid='  >${home}?mid=</a>
<br>
Context:-<%=request.getContextPath() %>
</body>
</html>