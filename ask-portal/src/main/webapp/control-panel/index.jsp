<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header-includes.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="wrapper row-offcanvas row-offcanvas-left">
<jsp:include page="menu.jsp"></jsp:include>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">                
<!-- Content Header (Page header) -->
<section class="content-header">
    <ol class="breadcrumb">
        <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
    </ol>
</section>

<!-- Main content -->
 <section class="content">
<!-- your content goes hear -->
<div class="container">
	<div class="row well">
		<s:url action="clearCache" forceAddSchemeHostAndPort="true" var="clearCache" ></s:url>
		<div class="col-md-4 col-sm-4 col-xs-4">
			<a href="${clearCache}" class="btn btn-danger active" title="Clear all the cached data" role="button">Clear Cache</a>
		</div>
		
		<s:url action="rebuildIndex" forceAddSchemeHostAndPort="true" var="rebuildIndex" ></s:url>
		<div class="col-md-4 col-sm-4 col-xs-4">
			<a href="${rebuildIndex}" class="btn btn-danger active" title="Rebuild Index (This may take few minutes)" role="button">Rebuild Search Index</a>
		</div>
	</div>
</div>
 </section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="footer-includes.jsp"></jsp:include>
</body>
</html>