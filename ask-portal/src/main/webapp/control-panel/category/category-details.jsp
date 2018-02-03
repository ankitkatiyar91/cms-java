<%@include file="../header-includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp"></jsp:include>

<s:url action="categoryUpdate" var="categoryUpdate"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true">
	<s:param name="category.id" value="%{category.id}" ></s:param>
</s:url>

<script type="text/javascript">
$(document).ready(function(){
	$("#editButton").click(function(){
		$("#editButton").hide();
		$("#editForm").delay(100).show('clip');
		});

	$("#saveButton").click(function(){
		$.ajax({
			url:'${categoryUpdate}',
			dataType:'json',
			data:{
				"category.label":$("#label").val()
			},
			beforeSend:function(){
				$("#editButton").text('Saving...');
			},
			error:function(){
				$("#editButton").text('Unable to process retry');
			},
			success:function(data){
				console.log('data-'+data);
				$("#editForm").hide('fast');
				if(data.RESULT=='ERROR'){
					$("#editButton").text(data.MESSAGE);
					$("#editButton").delay(10).show();
				}else{
					$("#categoryUpdated").text(data.category.lastUpdated);
					$("#categoryLabel").text(data.category.label);
					$("#editButton").text('Saved');
					$("#editButton").delay(10).show();
					$("#editButton").delay(10).text('Edit');
				}
			}
		});
		//$("#editButton").hide('clip',100000);
		
	});
});
</script>

</head>
<s:url action="categoryUpdateStatus" var="categoryPublish"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true">
	<s:param name="category.id" value="%{category.id}" ></s:param>
	<s:param name="category.status" value="%{'PUBLISHED'}" ></s:param>
</s:url>
<s:url action="categoryUpdateStatus" var="categorySave"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true">
	<s:param name="category.id" value="%{category.id}" ></s:param>
	<s:param name="category.status" value="%{'SAVE'}" ></s:param>
</s:url>
<s:url action="menuViewDetails" var="menuViewDetails"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true"></s:url>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="wrapper row-offcanvas row-offcanvas-left">
<jsp:include page="../menu.jsp"></jsp:include>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">                
    <!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Category
		<small>Details</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${categories}"><i class="fa fa-dashboard"></i>Category</a></li>
		<li class="active">Details</li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
<!-- your content goes hear -->
<s:actionerror/>
<s:actionmessage/>
<c:if test="${category.label!=null}" >
<div class="row well" >
<div>
	<div class="col-md-4 col-sm-4 col-xs-4"><label>Id:</label>&nbsp;#<c:out value="${category.id}"></c:out></div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Label:</label>&nbsp;<span id="categoryLabel"><c:out value="${category.label}"></c:out></span></div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Created On:</label>&nbsp;<fmt:formatDate value="${category.created}"  pattern="dd-MM-yyyy hh:mm:ss a"/> </div>
</div>
<div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Status:</label>&nbsp;<c:out value="${category.status}"></c:out></div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Updated On:</label>&nbsp;<span id="categoryUpdated"><fmt:formatDate value="${category.lastUpdated}" pattern="dd-MM-yyyy hh:mm:ss a"/></span></div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Menu:</label>&nbsp;<a class="btn-link" href="${menuViewDetails}?menu.id=${category.menu.id}"><c:out value="${category.menu.label}"></c:out> </a></div>
</div>
</div>
<div class="row well" >
	<div class="col-md-4 col-sm-4 col-xs-4">
		<c:choose>
			<c:when test="${category.status=='SAVE'}"><a href="${categoryPublish}" class="btn btn-success active" role="button">Publish</a></c:when>
			<c:otherwise><a href="${categorySave}" class="btn btn-danger active" role="button">Un-Publish</a></c:otherwise>
		</c:choose>
	</div>
	<div class="col-md-8 col-sm-8 col-xs-8">
	<div class="form-inline" role="form" id="editForm" style="display:none;float: left;" >
	  <div class="form-group">
	    <label class="sr-only" for="label">Label</label>
	    <input type="text" title="Enter new Label" value="${category.label}" class="form-control" id="label" placeholder="Enter new Label">
	  </div>
	  <button id="saveButton" class="btn btn-default">Save</button>
	</div>
	<div style="float: left;">
	<button class="btn btn-success active" id="editButton" >Edit</button>
	</div>
	</div>
</div>

<div class="row well" >
	<div class="col-md-4 col-sm-4 col-xs-4">
		<button type="button" id="articleLink" data-target="#articleLinkModal" data-toggle="modal" class="btn btn-primary">Link Article</button>
	</div>
	<s:url var="articleContent" action="articleContent" namespace="/cpanel" forceAddSchemeHostAndPort="true" >
		<s:param name="articleId" value="%{category.article.articleId}" ></s:param>
	</s:url>
	<div class="col-md-4 col-sm-4 col-xs-4"><label>Current Article:</label>&nbsp;<a href="<c:out value="${articleContent}"></c:out>"><c:out value="${category.article.title}"></c:out> </a></div>	
<!-- Modal -->
<div class="modal fade" id="articleLinkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <%-- Render model --%>
      <s:url forceAddSchemeHostAndPort="true" action="categoryLinkArticle" var="mlurl" namespace="/cpanel" ></s:url>
      <jsp:include page="../article/link-article.jsp">
      	<jsp:param value="${mlurl}" name="url"/>
      	<jsp:param value="articleId" name="articleIdName"/>
     	<jsp:param value="${category.id}" name="passId"/>
     	<jsp:param value="categoryId" name="passIdName"/>
     	<jsp:param value="Category ${category.label}" name="message"/>
      </jsp:include>
    </div>
  </div>
</div>
<!-- Modal End -->
</div>


</c:if>
</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>