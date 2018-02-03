<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../header-includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp">
	<jsp:param value="true" name="ckeditor"/>
</jsp:include>

<s:url action="articleSave" var="articleSave" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>

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
<small>Content</small>
</h1>
<ol class="breadcrumb">
   <li><a href="${home}"><i class="fa fa-dashboard"></i>Home</a></li>
   <li><a href="${articles}"><i class="fa fa-Laptop"></i>Articles</a></li>
   <li class="active">Content</li>
</ol>
</section>

<!-- Main content -->
<section class="content">
<%-- your content goes hear --%>
<s:actionmessage/>
<s:actionerror/>

<div id="notification"><p class="bg-success" style="padding: 10px;">Last Modified <fmt:formatDate value="${article.lastUpdated}"  pattern="dd-MM-yyyy hh:mm:ss a"/></p></div>

<div class="form-group">
<label for="autoSave" class="control-label">Auto Save:</label>
    <input type="checkbox" name="autoSave" id="autoSave" >
</div>
<c:if test="${article!=null}" >
<div class="row well" >
	<div class="col-md-4 col-sm-4 col-xs-4"><label>Id:</label>&nbsp;<span id="idShow" >#<c:out value="${article.articleId}"></c:out></span></div>
	<div class="col-md-4 col-sm-4 col-xs-4"><label>UUID:</label>&nbsp;<a title="See latest available version" href="?uuid=${article.uuid}"><c:out value="${article.uuid}"></c:out></a></div>
	<div class="col-md-4 col-sm-4 col-xs-4"><label>Created On:</label>&nbsp;<fmt:formatDate value="${article.createdOn}"  pattern="dd-MM-yyyy hh:mm:ss a"/> </div>
</div>
<div class="row well" >
	<c:if test="${article.status=='SAVE'}" >
		<s:url action="articlePublish" var="publish" namespace="/cpanel" forceAddSchemeHostAndPort="true" >
			<s:param name="articleId" value="%{article.articleId}"></s:param>
		</s:url>
		<div class="col-md-2 col-sm-2 col-xs-2"><a href="${publish}" onclick="return confirm('Make sure you saved all changes?')" class="btn btn-success active" role="button" >PUBLISH</a></div>
	</c:if>
	<s:url var="preview" action="preview" namespace="/" forceAddSchemeHostAndPort="true" >
		<s:param name="id" value="%{article.articleId}" ></s:param>
	</s:url>
	<div class="col-md-2 col-sm-2 col-xs-2"><a class="btn btn-warning active" href="${preview}" role="button" target="_blank" title="Preview this article.(Opened in new tab)" >Preview</a></div>
	<s:url action="articleDelete" var="delete" namespace="/cpanel" forceAddSchemeHostAndPort="true" >
		<s:param name="articleId" value="%{article.articleId}"></s:param>
	</s:url>
	<s:url action="articles" var="history" namespace="/cpanel" forceAddSchemeHostAndPort="true" >
		<s:param name="uuid" value="%{article.uuid}"></s:param>
	</s:url>
		<%-- <div class="col-md-2 col-sm-2 col-xs-2"><a href="${delete}" onclick="return confirm('Make sure you saved all changes?')" class="btn btn-danger active" role="button"  >DELETE</a></div> --%>
		<div class="col-md-2 col-sm-2 col-xs-2"><a class="btn btn-success active" href="${history}" role="button"  >History</a></div>
</div>
</c:if>


<s:form action="articleSave" ethod="post" role="form" >
<s:hidden id="articleId" name="articleId" value="%{article.articleId}" ></s:hidden>
<s:textfield value="%{article.title}" theme="portal" id="title" name="title" label="Title" required="required" cssErrorClass="has-error" placeholder="Enter title"  title="Title will be used at place of html title" cssStyle="width:300px;" ></s:textfield>
<s:textfield value="%{article.meta}" theme="portal" id="meta" name="meta" label="Meta" required="required" cssErrorClass="has-error" placeholder="Enter meta"  title="Meta is value that search engines use to categories your page" cssStyle="width:300px;" ></s:textfield>
<s:textarea value="%{article.content}" cssClass="ckeditor" cols="80" id="contentArea" name="contentArea" rows="25" required="required" ></s:textarea>

</s:form>

<script type="text/javascript">
var autoSave=false,way=0;
$(document).ready(function(){

	CKEDITOR.replace('contentArea', {
	    on: {
	        save: function(evt)
	        {
	            // Do something here, for example:
	            //console.log(evt.editor.getData());
	 			$.ajax({
				url:'${articleSave}',
				dataType:'json',
				method:'POST',
				data:{
					content:CKEDITOR.instances.contentArea.getData(),
					articleId:$("#articleId").val(),
					title:$("#title").val(),
					meta:$("#meta").val()
				},
				beforeSend:function(){
					$("#notification").html('<p class="bg-info" style="padding: 10px;">Loading...</p>');
				},
				error:function(){
					$("#notification").html('<p class="bg-danger" style="padding: 10px;">Save failed, Autosave in few seconds</p>');
				},
				success:function(data){
					console.log(data);
					if(data.RESULT=='ERROR'){
						$("#notification").html('<p class="bg-danger" style="padding: 10px;">Unable to process due to'+data.ERROR+'</p>');
					}else{
						$("#notification").html('<p class="bg-success" style="padding: 10px;">Last saved at '+data.savedAt+'</p>');
						$("#articleId").val(data.id);
						$("#idShow").val(data.id);
					}
				}
				});
	            // If you want to prevent the form submit (if your editor is in a <form> element), return false here
	            return false;
	        }
	    }
	});
	
	/* element.on( 'click', function( ev ) {
	    // The DOM event object is passed by the 'data' property.
	    var domEvent = ev.data;
	    // Prevent the click to chave any effect in the element.
	    domEvent.preventDefault();
		alert('hello save');
	    
	} ); */
	
	//CKEDITOR.instances.contentArea.on('save',function(){ save(); return false;});
	
	  $("#autoSave").click(function(){
		  autoSave=$("#autoSave").is(":checked");
		  if(autoSave){
			  save();
		}
		});
});

function save(){
	if(way==1 || autoSave){
		alert('ajaxall');

		$.ajax({
			url:'${articleSave}',
			dataType:'json',
			method:'POST',
			data:{
				content:CKEDITOR.instances.contentArea.getData(),
				articleId:$("#articleId").val(),
				title:$("#title").val()
			},
			beforeSend:function(){
				$("#notification").html('<p class="bg-info" style="padding: 10px;">Loading...</p>');
			},
			error:function(){
				$("#notification").html('<p class="bg-danger" style="padding: 10px;">Save failed, Autosave in few seconds</p>');
			},
			success:function(data){
				console.log(data);
				if(data.RESULT=='ERROR'){
					$("#notification").html('<p class="bg-danger" style="padding: 10px;">Unable to process due to'+data.ERROR+'</p>');
				}else{
					$("#notification").html('<p class="bg-success" style="padding: 10px;">Last saved at '+data.savedAt+'</p>');
					$("#articleId").val(data.id);
					$("#idShow").val(data.id);
				}
			}
			});
	}
	if(autoSave){
		setTimeout(save, 5000);
	}
}
</script>
<%-- your content end --%>
</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>