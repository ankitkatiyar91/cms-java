<%@include file="header-includes.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="google_analytics.jsp"></jsp:include>
<c:choose>
	<c:when test="${article!=null}">
		<title>CMS:&nbsp;<c:out value="${article.title}"></c:out></title>
	</c:when>
	<c:otherwise>
		<title>CMS, Learn it in easy way!</title>
	</c:otherwise>
</c:choose>
</head>
<body>
<%-- fb APIs --%>
<div id="fb-root"></div>
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3&appId=YOUR_APP_ID";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<%--Main menu --%>
	<jsp:include page="main-menu.jsp"></jsp:include>
	<div class="container" style="min-height: 90%">
		<%-- Site Header --%>
		<jsp:include page="site-header.jsp"></jsp:include>
		<div class="row">
			<div class="col-lg-12">
				<s:actionerror />
				<s:actionmessage />
			</div>
		</div>
		<div class="row">
			<c:choose>
				<c:when test="${fn:length(categories) gt 0}">
					<div class="col-lg-8">
						<jsp:include page="article-content.jsp"></jsp:include>
					</div>
					<div class="col-lg-4" style="margin: 10px auto;">
						<jsp:include page="sub-menu.jsp"></jsp:include>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-lg-12">
						<jsp:include page="article-content.jsp"></jsp:include>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
	<%--Footer --%>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>