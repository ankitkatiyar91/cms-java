<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<title>Control Panel</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap 3.0.2 -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="../resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="../resources/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="../resources/css/AdminLTE.css" rel="stylesheet" type="text/css" />
<!-- custom stylesheet -->
<link href="../resources/css/custom.css" rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="/resources/js/html5shiv.js"></script>
  <script src="/resources/js/respond.min.js"></script>
<![endif]-->
<!-- jquery -->
<script src="../resources/js/jquery.min.js" ></script>
<script src="../resources/js/jquery-ui-1.10.4.custom.min.js" ></script>
      <!-- Bootstrap -->
<script src="../resources/js/bootstrap.min.js" type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="../resources/js/app.js" type="text/javascript"></script>

<%-- add jtable functionality if using jatble in page --%>
<c:if test="${param.jtable}">
<script src="../resources/jtable.2.3.1/jquery.jtable.min.js" type="text/javascript"></script>
<link href="../resources/jtable.2.3.1/themes/metro/lightgray/jtable.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css" />
</c:if>
<%-- <c:if test="${param.modal}"> --%>
<!-- <script src="../resources/js/bootstrap-modal.js" type="text/javascript"></script> -->
<!-- <script src="../resources/js/bootstrap-modalmanager.js" type="text/javascript"></script> -->
<!-- <link href="../resources/css/bootstrap-modal.css" rel="stylesheet" type="text/css" /> -->
<%-- </c:if> --%>
<c:if test="${param.jqueryTable}">
<script src="../resources/table.js" type="text/javascript"></script>
</c:if>
<c:if test="${param.ckeditor}">
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
</c:if>