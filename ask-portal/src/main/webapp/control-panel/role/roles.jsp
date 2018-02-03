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
<s:url action="listRoles" var="listRoles" ></s:url>
<s:url action="addRole" var="addRole" ></s:url>
<s:url action="updateRole" var="updateRole" ></s:url>
<s:url action="deleteRole" var="deleteRole" ></s:url>
<s:url action="showRoleAssignPermission" var="showRoleAssignPermission" ></s:url>
<script type="text/javascript">

		$(document).ready(function () {

		    //Prepare jTable
			$('#roles-container').jtable({
				title: 'Roles',
				paging:true,
				useBootstrap: true,
				hoverAnimation:true,
				actions: {
					listAction: '${listRoles}',
					createAction: '${addRole}',
					updateAction: '${updateRole}',
					deleteAction: '${deleteRole}'
				},
				fields: {
					roleId: {
						key: true,
						create: false,
						edit: false,
						list: true,
						title:'Role Id'
					},
					roleName: {
						title: 'Role Name',
						width: '40%'
					},
					roleModifiable: {
						title: 'Modifiable',
						width: '20%',
						options: [{ Value: true, DisplayText: "True" },{ Value:false, DisplayText: "False" }]
					},
					createdBy:{
						create: false,
						edit: false,
						title: 'Owner',
						width: '40%',
					},
					assignPermission:{
						title:'Permissions',
						edit:false,
						create:false,
						display: function(data) {
							return  '<i class="fa fa-fw fa-external-link-square assignPermissionModel" onclick="return assignPermissionModel('+data.record.roleId+')" ></i>';
                        }
					}
				}
			});

			//Load role list from action
			$('#roles-container').jtable('load');

		});

		/* script to create model */
		function assignPermissionModel(id){
			$("#modal-content").html('<p class="bg-success" style="padding: 10px;">Please wait loading form..</p>');		
			$('#assignPermissionModel').modal('show');
			$.ajax({
				  url: "${showRoleAssignPermission}?roleId="+id,
				  success:function(htmlPage){
					  $('#modal-content').html(htmlPage);
					  }
				});			
		}
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
						Roles <small>All</small>
					</h1>
					<ol class="breadcrumb">
                        <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
				<!-- your content goes hear -->
				<div id="roles-container"  class="table-responsive"></div>
				
				<!-- my modal -->
				<div class="modal fade" id="assignPermissionModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content" id="modal-content">
				    <%-- Render model --%>
				    </div>
				  </div>
				</div>
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>