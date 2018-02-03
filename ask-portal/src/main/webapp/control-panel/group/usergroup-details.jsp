<%@include file="../header-includes.jsp" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<jsp:include page="../head.jsp">
<jsp:param value="true" name="jtable"/>
</jsp:include>
<s:url action="userGroupDetail_ListUsers" var="userGroupDetail_ListUsers" forceAddSchemeHostAndPort="true" namespace="/cpanel" >
<s:param name="group.id" value="%{group.id}" ></s:param>
</s:url>
<s:url action="userGroupDetail_ListRoles" var="userGroupDetail_ListRoles" forceAddSchemeHostAndPort="true" namespace="/cpanel" >
<s:param name="group.id" value="%{group.id}" ></s:param>
</s:url>
<s:url action="userDetail" var="userDetail" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>

<s:url action="userGroupDetail_AddRole" var="userGroupDetail_AddRole" forceAddSchemeHostAndPort="true" namespace="/cpanel" >
<s:param name="group.id" value="%{group.id}" ></s:param>
</s:url>
<s:url action="userGroupDetail_RemoveRole" var="userGroupDetail_RemoveRole" forceAddSchemeHostAndPort="true" namespace="/cpanel" >
<s:param name="group.id" value="%{group.id}" ></s:param>
</s:url>

<script type="text/javascript">
$(document).ready(function () {

    //Prepare jTable
	$('#usergroup-users').jtable({
		title: 'Users',
		paging:true,
		hoverAnimation:true,
		actions: {
			listAction: '${userGroupDetail_ListUsers}'
		},
		fields: {
			id: {
				title:'Id',
				key: true,
				create: false,
				edit: false,
				list: true
			},
			firstName: {
				title: 'First Name',
			},
			lastName: {
				title: 'Last Name',
			},
			email: {
				title: 'Email',
				edit: false,
			},
			created: {
				title: 'Created',
				edit: false,
				create:false
			},
			details:{
				title:'Details',
				width:'1%',
				display: function(data) {
					return  '<a href="${userDetail}?userId='+data.record.id+'" ><i class="fa fa-fw fa-external-link-square" ></i></a>';
                }
			}
		}
	});
	$('#usergroup-roles').jtable({
		title: 'Roles',
		paging:true,
		hoverAnimation:true,
		messages:{
			deleteConfirmation:'This Role will be removed from this group'
		},
		actions: {
			listAction: '${userGroupDetail_ListRoles}',
			createAction: '${userGroupDetail_AddRole}',
		},
		fields: {
			roleId: {
				create: false,
				edit: false,
				list: true,
				title:'Role Id'
			},
			roleName: {
				title: 'Role Name',
				create: false,
				width: '40%'
			},
			assignRoleId:{
				key: true,
				title:'Role',
				list:false,
				create: true,
				options:'<s:url action="roleOptions" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>'
			}
		}
	});

	//Load role list from action
	$('#usergroup-users').jtable('load');
	$('#usergroup-roles').jtable('load');
});
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
     User Groups Details<small>#<c:out value="${group.id}"></c:out></small>
</h1>
 <ol class="breadcrumb">
     <li><a href="${home}"><i class="fa fa-dashboard"></i>Home</a></li>
     <li><a href="${userGroups}"><i class="fa fa-dashboard"></i>User Groups</a></li>
     <li class="active">Details</li>
 </ol>
</section>

      <!-- Main content -->
      <section class="content">
<!-- your content goes hear -->
<s:actionerror/>
<s:actionmessage/>
<%-- check if group object is not null  --%>
<c:choose>
<c:when test="${group!=null}">
<%--basic details --%>
	<div class="well">
	<div class="row" >
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Name:</label>&nbsp;<c:out value="${group.name}"></c:out></div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Created By:</label>&nbsp;<c:out value="${group.createdBy.screenName}"></c:out></div>	
	</div>
	<c:if test="${group.comments!=null}">
	<div class="row" >
	 <div class="col-md-6 col-sm-6 col-xs-6"><label>Comments:</label>&nbsp;<c:out value="${group.comments}"></c:out></div>	
	</div>
	</c:if>
	</div>
<%-- roles --%>
<div id="usergroup-users" ></div>
<div class="margin" ></div>
<div id="usergroup-roles" ></div>
<%-- users --%>	
</c:when>
<c:otherwise>
<p class="text-danger">Unable to fetch details</p>
</c:otherwise>
	 	</c:choose> 
</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>