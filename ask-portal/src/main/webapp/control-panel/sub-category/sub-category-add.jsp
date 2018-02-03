<%@include file="../header-includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp"></jsp:include>

<s:url action="categoryList" var="categoryList"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true"></s:url>


<script type="text/javascript">
$(document).ready(function () {
	$("#menu").change(function(){
		loadCategories();
	});
});
function loadCategories(){
	$.ajax({
	url:'${categoryList}',
	dataType:'json',
	data:{
		menuId:$("#menu").val()
	},
	beforeSend:function(){
		$("#category-error").html('<p class="bg-info" style="padding: 10px;">Loading Categories...</p>');
	},
	error:function(){
		$("#category-error").html('<p class="bg-danger" style="padding: 10px;">Unable to load Categories</p>');
	},
	success:function(data){
		if(data.RESULT=='ERROR'){
			$("#category-error").html('<p class="bg-danger" style="padding: 10px;">Unable to load Categories</p>');
			$sel=$("#category");
			$sel.html(new Option('Select','-1'));
		}else{
			if(data.list.length==0){
				$("#category-error").html('<p class="bg-danger" style="padding: 10px;">No Category available selected some other Menu</p>');
				$sel=$("#category");
				$sel.html(new Option('Select','-1'));
			}else{
				$sel=$("#category");
				$sel.html(new Option('Select','-1'));
				$.each(data.list, function(key,value){
					$sel.append(new Option(value.label,value.id));
				});
				$("#category-error").html('');
			}			
			
		}
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
    Sub Category
    <small>Add New</small>
</h1>
<ol class="breadcrumb">
    <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
 	<li><a href="${subCategories}"><i class="fa fa-dashboard"></i>Sub Category</a></li>
    <li class="active">Add New</li>
</ol>
</section>
<!-- Main content -->
<section class="content">
<!-- your content goes hear -->
<s:actionerror/>
<s:actionmessage/>
<s:form action="subCategoryAddNew" name="sub-category-add-from" method="post" namespace="/cpanel" role="form" >
<s:textfield theme="portal" name="subCategory.label" label="Sub Category" required="required" cssErrorClass="has-error" placeholder="Enter text to display"  title="Enter text to display" ></s:textfield>
<s:select list="%{menus}" emptyOption="true" listKey="id" listValue="label" label="Parent Menu" id="menu" theme="portal" cssErrorClass="has-error"  ></s:select>
<div class="form-group">
	<label for="category" class="control-label">Parent&nbsp;Category:&nbsp;</label>
	<select	id="category" name="subCategory.category.id"></select>
	<div id="category-error" ></div>
</div>
<s:submit value="Add" cssClass="btn btn-primary"></s:submit>
</s:form>
</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>