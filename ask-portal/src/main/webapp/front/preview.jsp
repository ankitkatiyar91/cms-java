<%@include file="header-includes.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="google_analytics.jsp"></jsp:include>
<title>Welcome</title>
</head>
<body>
	<jsp:include page="main-menu.jsp"></jsp:include>	
<div class="container" >
<%-- Site Header --%>
<jsp:include page="site-header.jsp"></jsp:include>
<div class="row">
<div class="col-lg-12" >
<s:actionerror/>
<s:actionmessage/>
</div>
</div>
	<div class="row">
	<c:choose>
		<c:when test="${fn:length(categories) gt 0}">
			<div class="col-lg-8" >
				<jsp:include page="article-content-preview.jsp"></jsp:include>
			</div>
			<div class="col-lg-4" >
				<jsp:include page="sub-menu.jsp"></jsp:include>
			</div>
		</c:when>
		<c:otherwise>
		<div class="col-lg-12" >
			<jsp:include page="article-content-preview.jsp"></jsp:include>
		</div>
		</c:otherwise>
	</c:choose>
		
	</div>
</div>
<%--Footer --%>
<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>