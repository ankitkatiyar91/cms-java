<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="../header-includes.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp">
	<jsp:param value="true" name="jtable"/>
</jsp:include>
<s:url action="listUsers" var="listUsers" namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true" ></s:url>
<s:url action="userDetail" var="userDetail"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true"></s:url>
<script type="text/javascript">

		$(document).ready(function () {

		    //Prepare jTable
			$('#users-container').jtable({
				title: 'Table of Users',
				paging:true,
				hoverAnimation:true,
				actions: {
					listAction: '${listUsers}'
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
							return  '<a href="${userDetail}?userId='+data.record.id+'" ><i class="fa fa-fw fa-external-link-square assignPermissionModel" ></i></a>';
                        }
					}
				}
			});

			//Load person list from server
			$('#users-container').jtable('load');

			<%-- Search Script --%>
			$("#search").click(function(){
				$('#users-container').jtable('load',{
					searchQuery:$("#searchQuery").val(),
				});
			});
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
            Users
            <small>All</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
<!-- your content goes hear -->
<div class="row well" >
<form class="form-inline" role="form">
  <div class="form-group">
    <label class="sr-only" for="searchQuery">Search</label>
    <input size="30" type="text" class="form-control" id="searchQuery" placeholder="Enter your query">
  </div>
  <button type="button" id="search" class="btn btn-default">Search</button>
</form>
</div>
<div id="users-container"  class="table-responsive" ></div>
</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>