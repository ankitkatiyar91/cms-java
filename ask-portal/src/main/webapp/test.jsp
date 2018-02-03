<%@page import="java.io.PrintWriter"%>
<%@page import="com.ankit.portal.hibernate.util.HibernateUtil"%>
<%@page import="com.ankit.portal.service.util.MenuUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.ankit.portal.service.domain.Menu"%>
<%@page import="org.hibernate.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Testing</title>
</head>
<body>
<%
try{
HibernateUtil.getSession().getSessionFactory().getCache().evictAllRegions();
Session hbSession ;
hbSession = HibernateUtil.getSession();
for(Menu m:MenuUtil.getDispayableMenus()){
	out.print("Menu--"+m+"</br>");	
}
if(hbSession.isOpen()){
	out.print("<br><b>Session is open</b></br>");
	out.print("Menu ID2--"+hbSession.get(Menu.class,2)+"</br>");
}else{
	out.print("<br><b>Session is closed</b></br>");
}
Menu menu ;
for(int i=0;i<10;i++){
	try{
		menu = (Menu) MenuUtil.getMenu(i);
		out.print(i+"--"+MenuUtil.getMenu(i)+"</br>");
	}catch(Exception e){
		out.print("<br>Unable to load id"+i+"<br>"+e.getMessage());
		//e.printStackTrace(response.getWriter());
		out.print("<br><br>");
		}
}
}catch(Exception exception){
	out.print("<b>Got one issue</b>");
	exception.printStackTrace(new PrintWriter(out));
}finally{

	HibernateUtil.closeSession();
}
%>
</body>
</html>