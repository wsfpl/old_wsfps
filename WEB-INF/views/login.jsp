<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spg"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<html>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9"> <![endif]-->
<head>
<meta charset="utf-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta http-equiv="X-UA-Compatible" content="IE=11">
<meta http-equiv="X-UA-Compatible" content="IE=11">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>White Spread Foods</title>

<!-- Bootstrap js start -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<!-- Bootstrap js ends -->
<!-- Bootstrap css start -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/msc-style.css" >
<!-- Bootstrap css ends -->
<script src="js/registrationDetails.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
<style>

.flash_box{
	width: 100%;
    margin: 20px auto 20px;
    background: #e31837;
    text-align: center;
    border-radius: 5px;
    padding: 15px;
    font-size: 17px;
    color: #fff;
	
}
.flash_txt{
    animation:blinkingText 1.8s infinite;
    margin: 0;
}
@keyframes blinkingText{
    0%{     opacity: 1;    }    
    50%{    opacity: 0.2; }
    100%{   opacity: 1;    }
}
</style>
</head>
<body>
	<!-- header start -->
	<div class="loader">
		<img src="images/loader.gif">
	</div>
	<div class="header navbar-fixed-top">
		<div class="container-fluid">
			<div class="col-xs-5 logo">
				<!-- <a href="index.html"><img src="images/logo.png" alt="Mahindra Rise"></a> -->
				<!-- <a href="index.html"><img src="images/mnmlogo.jpg" alt="Mahindra Rise"></a> -->
				<a href="<c:url value="/login" />"><img
					src="images/white-spread1.png" alt="white-spread1"></a>
			</div>
		</div>
	</div>
	<!-- header end -->
	<div class="loginPage">
	<div class="container">
	<!-- <div class="row">
		<div class="col-xs-12">
			<div class="flash_box">
			<p class="flash_txt">We are upgrading our systems and will not be available from 17th August 2019 6:00 AM to 19th August 2019 6 AM. Inconvenience is regretted.</p>
		</div>
		</div>	
	</div> -->
		<div class="col-md-6 col-md-offset-3">
			<div class="loginForm">
				<div class="form">
					<div class="login">
						<spg:form id="login_form" method="POST" action="login">
							<div class="form-group">
								<span style="color: red; font-weight: bold;">${userStatus}</span>
							</div>
							<div class="form-group">
								<input type="text" name="username" placeholder="User ID"
									required="required" class="form-control" value="${tokenId}"
									autocomplete="off" />
							</div>
							<div class="form-group">
								<input type="password" name="password"
									placeholder="User Password" required="required"
									class="form-control" autocomplete="off" />
								<input type="hidden" id="csrf_token" value="${_csrf.token}"/>
							</div>
							<div class="form-group">
								<span style="color: red; font-weight: bold;">${isAuth}</span>
								<%-- 					<span style="color:red;font-weight:bold;">${userStatus}</span> --%>
							</div>

							<div class="form-group">
								<button type="submit" value="SUBMIT" class="btn btn-primary">Sign
									In</button>
							</div>

							<div class="form-group" style="text-align: center;">
								<a style="color: blue; font-weight: bold;" href="#"
									data-toggle="modal" data-target="#forgot_password" >Forgot&nbsp;Password&nbsp;?</a>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</spg:form>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
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




	<!-- Create Billing Task Modal -->
	<div id="forgot_password" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color:#E21836">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="text-align:center;color:#FFFFFF">Forgot Password</h4>
				</div>
				<div class="modal-body">
					<div class="form-group new-class">
						<label class="control-label col-xs-4 col-md-5" >Enter Username :</label>
						<div class="col-xs-8 col-md-7">
							<input type="text" class="form-control" id="ft_username" placeholder="Enter your username..." value=""/>
						</div>
						<label style="color:red;" id="ft_error_label"></label>
					</div>
<!-- 					<div class="form-group new-class">&nbsp;</div> -->
				</div>
				<div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary"  onclick="forgotPassword();">Submit</button>
                </div>
			</div>

		</div>
	</div>

	<script type="text/javascript" src="js/msc-script.js"></script>
	<script type="text/javascript">
		
		function forgotPassword(){
			
			
			if(document.getElementById("ft_username").value != ""){
				
				
				
				
						$.ajax({
							type : "POST",
							url : "forgotPassword",
							data : {
								userID : document.getElementById("ft_username").value,
								random : Math.random(),
								_csrf : document.getElementById("csrf_token").value
							},
							success : function(data, req, res) {
		
								
								if(data == "0"){
									$('#forgot_password').modal('hide');
									mscAlert("You will shortly receive an SMS with username and password.");	
								}
								else if(data == "1"){
									document.getElementById("ft_error_label").innerHTML = "Invalid Mobile No!";
								}
								else{
									document.getElementById("ft_error_label").innerHTML = "Invalid username !!!";
								}
								
					 			
							},
							error : function(oError) {
								mscAlert("Something went wrong!!!");
							}
						});

						document.getElementById("ft_username").value = "";
			 			document.getElementById("ft_error_label").innerHTML = "";
				

			} else {

				document.getElementById("ft_error_label").innerHTML = "Please enter username !!!";

			}

			

		}
	</script>
</body>
</html>