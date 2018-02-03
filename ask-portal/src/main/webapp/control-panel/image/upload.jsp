<%@include file="../header-includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp">
	<jsp:param value="jqueryTable" name="true"/>
</jsp:include>

<script type="text/javascript">
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="wrapper row-offcanvas row-offcanvas-left">
<jsp:include page="../menu.jsp"></jsp:include>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">                
    <!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
       Images
        <small>Upload</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Images</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
<!-- your content goes hear -->
<div class="row well" >
<s:url var="imagesUpload" action="imagesUpload" forceAddSchemeHostAndPort="true" namespace="/cpanel" ></s:url>
	<s:form action="imagesUpload" method="post" enctype="multipart/form-data">
	    <s:file name="upload" label="User Image" />
	    <s:submit value="Upload" align="center" />
	</s:form>
</div>
	
<c:if test="${param.id!=null}" >
<s:url action="image" var="imageOrg" forceAddSchemeHostAndPort="true" namespace="/" ></s:url>

<div class="alert alert-success">Your previous upload URL:-&nbsp;<c:out value="${imageOrg}?id=${param.id}"></c:out> </div>
<div class="row well">
  <a href="${imageOrg}?id=${param.id}" target="_blank" ><img src="${imageOrg}?id=${param.id}" title="<c:out value="${item.description}"></c:out>" class="img-responsive img-thumbnail"  style="width: 300px; height: 300px;" ></a>
</div>
</c:if>

</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>