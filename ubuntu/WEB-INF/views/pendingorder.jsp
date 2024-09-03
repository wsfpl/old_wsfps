<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    
<script type="text/javascript">

$(document).ready(function(){
	
	$(".updateRecords").click(function(){
		alert("Hi");
		updateRecord(this);
	});
});
makeCorsRequest();

// console.log("=============="+document.getElementById("pendingList").value);

var responseData;
function createCORSRequest(method, url) {
	  var xhr = new XMLHttpRequest();
	  if ("withCredentials" in xhr) {
	    // XHR for Chrome/Firefox/Opera/Safari.
	    xhr.open(method, url, true);
	  } else if (typeof XDomainRequest != "undefined") {
	    // XDomainRequest for IE.
	    xhr = new XDomainRequest();
	    xhr.open(method, url);
	  } else {
	    // CORS not supported.
	    xhr = null;
	  }
	  return xhr;
	}

	function makeCorsRequest() {
		var userId=window.localStorage.getItem("userId");
//      var url = 'http://appstore.mahindra.com:8580/dairy/DataController?userOpr=GET&userId='+userId;
     var url = 'http://localhost:8080/Seeds/pendingOrderList';
	  var xhr = createCORSRequest('GET', url);
	  if (!xhr) {
	    alert('CORS not supported');
	    return;
	  }
	  xhr.onload = function() {
		  //debugger;
// 		  console.log("xhr.responseText==========="+xhr.responseText);
	    var text = jQuery.parseJSON(xhr.responseText);
// 	    var text = xhr.responseText;
	    
// 	    console.log("text==========="+text);
// 	    responseData = text;
	    
	    
	    
	    var headerItems=new Array();
	     for(var i=0;i<text.length;i++){
// 	    	headerItems.push(text[i].HeaderId);
	    	console.log("text==========="+text[i].headerID);
// 	    	headerItems.push(text[i].NetwrHeader);
// 	    	headerItems.push(text[i].Erdat);

	    	  var fdate = text[i].edatu;
			  noOfItems = text[i].noOfItems;
			  console.log("");
			  
			  $("#pendingOrder").append(
					    	'<li onClick="pendingData('+text[i].headerID+')" data-headerId='+text[i].headerID+'><form action="pendingorderupdate" method="POST" name="updateForm_'+text[i].headerID+'" id="updateForm_'+text[i].headerID+'"><input type="hidden" value= "'+text[i].headerID+'" name="headerId"><input type="hidden"name="${_csrf.parameterName}" value="${_csrf.token}" /></form><a><div class="col-xs-6"><span class="num">'+text[i].headerID+'</span><span class="num">No of Items:'+noOfItems+'</span></div><div class="col-xs-6 text-right"><span class="qty">'+text[i].netwr+'</span><span class="mat">'+fdate+'</span></div><div class="clearfix"></div></a></li>');
	    	
	    } 
	    /* var ress = eliminateDuplicates(headerItems);
	    $.each(ress, function(i, el){
	    	for(var j=0;j<responseData.length;j++){
		    	var noOfItems = 0;
				if(responseData[j].headerID==el){
					  var fdate = responseData[j].edatu;
					  noOfItems = responseData[j].noOfItems;
					  console.log("");
					  $("#pendingOrder").append('<li onClick="pendingData(this)" data-headerId='+el+'><a><div class="col-xs-6"><span class="num">'+el+'</span><span class="num">No of Items:'+noOfItems+'</span></div><div class="col-xs-6 text-right"><span class="qty">'+responseData[j].NetwrHeader+'</span><span class="mat">'+fdate+'</span></div><div class="clearfix"></div></a></li>');
					  break;
				}
			}
	    });*/
	  }; 
	  xhr.onerror = function() {
	    alert('Woops, there was an error making the request.');
	  };
	  xhr.send();
	}
	
	function eliminateDuplicates(arr) {
		  var i,
		      len=arr.length,
		      out=[],
		      obj={};
		 
		  for (i=0;i<len;i++) {
		    obj[arr[i]]=0;
		  }
		  for (i in obj) {
		    out.push(i);
		  }
		  return out;
	}
	
	function pendingData(headerId){
		alert("===data=xx===="+headerId);

		document.getElementById("updateForm_"+headerId).submit();
 
	}
	
	function updateRecord(datas){
		updateDeleteRecord(datas,"UPDATE");
	}
	
	function deleteRecord(datas){
// 		deleteRecord(datas,"DELETE");

		var salesItems=new Array();
		var qunatity = $(".new_Value").val();
		var posnr =  datas.dataset.posnr;
		var headerId = datas.dataset.headerid;
		var finalAmount = 0;
		for(var i=0;i<responseData.length;i++){
			if(responseData[i].HeaderId==headerId){
				    if(responseData[i].Posnr == posnr){
      				   var oData= {
				           "itemNumber":responseData[i].itemNumber
			          };
      				salesItems.push(oData);
				  }
			}
		}
		var finalData =new Array();
		var userId=window.localStorage.getItem("userId");
	    
		finalData.push({
		    "kunnr": userId,
	        "vkorg": "",
	        "vtweg": "",
	        "spart": "",
	        "vkgrp": "",
	        "vkbur": "",
	        "netwrHeader":finalAmount,
	        "creditLimit": "",
	        "flag": " ",
	        "status": " ",	
	        "headerId":parseInt(headerId),
	        "items":salesItems
	  });		
		
		var finalData = JSON.stringify(finalData);
		 $.ajax({
		 type:"POST",
	     url :"http://appstore.mahindra.com:8580/dairy/DataController",
// 	     contentType:"text/xml",
// 	     dataType:"xml",
	     data:{
	    	 userOpr:'DELETE',
	     	 jdata:finalData
	     },
	     success:function(data,req,res){
	    	 $('.alertModal').modal('show');
	    	 $('.alertModal .alert').removeClass('alert-danger').addClass('alert-success');
	    	 $('.alertModal .alert').text('sucesss');
	     },
	     error:function(oError){
	    	 alert(oError);
	    	 $('.alertModal').modal('show');
	    	 $('.alertModal .alert').removeClass('alert-success').addClass('alert-danger');
	    	 $('.alertModal .alert').text(oError);
	     }
	     });
		
		 
	}
	
	
	function updateDeleteRecord(datas,action){
		var salesItems=new Array();
		var qunatity = $(".new_Value").val();
		var posnr =  datas.dataset.posnr;
		var headerId = datas.dataset.headerid;
		var finalAmount = 0;
		for(var i=0;i<responseData.length;i++){
			if(responseData[i].HeaderId==headerId){
				responseData[i].Zmeng=qunatity;
				var amountItem = qunatity*responseData[i].Netpr;
				    if(responseData[i].Posnr == posnr){
      				   var oData= {
				           "posnr": responseData[i].Posnr,
				           "matnr": responseData[i].Matnr,
				           "maktx": responseData[i].Maktx,
				           "werks": "",
				           "lgort": "",
				           "zmeng": qunatity,
				           "ameng": "",
				           "zieme":responseData[i].Zieme,
				           "netpr":responseData[i].Netpr,
				           "netwrItem": amountItem,
				           "itemNumber":1,
				           "edatu": "2015-11-05"
			          };
      				   
      				salesItems.push(oData);
       				if(action=="UPDATE"){
       				 finalAmount += parseFloat(salesItems[0].netpr);
       				}else{
//        					finalAmount -= salesItems[i].netpr;
       				}
				  }
  				
			}
		}
		
		var finalData =new Array();
		var userId=window.localStorage.getItem("userId");
		finalData.push({
		    "kunnr": userId,
	        "vkorg": "",
	        "vtweg": "",
	        "spart": "",
	        "vkgrp": "",
	        "vkbur": "",
	        "netwrHeader":finalAmount,
	        "creditLimit": "",
	        "flag": " ",
	        "status": " ",	
	        "headerId":parseInt(headerId),
	        "items":salesItems
	  });		
		
		var finalData = JSON.stringify(finalData);
		 $.ajax({
		 type:"POST",
	     url :"http://appstore.mahindra.com:8580/dairy/DataController",
// 	     contentType:"text/xml",
// 	     dataType:"xml",
	     data:{
	    	 userOpr:'UPDATE',
	     	 jdata:finalData
	     },
	     success:function(data,req,res){
	    	 $('.alertModal').modal('show');
	    	 $('.alertModal .alert').removeClass('alert-danger').addClass('alert-success');
	    	 $('.alertModal .alert').text('Order updated successfully.');
	     },
	     error:function(oError){
	    	 alert(oError);
	    	 $('.alertModal').modal('show');
	    	 $('.alertModal .alert').removeClass('alert-success').addClass('alert-danger');
	    	 $('.alertModal .alert').text(oError);
	     }
	     });
		
	}
	

