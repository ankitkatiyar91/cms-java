<%@page import="com.ankit.portal.hibernate.util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.ankit.portal.service.domain.User"%>
<%@page import="com.ankit.portal.service.util.UserUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Start Test<br>

<% try{ %>
Session Status==<%= HibernateUtil.getSession() %><br>
<br><br>
<%

HibernateUtil.rebuildSessionFactory();

User u;
if(request.getParameter("email")!=null){
	u=UserUtil.findByEmail(request.getParameter("email"));	
}else{
u=UserUtil.findByEmail("admin@cms.com");
}
%>
User Is=<%=u %><br>
<%
if(u==null){
	out.print(UserUtil.getUsers());
}
%>
<%}catch(Throwable t) {t.printStackTrace(response.getWriter());}%>
<%--
<%

try{
	SessionFactory sessionFactory=new org.hibernate.cfg.Configuration().configure().buildSessionFactory();
	sessionFactory.openSession();
	sessionFactory.close();
%>

<%}catch(Throwable t) {t.printStackTrace(response.getWriter());}%>
 --%>
</body>
</html>