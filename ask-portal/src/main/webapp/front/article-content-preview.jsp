<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header-includes.jsp"%>
<c:choose>
<c:when test="${article!=null}">	
	<link href="resources/ckeditor/plugins/codesnippet/lib/highlight/styles/default.css" rel="stylesheet" type="text/css" >
	<script type="text/javascript" src="resources/ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js" ></script>
	<script>hljs.initHighlightingOnLoad();</script>
	<h1><c:out value="${article.title}"></c:out> </h1>
	<div class="article-content" >
		${article.content}
	</div>
</c:when>
<c:otherwise>
	<div class="article-not-available bg-danger row" style="padding: 10px;margin: 5px;" >Sorry! no article available.</div>
</c:otherwise>
</c:choose>

