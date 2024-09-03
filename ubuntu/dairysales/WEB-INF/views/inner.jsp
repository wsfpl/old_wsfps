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
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/datajs-1.1.2.min.js"></script>

<script src="js/OData.js"></script>

<script type="text/javascript">

 $(document).ready(function(){
	 var salesItems = new Array();
	 window.localStorage.setItem("salesItems",salesItems); 
 });
</script>
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
<a href="login.html">Logout <span class="glyphicon glyphicon-off"></span></a>
<h5>Welcome <span >${username}</span></h5>
</div>
</div>
</div>
<!-- header end -->

<!-- container start -->
<div class="container">

<div class="flash_txt">ASBD</div>

<div class="ulDiv col-md-6 col-md-offset-3">
<!-- <div class="bckbtn"><button class="btn-green"><span class="glyphicon glyphicon-arrow-left"></span> Back</button></div> -->
<a class="bckbtn" href="<c:url value = "dealerdashboard"/>"><button class="btn-green"><span class="glyphicon glyphicon-arrow-left"></span> Back</button></a>
<br/><br/>
<ul>
<li><a href="createorder.html"><img src="images/createorderico.png" alt="Create Order">Create Order</a></li>
<li><a href="<c:url value="/pendingorder" />"><img src="images/pendingorderico.png" alt="Pending Orders">Pending Orders</a></li>
<li><a href="confirmorder.html"><img src="images/confirmorderico.png" alt="Confirm Orders">Confirmed Orders</a></li>
<li><a href="rejectorder.html"><img src="images/rejectedorderico.png" alt="Rejected Orders">Rejected Orders</a></li>
</ul>
</div>
</div>
<!-- container end -->
</body>
</html>