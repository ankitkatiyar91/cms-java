<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- article meta--%>
<c:choose>
	<c:when test="${article!=null}">
		<meta name="Keywords" content="${article.meta}" />
	</c:when>
	<c:otherwise>
		<meta name="Keywords" content="Java, Tutorials, Learning, Beginners, Basics, Object Oriented Language, Methods, Overriding, Inheritance, Polymorphism, Interfaces, Packages, Collections, Networking, Multithreading, Generics, Multimedia, Serialization, GUI" />
	</c:otherwise>
</c:choose>
<%-- article meta end --%>
<meta name="description" content="CMS Makes Learning Java in simple and easy steps : A beginner's tutorial containing complete knowledge of Java Syntax Object Oriented Language, Methods, Overriding, Inheritance, Polymorphism, Interfaces, Packages, Collections, Networking, Multithreading, Generics, Multimedia, Serialization, GUI" />
<meta name="ROBOTS" content="INDEX, FOLLOW" />
<meta name="author" content="Some Lover's of technology" />
<link rel="alternate" href="www.CMS.com" hreflang="en" />

<%-- bootstrap 3.0.2 --%>
<link href="resources/css/bootstrap-front.css" media="screen" rel="stylesheet" type="text/css" />
<%-- jquery --%>
<script src="resources/js/jquery.min.js" ></script>
<script src="resources/js/jquery-ui-1.10.4.custom.min.js" ></script>
<%-- Bootstrap --%>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<%-- additional for front --%>
<link href="resources/css/bootswatch.min.css" rel="stylesheet" type="text/css" />
<%-- Custom css --%>
<link href="resources/css/custom.css" rel="stylesheet" type="text/css" />