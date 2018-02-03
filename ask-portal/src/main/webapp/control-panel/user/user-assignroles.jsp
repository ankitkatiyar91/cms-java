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
<s:url var="userDetail" namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true" action="userDetail" >
	<s:param name="userId">${user.id}</s:param>
</s:url>
<div class="wrapper row-offcanvas row-offcanvas-left">
<jsp:include page="../menu.jsp"></jsp:include>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">                
    <!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        User<small>Assign Roles</small>
    </h1>
    <ol class="breadcrumb">
     <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
<li><a href="${userList}"><i class="fa fa-fw fa-user"></i> Users</a></li>
<li><a href="${userDetail}"><i class="fa fa-fw fa-user"></i>User Details<small>#${user.id}</small></a></li>
<li class="active">User Details</li>
     </ol>
 </section>

    <!-- Main content -->
<section class="content">
<!-- your content goes hear -->
<c:if test="${user!=null}" >
<div class="row well" >
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Email:</label>&nbsp;<c:out value="${user.email}"></c:out>
	 	<c:if test="${user.emailAddressVerified}"><i class="fa fa-check-circle"></i></c:if>
	 </div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Screen Name:</label>&nbsp;<c:out value="${user.screenName}"></c:out></div>
	 <div class="col-md-4 col-sm-4 col-xs-4">
	 	<c:choose>
	 		<c:when test="${user.admin}"><i class="fa fa-gears"></i>&nbsp;Admin</c:when>
	 		<c:otherwise><i class="fa fa-check-circle-o"></i>&nbsp;User</c:otherwise>
	 	</c:choose>
	 </div>
</div>
<div class="row well" >
<div class="col-md-12 col-sm-12 col-xs-12">
<c:forEach items="${user.roles}" var="role" >
	<i class="fa fa-arrow-right"></i> <c:out value="${role.name}"></c:out>
</c:forEach>

</div>
</div>
<s:actionmessage/>
<s:actionerror/>
<div class="row well" >
<s:form action="userAssignRole" namespace="/cpanel" method="POST"  >
<s:hidden name="user.id" value="%{user.id}" ></s:hidden>
	<div class="col-md-8 col-sm-8 col-xs-8">
	<s:checkboxlist list="%{roles}"  listKey="roleId" listValue="name" value="%{user.roles}" name="assignedRoles"></s:checkboxlist>
	</div>
	<div class="col-md-4 col-sm-4 col-xs-4">
	<s:submit cssClass="btn btn-primary active" value="Assign" ></s:submit>
	</div>
</s:form>
</div>
</c:if>
</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>