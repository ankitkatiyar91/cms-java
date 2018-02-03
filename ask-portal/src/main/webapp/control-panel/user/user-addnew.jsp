<%@include file="../header-includes.jsp" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp"></jsp:include>
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
            Add a new User
            <small>Control panel</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">User</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
<!-- your content goes hear -->
<s:actionerror/>
<s:actionmessage/>
<s:form action="userAddNew" method="post" cssStyle="margin-left:50px;" role="form" >
<s:textfield theme="portal" required="required" cssErrorClass="has-error" name="user.email" placeholder="Email" cssClass="form-control"   id="exampleInputEmail1" label="Email" title="Enter a valid email ankit@domain.com" ></s:textfield>
<s:textfield theme="portal" cssErrorClass="has-error" label="First Name" name="user.firstName" placeholder="First Name" cssClass="form-control" id="fname" required="required"></s:textfield>
<s:textfield theme="portal" cssErrorClass="has-error" label="Last Name" name="user.lastName" placeholder="Last Name" cssClass="form-control" id="lname" required="required"></s:textfield>
<s:password theme="portal" required="required" cssErrorClass="has-error" title="Enter a password"  name="user.password" placeholder="Password" cssClass="form-control" id="password" label="Password" minlength="6" ></s:password>
<s:password theme="portal" required="required" title="Re-type your password" cssErrorClass="has-error"  name="confirmpassword" placeholder="Re-type Password" cssClass="form-control" id="confirm-password" label="Confirm Password" minlength="6" ></s:password>
<%-- <div class="form-group">
	<label for="isAdmin" >Admin</label>
	<select name="user.admin" class="form-control">
		<option value="false" >No</option>
		<option value="true" >Yes</option>
	</select>
</div> --%>

<s:submit cssClass="btn btn-primary" ></s:submit>
</s:form>

    </section><!-- /.content -->
</aside><!-- /.right-side -->
</div><!-- ./wrapper -->
<jsp:include page="../footer-includes.jsp"></jsp:include>
</body>
</html>