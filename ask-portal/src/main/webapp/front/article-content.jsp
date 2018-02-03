<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header-includes.jsp"%>
<c:choose>
<c:when test="${article!=null}">	
	<c:choose>
		<c:when test="${article.status=='PUBLISHED'}">
			<link href="resources/ckeditor/plugins/codesnippet/lib/highlight/styles/default.css" rel="stylesheet" type="text/css" >
			<script type="text/javascript" src="resources/ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js" ></script>
			<script>hljs.initHighlightingOnLoad();</script>
			<h1><c:out value="${article.title}"></c:out> </h1>
			<div class="article-content" style="min-height: 70%;" >
				${article.content}
			</div>	
			<div id="fb-like" style="float: left;" >
				<div class="fb-like" data-href="<%=request.getScheme() + "://" + request.getServerName() +request.getContextPath() %>/home.action?uuid=${article.uuid}" data-layout="standard" data-action="recommend" data-show-faces="true" data-share="true"></div>
				<div class="fb-comments" data-href="<%=request.getScheme() + "://" + request.getServerName() +request.getContextPath() %>/home.action?uuid=${article.uuid}" data-numposts="5" data-colorscheme="light"></div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="article-not-available bg-danger row" style="padding: 10px;margin: 5px;" >Sorry! this article is not available please contact administrator.</div>
			<shiro:hasPermission name="cpanel:view">
			<div class="bg-primary row" style="padding: 10px;margin: 5px;" >This article is not published.</div>	
			</shiro:hasPermission>
		</c:otherwise>
	</c:choose>	
</c:when>
<c:otherwise>
	<div class="article-not-available bg-danger row" style="padding: 10px;margin: 5px;" >Sorry! no article available, please contact administrator.</div>
</c:otherwise>
</c:choose>