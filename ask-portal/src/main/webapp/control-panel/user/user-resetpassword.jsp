<%@include file="../header-includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="wrapper row-offcanvas row-offcanvas-left">
<jsp:include page="../menu.jsp"></jsp:include>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">                
    <!-- Content Header (Page header) -->
<s:url action="userDetail" var="userDetail"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true">
	<s:param name="userId">${user.id}</s:param>
</s:url>
<section class="content-header">
<h1>
    Reset User Password
    <small>#<s:text name="%{user.id}"></s:text> </small>
</h1>
<ol class="breadcrumb">
    <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
	<li><a href="${userList}"><i class="fa fa-fw fa-user"></i>Users</a></li>
	<li><a href="${userDetail}"><i class="fa fa-fw fa-user"></i>User Details<small>#${user.id}</small></a></li>
    <li class="active">Reset Password</li>
</ol>
</section>

 <!-- Main content -->
 <section class="content">
<!-- your content goes hear -->
<c:choose>
<c:when test="${user!=null}" >
<div class="row well" >
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Email:</label>&nbsp;<c:out value="${user.email}"></c:out>
	 	<c:if test="%{user.emailAddressVerified}"><i class="fa fa-check-circle"></i></c:if>
	 </div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Screen Name:</label>&nbsp;<c:out value="${user.screenName}"></c:out></div>
	 <div class="col-md-4 col-sm-4 col-xs-4">
	 	<c:choose>
	 		<c:when test="${user.admin}"><i class="fa fa-gears"></i>&nbsp;Admin</c:when>
	 		<c:otherwise><i class="fa fa-check-circle-o"></i>&nbsp;User</c:otherwise>
	 	</c:choose>
	 </div>
</div>
<s:actionerror/>
<s:actionmessage/>
<s:form action="userResetPassword" method="post" enctype="true" role="form" namespace="/cpanel" cssStyle="max-width: 500px;" >
<s:hidden name="userId" value="%{user.id}"  ></s:hidden>
<s:password theme="portal" required="required" cssErrorClass="has-error" title="Enter a password"  name="password" placeholder="Password" cssClass="form-control" id="password" label="Password" minlength="6" ></s:password>
<s:password theme="portal" required="required" title="Re-type your password" cssErrorClass="has-error"  name="confirmpassword" placeholder="Re-type Password" cssClass="form-control" id="confirm-password" label="Confirm Password" minlength="6" ></s:password>
<s:submit value="Reset" cssClass="btn btn-primary" ></s:submit>
</s:form>
</c:when>
<c:otherwise><p class=" text-danger">Unable to process try again later</p></c:otherwise>
</c:choose>
 </section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>