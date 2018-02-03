<%@include file="../header-includes.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
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
 <section class="content-header">
     <h1>
         User Details
         <small>#<c:out default="${userId}" value="${user.id}"></c:out></small>
     </h1>
     <ol class="breadcrumb">
         <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
         <li><a href="${userList}"><i class="fa fa-fw fa-user"></i> Users</a></li>
         <li class="active">User Details</li>
     </ol>
 </section>

 <!-- Main content -->
 <section class="content well">
 
	<!-- your content goes hear -->
	<s:actionerror/>
	<s:actionmessage/>
<c:if test="${user!=null}" >
	<div class="row well" >
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Email:</label>&nbsp;<c:out value="${user.email}"></c:out>
	 	<c:if test="${user.emailAddressVerified}"><i title="Verified Email"  class="fa fa-check-circle"></i></c:if>
	 </div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Screen Name:</label>&nbsp;<c:out value="${user.screenName}"></c:out></div>
	 <div class="col-md-4 col-sm-4 col-xs-4">
	 	<c:choose>
	 		<c:when test="${user.admin}"><i class="fa fa-gears"></i>&nbsp;Admin</c:when>
	 		<c:otherwise><i class="fa fa-check-circle-o"></i>&nbsp;User</c:otherwise>
	 	</c:choose> 	
	 </div>		
	</div>
	<div class="row" >
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>First&nbsp;Name:</label>&nbsp;<c:out value="${user.firstName}"></c:out></div>
	 <div class="col-md-4 col-sm-4 col-xs-4" ><label>Middle&nbsp;Name:</label>&nbsp;<c:out value="${user.middleName}"></c:out></div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Last&nbsp;Name:</label>&nbsp;<c:out value="${user.lastName}" ></c:out></div>
	</div>
	<div class="row" >
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Created:</label>&nbsp;<fmt:formatDate value="${user.created}" pattern="dd-MM-yyyy hh:mm:ss a"  /></div>
	 <div class="col-md-4 col-sm-4 col-xs-4" ><label>Last&nbsp;Modified:</label>&nbsp;<fmt:formatDate value="${user.lastUpdated}" pattern="dd-MM-yyyy hh:mm:ss a"  /></div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Facebook:</label>&nbsp;<a href="http://facebook.com/${user.facebookId}"><c:out value="${user.facebookId}"></c:out></a></div> 		
	</div>
	<div class="row" >
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Login:</label>&nbsp;<fmt:formatDate value="${user.loginDate}" pattern="dd-MM-yyyy hh:mm:ss a"  /></div>
	 <div class="col-md-4 col-sm-4 col-xs-4" ><label>Login&nbsp;IP:</label>&nbsp;<c:out value="${user.loginIP}" /></div>
	<div class="col-md-4 col-sm-4 col-xs-4"><label>Failed&nbsp;Login:</label>&nbsp;<fmt:formatDate value="${user.lastFailedLoginDate}" pattern="dd-MM-yyyy hh:mm:ss a" /><small><c:out value="${user.failedLoginAttempts}"></c:out></small></div> 		
	</div>
	<div class="row" >
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Gender:</label>&nbsp;<c:out value="${user.gender}" /></div>
	 <div class="col-md-4 col-sm-4 col-xs-4" ><label>Contact:</label>&nbsp;<c:out value="${user.contactNo}" /></div>
	<div class="col-md-4 col-sm-4 col-xs-4"><label>Mobile:</label>&nbsp;<c:out value="${user.mobileNo}" /></div> 		
	</div>
	<div class="row" >
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Birthday:</label>&nbsp;<fmt:formatDate value="${user.dob}" pattern="dd-MM-yyyy" /></div>	
	</div>
	<c:if test="${user.city!=null || user.country!=null}" > 
	<div class="row well" >
	 <div class="col-md-12 col-sm-12 col-xs-12">
	 <address>
	 	<strong><c:out value="${user.city}"></c:out> </strong>
	 	<c:out value="${user.country}"></c:out>
	 </address>
	 </div>
	</div>
	</c:if>
	<%-- URLS and action buttions --%>
	<s:url action="userChangeStatus" namespace="/cpanel" var="userActivate" encode="true" forceAddSchemeHostAndPort="true"  >
		<s:param name="user.id" >${user.id}</s:param>
		<s:param name="user.active" >true</s:param>
	</s:url>
	<s:url action="userChangeStatus" namespace="/cpanel" var="userDeactivate" encode="true" forceAddSchemeHostAndPort="true"  >
		<s:param name="user.id" >${user.id}</s:param>
		<s:param name="user.active" >false</s:param>
	</s:url>
	<s:url action="userAssignRoleForm" namespace="/cpanel" var="assignRoleForm" encode="true" forceAddSchemeHostAndPort="true"  >
		<s:param name="user.id" >${user.id}</s:param>
	</s:url>
	<s:url action="userAssignGroupForm" namespace="/cpanel" var="assignGroupForm" encode="true" forceAddSchemeHostAndPort="true" >
		<s:param name="user.id" >${user.id}</s:param>
	</s:url>
	<s:url action="userResetPasswordForm" namespace="/cpanel" var="userResetPasswordForm" encode="true" forceAddSchemeHostAndPort="true" >
		<s:param name="userId" >${user.id}</s:param>
	</s:url>
	<div class="row well">
	<div class="col-md-3 col-sm-3 col-xs-3">
	<c:choose>
		<c:when test="${user.active}">
		<a href="${userDeactivate}" class="btn btn-danger active" role="button">Deactivate</a>
		</c:when>
		<c:otherwise>
		<a href="${userActivate}" class="btn btn-success active" role="button">Activate</a>
		</c:otherwise>
	</c:choose>
	</div>
	<c:if test="${!user.admin}">
	<div class="col-md-3 col-sm-3 col-xs-3" ><a href="${assignRoleForm}" class="btn btn-primary active" role="button">Assign Roles</a></div>
	</c:if>	
	<div class="col-md-3 col-sm-3 col-xs-3"><a onclick="assignPermissionModel()" class="btn btn-primary active" role="button">Assign Group</a></div> 
	<div class="col-md-3 col-sm-3 col-xs-3"><a href="${userResetPasswordForm}" class="btn btn-primary active" role="button">Reset Password</a></div>
	</div>
	
	<!-- my modal -->
	<div class="modal fade" id="assignPermissionModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" id="modal-content">
	    <!-- Render model -->
	    </div>
	  </div>
	</div>
	<!-- my modal end -->
<script type="text/javascript" >
/* script to create model */
function assignPermissionModel(){
	$("#modal-content").html('<p class="bg-success" style="padding: 10px;">Please wait loading form..</p>');		
	$('#assignPermissionModel').modal('show');
	$.ajax({
		  url: "${assignGroupForm}",
		  success:function(htmlPage){
			  $('#modal-content').html(htmlPage);
			  }
		});
	return false;
}
</script>
</c:if>
 </section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>