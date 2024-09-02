<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9"> <![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Litigation - Home</title>

<!-- Bootstrap js start -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<!-- Bootstrap js ends -->
<!-- Bootstrap css start -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<!-- Bootstrap css ends -->
<script src="js/registrationDetails.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<body>
<!-- header start -->
<div class="loader"><img src="images/loader.gif"></div>
<div class="header navbar-fixed-top">
<div class="container-fluid">
<div class="col-xs-5 logo">
<a href="index.html"><img src="images/logo.png" alt="Mahindra Rise"></a>
</div>
</div>
</div>
<!-- header end -->
	<div class="container">
	<div class="col-md-6 col-md-offset-3 loginPage">
	<div class="loginForm">
	<div class="form">
	     <div class="login">
            <form:form action="login" method="post" commandName="user" id="userLoginForm">
				<div class="form-group">				
                	<form:input path="loginId" placeholder="User ID" required="required" class="form-control" value="${tokenId}"/>
            	</div>
            	<div class="form-group">
                	<form:password path="password"  placeholder="User Password" required="required" class="form-control"/>
            	</div>
                  <div class="form-group">
					<button type="submit" value="SUBMIT" class="btn btn-primary">Sign In</button>
				</div>
            </form:form>
    </div>
     </div>
     </div>
    </div>
<div class="clearfix"></div>
</div>
	<c:if test="${not empty messages}">
		<script>
			$(function() {
				$(".alert").html('<c:out value="${messages}"/>');
				$('.alertModal').modal('show');
				window.setTimeout(function() {
					$(".alertModal").modal("hide");
				}, 6000);
			});
		</script>
	</c:if>
	<%
		session.removeAttribute("messages");
	%>
	<!-- confirmation modal start -->
<div class="modal fade alertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <!-- <h4 class="modal-title" id="myModalLabel">Modal title</h4> -->
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
		<div class="alert alert-danger">
		Alert Message here.............
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- confirmation modal end -->
 </body>
</html>