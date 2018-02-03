<%@page import="com.ankit.portal.service.domain.Category"%>
<%@page import="com.ankit.portal.service.util.SubCategoryUtil"%>
<%@page import="com.ankit.portal.service.domain.SubCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header-includes.jsp"%>
<!--  ADD YOUR FB or other plugin-->
<!-- <div class="row" style="margin-bottom: 5px;" >
	<div class="fb-page" data-href="https://www.facebook.com/CMS"
		data-hide-cover="true" data-show-facepile="true"
		data-show-posts="false">
		<div class="fb-xfbml-parse-ignore">
			<blockquote cite="https://www.facebook.com/CMS">
				<a href="https://www.facebook.com/CMS">CMS</a>
			</blockquote>
		</div>
	</div>
</div> -->
<c:if test="${categories!=null}">
<s:url action="home" forceAddSchemeHostAndPort="true" var="curl"  >
	<s:param name="mid" value="%{mid}" ></s:param>
</s:url>
<%
List<SubCategory> subCategories;
Integer l;
%>
<div class="row">
	<ul class="list-group side-menu"  >
		<c:forEach items="${categories}" var="category">
			<li class="list-group-item"><a href="${curl}&cid=${category.id}" ><c:out value="${category.label}"></c:out></a>
			<%			
			l =((Category)pageContext.getAttribute("category")).getId();
				subCategories=SubCategoryUtil.getSubCategoriesByCategoryIdOrderedBySequenceNo(l, 0, 0);
				pageContext.setAttribute("subCategories", subCategories);
			%>
				<c:if test="${subCategories!=null}">
					<ul>
					<c:forEach items="${subCategories}" var="sc">
						<li><i class="fa fa-fw fa-arrow-circle-o-right"></i><a href="<c:out value="${curl}&id=${sc.id}"></c:out>" ><c:out value="${sc.label}"></c:out> </a></li>
					</c:forEach>
					</ul>
				</c:if>
			</li>
		</c:forEach>
	</ul>
</div>
</c:if>