</script>
</head>
<!-- <body class="bodyBg" onload="setUserName()"> -->
<body class="bodyBg" >
<!-- header start -->
<div class="header navbar-fixed-top">
<div class="container-fluid">
<div class="col-xs-5 logo">
<a href="index.html"><img src="images/logo.png" alt="Mahindra Rise"></a>
</div>
<div class="col-xs-7 text-right LoginTxt">
<a href="login.html">Logout <span class="glyphicon glyphicon-off"></span></a>
<h5>Welcome <span id='userNm'></span></h5>
</div>
</div>
</div>
<!-- header end -->

<!-- container start -->
<div class="container">
<div class="ulDiv col-md-6 col-md-offset-3">
<!-- <div class="bckbtn"><button class="btn-green"><span class="glyphicon glyphicon-arrow-left"></span> Back</button></div> -->
<a class="bckbtn" href="<c:url value = '/inner' /> "><button class="btn-green"><span class="glyphicon glyphicon-arrow-left"></span> Back</button></a>
<div class="mainCont">
<h2><span><img src="images/smpendingorderico.png">Pending Orders</span></h2>
<input type="hidden" id="pendingList" name="pendingList" value="${pendingLists}">
<ul id="pendingOrder" class="confirmorderul">
<!-- <li><a href="#"><img src="images/checkico.png">873551098983</a></li> -->
<!-- <li><a href="#"><img src="images/checkico.png">873551098983</a></li> -->
</ul>
</div>
</div>
</div>
<!-- container end -->
<!-- 
	<div class="modal fade pendingOrderModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Updating Order</h4>
				</div>
				<div class="modal-body">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Material</th>
								<th>Quantity</th>
								<th>Unit</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> -->
	
	<!-- alert modal start -->
<div class="modal fade alertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Update Order</h4>
      </div>
      <div class="modal-body">
        <div class="alert alert-success">
        Warning message...............
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>