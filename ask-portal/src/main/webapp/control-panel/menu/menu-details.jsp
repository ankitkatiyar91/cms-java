<%@page import="com.ankit.portal.support.StatusType"%>
<%@include file="../header-includes.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp"></jsp:include>
<s:url action="menuUpdateStatus" var="menuPublish"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true">
	<s:param name="menu.id" value="%{menu.id}" ></s:param>
	<s:param name="menu.status" value="%{'PUBLISHED'}" ></s:param>
</s:url>
<s:url action="menuUpdateStatus" var="menuSave"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true">
	<s:param name="menu.id" value="%{menu.id}" ></s:param>
	<s:param name="menu.status" value="%{'SAVE'}" ></s:param>
</s:url>
<s:url action="menuUpdate" var="menuUpdate"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true">
	<s:param name="menu.id" value="%{menu.id}" ></s:param>
</s:url>

<script type="text/javascript">
$(document).ready(function(){
	$("#editButton").click(function(){
		$("#editButton").hide();
		$("#editForm").delay(100).show('clip');
		});

	$("#saveButton").click(function(){
		$.ajax({
			url:'${menuUpdate}',
			dataType:'json',
			data:{
				"menu.label":$("#label").val()
			},
			beforeSend:function(){
				$("#editButton").text('Saving...');
			},
			error:function(){
				$("#editButton").text('Unable to process retry');
			},
			success:function(data){
				$("#editForm").hide('fast');
				if(data.RESULT=='ERROR'){
					$("#editButton").html('Unable to process retry');
				}else{
					$("#menuUpdated").text(data.menu.lastUpdated);
					$("#menuLabel").text(data.menu.label);
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
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="wrapper row-offcanvas row-offcanvas-left">
<jsp:include page="../menu.jsp"></jsp:include>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">                
    <!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
       Menu
        <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${home}"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a href="${menus}"><i class="fa fa-fw fa-list"></i>Menu</a></li>
        <li class="active">Details</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
<!-- your content goes hear -->
<s:actionerror/>
<s:actionmessage/>
<c:if test="${menu.label!=null}" >
<div class="row well" >
<div>
	<div class="col-md-4 col-sm-4 col-xs-4"><label>Id:</label>&nbsp;#<c:out value="${menu.id}"></c:out></div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Label:</label>&nbsp;<span id="menuLabel" ><c:out value="${menu.label}"></c:out></span></div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Created On:</label>&nbsp;<fmt:formatDate value="${menu.created}"  pattern="dd-MM-yyyy hh:mm:ss a"/> </div>
</div>
<div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Status:</label>&nbsp;<c:out value="${menu.status}"></c:out></div>
	 <div class="col-md-4 col-sm-4 col-xs-4"><label>Updated On:</label>&nbsp;<span id="menuUpdated" ><fmt:formatDate value="${menu.lastUpdated}" pattern="dd-MM-yyyy hh:mm:ss a"/></span></div>
</div>
</div>
<div class="row well" >
	<div class="col-md-4 col-sm-4 col-xs-4">
		<c:choose>
			<c:when test="${menu.status=='SAVE'}"><a href="${menuPublish}" class="btn btn-success active" role="button">Publish</a></c:when>
			<c:otherwise><a href="${menuSave}" class="btn btn-danger active" role="button">Un-Publish</a></c:otherwise>
		</c:choose>
	</div>
	<div class="col-md-8 col-sm-8 col-xs-8">
	<div class="form-inline" role="form" id="editForm" style="display:none;float: left;" >
	  <div class="form-group">
	    <label class="sr-only" for="label">Label</label>
	    <input type="email" title="Enter new Label" value="${menu.label}" class="form-control" id="label" placeholder="Enter new Label">
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
		<s:param name="articleId" value="%{menu.content.articleId}" ></s:param>
	</s:url>
	<div class="col-md-4 col-sm-4 col-xs-4"><label>Current Article:</label>&nbsp;<a href="<c:out value="${articleContent}"></c:out>"><c:out value="${menu.content.title}"></c:out> </a></div>
	
<!-- Modal -->
<div class="modal fade" id="articleLinkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
     <%-- Render model --%>
      <s:url forceAddSchemeHostAndPort="true" action="menuLinkArticle" var="mlurl" namespace="/cpanel" ></s:url>
      <jsp:include page="../article/link-article.jsp">
      	<jsp:param value="${mlurl}" name="url"/>
      	<jsp:param value="articleId" name="articleIdName"/>
     	<jsp:param value="${menu.id}" name="passId"/>
     	<jsp:param value="menuId" name="passIdName"/>
     	<jsp:param value="Menu ${menu.label}" name="message"/>
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