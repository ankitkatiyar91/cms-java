<%@include file="../header-includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp"></jsp:include>

<s:url action="categoryList" var="categoryList"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true"></s:url>
<s:url action="categoryDetails" var="categoryDetails"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true"></s:url>
<s:url action="categoryMoveUp" var="categoryMoveUp"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true"></s:url>
<s:url action="categoryMoveDown" var="categoryMoveDown"  namespace="/cpanel" encode="true" forceAddSchemeHostAndPort="true"></s:url>
<script type="text/javascript">
$(document).ready(function () {
	list();
	$("#menu").change(function(){
		list();
		});
});
var tableFields={id:{title:'Id'},label:{title:'Label'},created:{title:'Created'},lastUpdated:{title:'Updated'},status:{title:'Status'}};
function list(){
	$.ajax({
	url:'${categoryList}',
	dataType:'json',
	data:{
		menuId:$("#menu").val()
	},
	beforeSend:function(){
		$("#category-container").html('<p cclass="bg-info" style="padding: 10px;">Loading...</p>');
	},
	error:function(){
		$("#category-container").html('<p cclass="bg-danger" style="padding: 10px;">Unable to process</p>');
	},
	success:function(data){
		if(data.RESULT=='ERROR'){
			$("#category-container").html('<p class="bg-danger" style="padding: 10px;">Unable to process</p>');
		}else{
			if(data.list.length==0){
				$("#category-container").html('<p class="bg-danger" style="padding: 10px;">No record available</p>');
			}else{
				createMenuTable("#category-container",tableFields,data.list);
			}			
			
		}
	}
	});
}
function createMenuTable(divID,fields,json){
	$str="";
	//alert("divID->"+divID);
	$(divID).html('');
	//starting table
	//reading fields and generating header string
	$.each(fields, function(key,value){
			$str+="<th>"+value.title+"</th>";
		});
		$str+="<th>Details</th>";
		if(json.length>1){
			$str+="<th>Order</th>";
		}
		var $table = $('<table class="table table-bordered table-hover" width="100%" border="0" cellspacing="0" cellpadding="0" >');
		// thead
		$table.append('<thead>').children('thead')
		.append('<tr />').children('tr').append($str);
		//tbody
		var $tbody = $table.append('<tbody />').children('tbody');
		
		// add row
		var $row;
		$.each(json, function(key,value){
			$row=$tbody.append('<tr />').children('tr:last');
				//loop to generate columns for one row with cssClass
				$.each(fields, function(fieldsKey,fieldsValue){
					$row.append('<td />').children('td:last')
					.append(value[fieldsKey])
					.addClass(fieldsValue.cssClass);
				});	
				$row.append('<td />').children('td:last')
				.append('<a href=${categoryDetails}?category.id='+value['id']+' ><i class="fa fa-fw fa-external-link-square" ></i></a>');
				/* up down links */				
				$links='';
				if(key!=0){
					$links+='<i class="fa fa-fw fa-caret-square-o-up" onclick="moveUp('+value['id']+');" ></i>';
				}
				if(key!=json.length-1){
					$links+='<i class="fa fa-fw fa-caret-square-o-down" onclick="moveDown('+value['id']+');"></i>';
				}
				if($links!=''){
				$row.append('<td />').children('td:last')
				.append($links);
				}
				/* add class*/
				if(value['status']=="PUBLISHED"){
					$row.addClass('active');
				}		
		});
		$table.appendTo(divID);
}

function moveUp(id){
$.ajax({
	url:'${categoryMoveUp}',
	dataType:'json',
	data:{
		categoryId:id
	},
	beforeSend:function(){
	},
	error:function(){
		alert("Unable to process");
	},
	success:function(data){
		list();
	}
});
}
function moveDown(id){
$.ajax({
	url:'${categoryMoveDown}',
	dataType:'json',
	data:{
		categoryId:id
	},
	beforeSend:function(){
	},
	error:function(){
		alert("Unable to process");
	},
	success:function(data){
		list();
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
      Category
<small>List</small>
</h1>
<ol class="breadcrumb">
   <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
   <li class="active">Category</li>
</ol>
</section>

<!-- Main content -->
<section class="content">
<%-- your content goes hear --%>
<s:select list="%{menus}" listKey="id" id="menu" listValue="label" label="Menu" name="menu" theme="portal" cssErrorClass="has-error"  ></s:select>
<div id="category-container"  class="table-responsive" ></div>
</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>