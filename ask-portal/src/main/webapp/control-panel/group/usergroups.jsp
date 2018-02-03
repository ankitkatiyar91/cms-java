<%@include file="../header-includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp">
	<jsp:param value="true" name="jtable"/>
</jsp:include>
<s:url var="userGroupList" action="userGroupList" namespace="/cpanel" ></s:url>
<s:url var="userGroupAdd" action="userGroupAdd" namespace="/cpanel" ></s:url>
<s:url var="userGroupUpdate" action="userGroupUpdate" namespace="/cpanel" ></s:url>
<s:url var="userGroupDetail" action="userGroupDetail" namespace="/cpanel" ></s:url>
<s:url var="userGroupDelete" action="userGroupDelete" namespace="/cpanel" ></s:url>
<script type="text/javascript">
$(document).ready(function () {

    //Prepare jTable
	$('#usergroup-container').jtable({
		title: 'User Groups',
		paging:true,
		hoverAnimation:true,
		actions: {
			listAction: '${userGroupList}',
			createAction: '${userGroupAdd}',
			updateAction: '${userGroupUpdate}',
			deleteAction: '${userGroupDelete}'
		},
		fields: {
			userGroupId: {
				key: true,
				create: false,
				edit: false,
				list: true,
				title:'Group Id'
			},
			userGroupName: {
				title: 'Group Name'
			},
			createdBy:{
				create: false,
				edit: false,
				title: 'Owner'
			},
			userGroupComments:{
				title: 'Comments',
				edit:true
			},
			assignPermission:{
				title:'Details',
				create:false,
				edit:false,
				display: function(data) {
					return  '<a href="${userGroupDetail}?group.id='+data.record.userGroupId+'" ><i class="fa fa-fw fa-external-link-square assignPermissionModel" ></i></a>';
                      }
			}
		}
	});

	//Load role list from action
	$('#usergroup-container').jtable('load');

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
            User Groups <small>All</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">User Groups</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
<!-- your content goes hear -->
<div id="usergroup-container"  class="table-responsive"></div>
                </section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>