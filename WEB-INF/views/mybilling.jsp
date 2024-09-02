<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9"> <![endif]-->
<head>
 <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Mahindra Rise</title>
<!-- Bootstrap js start -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<!-- Bootstrap js end -->
<!-- Bootstrap css start -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/datajs-1.1.2.min.js"></script>
     <script src="js/OData.js"></script>
<!-- Bootstrap css end -->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bodyBg" onload="setUserName()">
<!-- header start -->
<div class="header navbar-fixed-top">
<div class="container-fluid">
<div class="col-xs-5 logo">
<a href="index.html"><img src="images/logo.png" alt="Mahindra Rise"></a>
</div>

<div class="col-xs-7 text-right LoginTxt">
<!-- <a href="javascript:logout();">Logout <span class="glyphicon glyphicon-off"></span></a> -->
<a href="javascript:formSubmit();" >Logout <span class="glyphicon glyphicon-off"></span></a>


<c:url value="/logout" var="logoutUrl" />
	<!-- csrt for log out-->
	<form action="${logoutUrl}" method="post" id="logoutForm">
	  <input type="hidden" 
		name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	</form>
<h5>Welcome <span id='userNm'></span></h5>
</div>
</div>
</div>
<!-- header end -->

<!-- container start -->
<div class="container">
<div class="ulDiv col-md-6 col-md-offset-3">
<ul>
<li><a href="inner.html"><img src="images/mytaskico.png" alt="My Task List">My Task List</a></li>
<li><a href="mybilling.html"><img src="images/mybillingico.png" alt="My Billing">My Billing</a></li>
<!-- Commented Code By Srini Requested  By Sunil Nair -->
<!-- <li><a href="mycredit.html"><img src="images/mycreditico.png" alt="My Credit Limit">My Credit Limit</a></li> -->
<!-- Commented Code By Srini Requested  By Sunil Nair -->
<!-- <li><a href="#"><img src="images/orderfromico.png" alt="Orders from Retailers">Orders from Retailers</a></li> -->
</ul>
</div>
</div>
<!-- container end -->

<script type="text/javascript">
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>
</body>
</html>