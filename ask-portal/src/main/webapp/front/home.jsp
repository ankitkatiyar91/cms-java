<%@include file="header-includes.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<jsp:include page="head.jsp"></jsp:include>
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
	<%--Main menu --%>
	<jsp:include page="main-menu.jsp"></jsp:include>
	<div class="container" style="min-height: 90%">
		<%-- Site Header --%>
		<jsp:include page="site-header.jsp"></jsp:include>
		<div class="row">
			<div style="text-align: center; margin-top: 30px;">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-xs-6 col-md-3">
								<a href="#" class="thumbnail"> <img src="resources/images/notfound.jpg" alt="..." height="100px;" >
								</a>
							</div>
							<div class="col-xs-6 col-md-3">
								<a href="#" class="thumbnail"> <img src="resources/images/notfound.jpg" alt="..." height="100px;" >
								</a>
							</div>
							<div class="col-xs-6 col-md-3">
								<a href="#" class="thumbnail"> <img src="resources/images/notfound.jpg" alt="..." height="100px;" >
								</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%--Footer --%>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>