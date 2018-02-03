<%-- All the required imports and taglibs--%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c"%>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>

<%-- Required  actions --%>
<s:url action="home" forceAddSchemeHostAndPort="true" var="home" namespace="/cpanel" ></s:url>
<s:url action="users" forceAddSchemeHostAndPort="true" var="userList" namespace="/cpanel" ></s:url>
<s:url action="roles" var="roleList" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<s:url action="userAddForm" var="userAddForm" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<s:url action="userGroups" var="userGroups" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<s:url action="logout" var="logout" forceAddSchemeHostAndPort="true" namespace="/" ></s:url>
<%-- url to list menu page --%>
<s:url action="menus" var="menus" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<s:url action="menuAddForm" var="menuAddForm" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<%--  Category menu start --%>
<s:url action="categories" var="categories" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<s:url action="categoryAddForm" var="categoryAddForm" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<%--  Sub Category menu start --%>
<s:url action="subCategories" var="subCategories" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<s:url action="subCategoryAddForm" var="subCategoryAddForm" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<%-- article menu start --%>
<s:url action="articles" var="articles" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<s:url action="articleContent" var="articleContent" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<%-- Images menu start --%>
<s:url action="images" var="images" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>
<s:url action="imagesUploadFrom" var="imagesUploadFrom" namespace="/cpanel" forceAddSchemeHostAndPort="true" ></s:url>