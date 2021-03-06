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
<section class="content-header">
<h1>
    Category
    <small>Add New</small>
</h1>
<ol class="breadcrumb">
    <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
 	<li><a href="${categories}"><i class="fa fa-dashboard"></i>Category</a></li>
    <li class="active">Add New</li>
</ol>
</section>
<!-- Main content -->
<section class="content">
<!-- your content goes hear -->
<s:actionerror/>
<s:actionmessage/>
<s:form action="categoryAddNew" name="category-add-from" method="post" namespace="/cpanel" role="form" >
<s:textfield theme="portal" name="category.label" label="Category" required="required" cssErrorClass="has-error" placeholder="Enter text to display"  title="Enter text to display" ></s:textfield>
<s:select list="%{menus}" listKey="id" listValue="label" label="Parent Menu" name="category.menu.id" theme="portal" cssErrorClass="has-error"  ></s:select>
<s:submit value="Add" cssClass="btn btn-primary"></s:submit>
</s:form>
</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>