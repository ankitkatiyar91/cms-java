<%@include file="../header-includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp">
	<jsp:param value="jqueryTable" name="true"/>
</jsp:include>

<%-- <script type="text/javascript">
$(document).ready(function () {
	//listImages();
});
function listImages(){
	var images = [ 'http://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Black_check.svg/600px-Black_check.svg.png', 'img/img2.jpg', 'img/img3.jpg', 'img/img4.jpg', 'img/img5.jpg' ],
    li = $( '<li/>' ),
    ul = $( '#images > ul' );
	$.each( images, function( i, v ) {
	 ul.append( li.clone().html( '<img src="'+v+'" alt="..." class="img-responsive img-thumbnail"  style="width: 140px; height: 140px;" >' ) );
	});
	/* div=$('<div/>');
	su=$("#images");

	$.each( images, function( i, v ) {
		 su.append( div.clone().html( '<div class="col-xs-6 col-md-3"> <a href="#" class="thumbnail"> <img src="'+v+'" alt="..." style="width: 140px; height: 140px;" > </a></div>' ) );
		}); */
	
	
  
}
</script> --%>
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
       Images
        <small>List</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${home}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Images</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
<!-- your content goes hear -->
<div class="images" id="images" >
	<ul class="list-inline" >
	<s:url action="imageThumb" var="image" forceAddSchemeHostAndPort="true" namespace="/" ></s:url>
	<s:url action="image" var="imageOrg" forceAddSchemeHostAndPort="true" namespace="/" ></s:url>
	<c:forEach items="${imageFiles}" var="item" >
		<a href="${imageOrg}?id=${item.id}" target="_blank" ><img src="${image}?id=${item.id}" alt="<c:out value="${item.description}"></c:out>" title="<c:out value="${item.description}"></c:out>" class="img-responsive img-thumbnail"  style="width: 140px; height: 140px;" ></a>	
	</c:forEach>
	</ul>
</div>
<div class="container-fluid text-center" >
<ul class="pagination">
<%
int pageNo=Integer.parseInt(request.getParameter("pageNo")==null?"0":request.getParameter("pageNo"));
long total=(Long)(request.getAttribute("totalImages")==null?(new Long(0)):request.getAttribute("totalImages"));
int i=0,j;
int pagemax=(int)(total/10+1);
j=pagemax;

if(pageNo>2){
	i=pageNo-2;
	j=i+5;
}else if(pageNo<pagemax-2){
	j=i+5;
}
if(pageNo>=pagemax-3){
	j=pagemax;
}
%>
<%-- total-<c:out value="${totalImages}"></c:out>and mod=<%=(total%10) %>, Mid<%=pagemax/2 %> --%>
<c:if test="${pageNo gt 2}">
	<li class="disable" ><a href="?pageNo=<%=i-1%>">&laquo;</a></li>
</c:if>
  <%
  	for(;i<j;i++)
  	{
  %>
  	<li
  	<% if(i==pageNo){ %>class="active"<%} %>
  	><a href="?pageNo=<%=i%>"><%=i+1 %></a></li>
  <%} %>
<%if(j<=pagemax-1) {%>
	<li><a href="?pageNo=<%=i%>">&raquo;</a></li>
<%} %>
  
</ul>
</div>
</section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>