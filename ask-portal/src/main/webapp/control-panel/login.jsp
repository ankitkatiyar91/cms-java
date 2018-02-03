<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header-includes.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="head.jsp"></jsp:include>
</head>
<body class="bg-black" >


<div class="wrapper row-offcanvas row-offcanvas-left">
           <div class="form-box" id="login-box">
            <div class="header">Sign In</div>
            <s:form action="loginAction" cssErrorClass="error"  method="post">
                <div class="body bg-gray">
                <s:actionmessage/>
                <s:actionerror/>
                    <div class="form-group">
                        <s:textfield theme="xhtml" name="email" cssClass="form-control" placeholder="Email" cssErrorClass="has-error" ></s:textfield>
                    </div>
                    <div class="form-group">
                        <s:password theme="xhtml" placeholder="Password" name="password" cssClass="form-control" cssErrorClass="has-error" ></s:password>
                    </div>          
                    <div class="form-group">
                        <s:checkbox name="rememberMe" fieldValue="true" value="true"  cssErrorClass="has-error" ></s:checkbox>Remember me
                    </div>
                </div>
                <div class="footer">                                                               
                    <button type="submit" class="btn bg-olive btn-block">Sign me in</button>  
                    
                  <!--   <p><a href="#">I forgot my password</a></p>
                    
                    <a href="register.html" class="text-center">Register a new membership</a> -->
                </div>
            </s:form>
        </div>
        </div><!-- ./wrapper -->
</body>
</html>