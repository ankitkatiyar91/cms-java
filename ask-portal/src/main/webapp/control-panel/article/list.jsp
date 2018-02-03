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
<s:url var="articleList" action="articleList" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<s:url var="articleContent" action="articleContent" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<s:url var="articles" action="articles" namespace="/cpanel" forceAddSchemeHostAndPort="true" includeContext="true" ></s:url>

<script type="text/javascript">
$(document).ready(function () {

    //Prepare jTable
	$('#article-container').jtable({
		title: 'Articles',
		paging:true,
		hoverAnimation:true,
		actions: {
			listAction: '${articleList}'
		},
		fields: {
			
			articleId: {
				list:true,
				title:'#'
			},
			uuid: {
				key: true,
				create: false,
				edit: false,
				list: true,
				title:'UUID',
				display: function(data) {
					return  '<a href="?uuid='+data.record.uuid+'" >'+data.record.uuid+'</i></a>';
                      }
			},
			title: {
				title: 'Title'
			},
			createdBy:{
				title: 'Created By'
			},
			lastModified:{
				title: 'Modified'
			},
			status:{
				title: 'Status',
			},
			details:{
				title:'Details',
				create:false,
				edit:false,
				display: function(data) {
					return  '<a href="${articleContent}?articleId='+data.record.articleId+'" ><i class="fa fa-fw fa-external-link-square assignPermissionModel" ></i></a>';
                      }
			}
		}
	});

	//Load role list from action
	$('#article-container').jtable('load',{
		<%if (request.getParameter("uuid") != null) {%>
		uuid:'<%=request.getParameter("uuid")%>'
			<%}%>
			});

	<%-- Search Script --%>
	$("#search").click(function(){
		$('#article-container').jtable('load',{
			searchQuery:$("#searchQuery").val(),
		});
	});

	$("#statusFilter").change(function(){
			$('#article-container').jtable('load',{
				searchQuery:$("#searchQuery").val(),
				status:$("#statusFilter").val()
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
      Article
<small>All</small>
</h1>
<ol class="breadcrumb">
   <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
   <li class="active"><a href="${articles}">Article</a></li>
</ol>
</section>

<!-- Main content -->
<section class="content">
<%-- your content goes hear --%>
<div class="row well" >
	<form class="form-inline" role="form">
  <div class="form-group">
    <label class="sr-only" for="searchQuery">Search</label>
    <input size="30" type="text" class="form-control" id="searchQuery" placeholder="Enter your query">
  </div>
  <button type="button" id="search" class="btn btn-default">Search</button>
  
  <div class="form-group">
    <select id="statusFilter" class="form-control" title="Select to chnage status filter" name="status" >
    	<option value="" >&nbsp;</option>
    	<option value="0" >Saved</option>
    	<option value="1" >Published</option>    	
    </select>
  </div>
</form>
</div>
<div id="article-container" class="table-responsive" ></div>
</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>