<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="../header-includes.jsp"%>
<s:head/>
<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Link Article <i><c:out value="${param.message}"></c:out></i> </h4>
      </div>
      <div class="modal-body">
      
	<form class="form-inline" id="link-form" role="form" action="<c:out value="${param.url}"></c:out>">
	  <div class="form-group">
	    <input type="text" class="form-control" id="articleId" name="articleId" placeholder="Enter Article Id">
	  </div>
	  <button type="button" class="btn btn-default" id="linkButton" >Link</button>
	</form>
	
	
	
	
      </div>
      <script type="text/javascript">
      	$(document).ready(function(){
          	$("#linkButton").click(function(){
              	$.ajax({
        			url:'<c:out value="${param.url}"></c:out>',
        			dataType:'json',
        			method:'POST',
        			data:{
        				'<c:out value="${param.passIdName}"></c:out>':'<c:out value="${param.passId}"></c:out>',
        				'<c:out value="${param.articleIdName}"></c:out>':$("#articleId").val()
        			},
        			beforeSend:function(){
        			},
        			error:function(){
        				alert('Unable to process retry');
        			},
        			success:function(data){
            			if(data.MESSAGE){
                			alert(data.MESSAGE);
                		}
        			}
        		});
              	
              	});
          	});
      </script>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>