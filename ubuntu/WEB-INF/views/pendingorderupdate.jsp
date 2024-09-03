<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
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

    
<script type="text/javascript">


</script>
</head>
<!-- <body class="bodyBg" onload="setUserName()"> -->
<body class="bodyBg">
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
<div class="col-md-6 col-md-offset-3">
<!-- <div class="bckbtn"><button class="btn-green"><span class="glyphicon glyphicon-arrow-left"></span> Back</button></div> -->
<a class="bckbtn" href="<c:url value = '/pendingorder' /> "><button class="btn-green"><span class="glyphicon glyphicon-arrow-left"></span> Back</button></a>
<div class="mainCont">
<h2><span><img src="images/smpendingorderico.png">Update Order</span></h2>
<div class="pendingUpdate respTable">
<input type="hidden" id="productlistCode"/>
<table class="table table-bordered">
						<thead>
							<tr>
								<th>Material</th>
								<th>Quantity</th>
								<th>Due Date</th>
								<th>Action</th>
							</tr>
						</thead>
						
						<tbody>
						<c:set var="count" value="0" scope="page" />

						<form method="POST" action="updatePendingOrder"  id="updateForm" commandName="pdtoWrap">
						
							<input type="hidden" name="list_length" id="list_length" value="${fn:length(pdtoWrap.list)}" />
							<input type="hidden" name="${_csrf.parameterName}" id="csrf_token"value="${_csrf.token}" />
							
							<input id=submitButton type="submit" value="Submit" />
							
							<c:forEach items="${pdtoWrap.list}" var="item" varStatus="status">
							    
							    
								<tr valign="top">
									<%-- The c:out will escape html/xml characters. --%>
									<td data-title='Material'>${item.MAKTX}</td>
					  				<td data-title='Quantity'>
<%-- 					  				<input type='text' id='quantity"+${item.itemNumber}+"' name="itemNumber" class='new_Value form-control' value="${item.ZMENG}"> --%>
					  					<input name="list[${status.index}].ZMENG" type="text" id="quantity_${count}"  class='new_Value form-control' value="${item.ZMENG}"/>
					  				</td>
								    <td data-title='Due Date'>
<%-- 								    <input disabled='true' type='text' id='dueDate"+${item.itemNumber}+"' name ="edatu" class='form-control datepicker dateReq' value='${item.EDATU}'> --%>
								    	<input name="list[${status.index}].EDATU" type="text"   id="dueDate_${count}"  class='new_Value form-control' value="${item.EDATU}"/>
								    </td>
								    <input name="list[${status.index}].NETPR" type="hidden" id="dueDate_${count}"  class='new_Value form-control' value="${item.NETPR}"/>
								    <input name="list[${status.index}].ItemNumber" type="hidden" id="dueDate_${count}"  class='new_Value form-control' value="${item.itemNumber}"/>
								    <input name="list[${status.index}].itemID" type="hidden" id="dueDate_${count}"  class='new_Value form-control' value="${item.itemID}"/>
								    <input name="list[${status.index}].headerID" type="hidden" id="dueDate_${count}"  class='new_Value form-control' value="${item.headerID}"/>
								    <input name="headerID" type="hidden" id="headerID_${count}"  class='new_Value form-control' value="${item.headerID}"/>
								    <%-- <form action="deleteOrder" method="post" name="delete_form_${item.headerID}" id="delete_form_${item.headerID}">
										<input type="hidden" name="itemNumber_${count}" value="${item.itemNumber}" />
										<input type="hidden" name="netwrItem_${count}" value="${item.NETWR_ITEM}" />
										<input type="hidden" name="headerId_${count}" value="${item.headerID}" />
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</form> --%>
								    <td data-title="Action"><button type="button" class="btn-del" onClick="deleteForm(${count});" data-headerid='${item.headerID}' data-itemNumber='${item.itemNumber}'><span class="glyphicon glyphicon-remove"></span></button></td>
								</tr>
								
								<c:set var="count" value="${count + 1}" scope="page"/>
								
							</c:forEach>
<!-- 							<input type="submit"  value="Update"/> -->
							
						</form>
						</tbody>
					</table>
<!-- <div class="text-right"><button type="button" class="btn-save" onClick="updateRecord()"><span class="glyphicon glyphicon-saved"></span> Update</button></div> -->
<!-- <div class="text-right"><input type="submit" class="btn-save" ><span class="glyphicon glyphicon-saved"></span> Update</input></div> -->
</div>
</div>
</div>
</div>
<!-- container end -->

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
<!-- alert modal end -->

<script type="text/javascript">

$(document).ready(function(){
	$('#submitButton').click(function(){
		debugger;
		console.log($('#updateForm').serialize());
	})
})

	function deleteForm(formId){
		document.getElementById("delete_form_"+formId).submit();
	}
	
	
	function updateRecord() {

// 		document.getElementById("updateForm").submit();
		
		/* var sendDataArr = [];
		var json = {"message":"Message123","time":"time123","name":"test123"};
		
		var json = "";
		for(var i = 1; i <= document.getElementById("list_length").value; i++){
			
	 		
	 		sendDataArr.push({
			 			headerId: document.getElementById("header_id_"+i).value,
						itemId : document.getElementById("item_id_"+i).value,
						itemNumber : document.getElementById("item_number_"+i).value
					});
	 		
					
		     
		       	
			
			if(i == document.getElementById("list_length").value){

				console.log("sendDataArr============="+JSON.stringify(sendDataArr));
				
				 $.ajax({
					 type:"POST",
// 					 dataType : "json",
				     url :"http://localhost:8080/Seeds/updatePendingOrder",
// 				     url :"http://localhost:8080/Seeds/PostFormDataJSONArray",
// 			 	     contentType:"text/xml",
//			 	     dataType:"xml",
					
// 		            headers : {
// 		                'Accept' : 'application/json',
// 		                'Content-Type' : 'application/json'
// 		            },
				     data:{
				     	sendDataArr	:	JSON.stringify(sendDataArr),
				     	 random 	:	Math.random(),
				     	 _csrf 		: 	document.getElementById("csrf_token").value
				     },
				     success:function(data,req,res){
				    
				    	 console.log("data==="+data+"===req=="+req+"===res==="+res);
				    	 
				    	 for(var j = 0; j < sendDataArr.length;j++){
				    		 console.log("headerId========"+sendDataArr[j].headerId);	 
				    	 }
				    	 
				    	 
				    	 
				     },
				     error:function(oError){
				    	
				     }
				     });
				
				
			}//end if
			
			
			
		}// end of for loop
		 */
		
	}//end of function
	
</script>

</body>
</html>