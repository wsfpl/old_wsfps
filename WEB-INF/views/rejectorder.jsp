<!DOCTYPE html>
<html>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9"> <![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Mahindra Rise</title>
<!-- Bootstrap js start -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<!-- Bootstrap js end -->
<!-- Bootstrap css start -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<!-- Bootstrap css end -->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
<script src="js/datajs-1.1.2.min.js"></script>

<script src="js/OData.js"></script>

<script type="text/javascript">
	var cback = "rejectOrders()";
	var userId = window.localStorage.getItem("userId");
	
	/* var url = "http://qaapps.mahindra.com/sap/opu/odata/sap/ZGW_DAIRY_SRV/Stg_HeaderSet?$expand=NavStaging&$filter=Kunnr eq '"
			+ userId + "' and Flag eq 'R'"; */
			var url = "http://mcvladsf1.corp.mahindra.com:8000/sap/opu/odata/sap/ZGW_DAIRY_SRV/Stg_HeaderSet?$expand=NavStaging&$filter=Kunnr eq '"
				+ userId + "' and Flag eq 'R'";
	readServices(cback, url);
</script>

</head>
<body class="bodyBg" onload="setUserName()">
	<!-- header start -->
	<div class="loader">
		<img src="images/loader.gif">
	</div>
	<div class="header navbar-fixed-top">
		<div class="container-fluid">
			<div class="col-xs-5 logo">
				<a href="index.html"><img src="images/logo.png"
					alt="Mahindra Rise"></a>
			</div>

			<div class="col-xs-7 text-right LoginTxt">
				<a href="login.html">Logout <span
					class="glyphicon glyphicon-off"></span></a>
				<h5>
					Welcome <span id='userNm'></span>
				</h5>
			</div>
		</div>
	</div>
	<!-- header end -->

	<!-- container start -->
	<div class="container">
		<div class="ulDiv col-md-6 col-md-offset-3">
			<div class="bckbtn">
				<button class="btn-green">
					<span class="glyphicon glyphicon-arrow-left"></span> Back
				</button>
			</div>
			<div class="mainCont">
				<h2>
					<span><img src="images/smrejectedorderico1.png">Rejected
						Orders</span>
				</h2>
				<ul id="rejectOrder" class="confirmorderul">
					<!-- <li><a href="#"><img src="images/checkico.png">873551098983</a></li> -->
				</ul>
			</div>
		</div>
	</div>
	<!-- container end -->
	<div class="modal fade pendingOrderModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Order Detail</h4>
				</div>
				<div class="modal-body">
					<div>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Material</th>
									<th>Qty</th>
									<th>New Qty</th>
									<th>Unit</th>
									<th>Rate</th>
									<th>Value</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<div class="form-control alert alert-warning" id="comments">
						<b>Note : </b>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->

</body>
</html>