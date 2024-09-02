<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page session="true" %>
<!DOCTYPE html>

<html>
<sec:authentication var="user" property="principal" />
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>White Spread Foods</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/style3.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/select2.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/select2.full.min.js"></script>
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

	<c:if test="${user.business_name == 'Dairy'}">
		<style>
			.background-image-class {
				background-image : url("img/dairy.jpg");
			}
		</style>	
	</c:if>
	<c:if test="${user.business_name == 'Seeds'}">
		<style>
			.background-image-class {
				background-image : url("img/seeds.jpg");
			}
		</style>	
	</c:if>
	<c:if test="${user.business_name == 'CropCare'}">
	<style>
			.background-image-class {
				background-image : url("img/seeds.jpg");
			}
		</style>
	</c:if>
    </head>
<body class = "background-image-class">
<%-- <sec:authentication var="user" property="principal" /> --%>
<span id = "userRole" style="display:none;">
<sec:authorize access="hasRole('ROLE_DEALER')">dealer</sec:authorize>
<sec:authorize access="hasRole('ROLE_RETAILER')">retailer</sec:authorize>
</span>
<c:url value="/logout" var="logoutUrl" />
    	<!-- csrt for log out-->
<form action="${logoutUrl}" method="POST" id="logoutForm">
  <input type="hidden" 		name="${_csrf.parameterName}"		value="${_csrf.token}" />
</form>
    <div class="container-fluid">
        <div class="row">
            <nav class="navbar navbar-default mobile-navbar">
                <div>
                
                    <div class="navbar-header">
                    <button type="button" class="navbar-toggle pull-left" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <span class="welcomtxt"><p class="para-welcomtxt"> Welcome</p>
                       <span class="user-text">${user.firstname}</span></span>
                    <!-- <a class="navbar-brand" href="#">Welcome</a> -->
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a onclick="javascript:logoutSubmit()">Logout</a></li> 
                    </ul>
                    </div>
                    <%-- <div class="mobile-header text-center">
                        Welcome<br>
                        <h3>${user.firstname}</h3>
                    </div> --%>
                </div>
            </nav>

            <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- <div class="navbar-header">
                    <a class="navbar-brand" href="#">Logo</a>
                </div> -->
                
                <ul class="nav navbar-nav navbar-right">
                    <!-- <li><a href="#">Welcome <strong>Shree Traders </strong><i class="fas fa-caret-down"></i></span></a></li> -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Welcome <strong>${user.firstname}</strong></span>
                        <span class="caret"></span></a>
                        <ul class="dropdown-menu">
<!--                             <li><a href="#">Profile</a></li> -->
<!--                             <li><a href="#">Settings</a></li> -->
<!--                             <li><a href="#">Log Out</a></li> -->
                            <li><a onclick="javascript:logoutSubmit()">Logout</a></li> 
                        </ul>
                    </li>
                </ul>

                <!-- <div class="col-xs-12 mobile-navlist">
                    <div>
                        <ul class="nav nav-pills">
                            <li class="active"><a data-toggle="pill" href="#menu1">My Task List</a></li>
                            <li><a data-toggle="pill" href="#menu2">My Billing</a></li>
                            <li><a data-toggle="pill" href="#menu3">Retailers Orders </a></li>
                        </ul>
                    </div>    
                </div> -->

            </div>
            </nav>
            
            
      <!--   <div class="container">
		<div class="row">
		<div class="col-xs-12">
			<div class="flash_box">
			<p class="flash_txt">We are upgrading our systems and will not be available from 17th August 2019 6:00 AM to 19th August 2019 6 AM. Inconvenience is regretted.</p>
		</div>
		</div>	
	</div>
	</div> -->

           <div class="addItemDiv">
        <div class="container">
            <div class="col-md-8 col-md-offset-2">
                <div class="bckbtn_new">
                	<a href="<c:url value = "/inner?tid=1"/>">
	                    <button class="btn-green">
	                        <span class="glyphicon glyphicon-arrow-left"></span> Back
	                    </button>
                    </a>
                </div>
                <div class="mainCont">
                    <h2>
                        <span>Create Order</span>
                    </h2>
                    <form name="add_form" id="add_form">
                    <div class="form-horizontal">
                        <div class="form-group new-class">
                            <label class="col-xs-6 control-label padTop">Product :</label>
                            <div class="col-xs-6">
                            
<%--                             <h4>${productTypeId}</h4> --%>
                                <select class="form-control" id="product_type_list">
	                                <option value="All">[Select]</option>
	                                
								    
								    <sec:authorize access="hasAnyRole('ROLE_DEALER')">
								         	
								         <c:forEach items="${productTypeList}"  var="item" varStatus="status">
								        	 <option value = "${item.productTypeid}">${item.productType}</option>
								         
								         
								    	 </c:forEach>
								    </sec:authorize>
								    <sec:authorize access="hasAnyRole('ROLE_RETAILER')">
								         	
								         <c:forEach items="${productTypeList}"  var="item" varStatus="status">
<%-- 								        	 <option value = "${item.productTypeid}">${item.productType}</option> --%>
											
								      
											
											<c:if test="${newRecord == '1' and (SPART) != '0'}">	 
												<%-- <c:if test="${(item.productTypeid) == (productTypeId) }">	 
													<option value = "${item.productTypeid}" disabled = "true">${item.productType}</option>
												</c:if> --%>
												<c:if test="${(item.productTypeid) != (SPART) }">	 
													<option value = "${item.productTypeid}" selected>${item.productType}</option>
												</c:if>
												
												
											</c:if>
											<c:if test="${newRecord == '1' and (SPART) == '0'}">	 
													<option value = "${item.productTypeid}" >${item.productType}</option>
												
											</c:if>
											<c:if test="${newRecord == '0' }">	 
												<c:if test="${(item.productTypeid) == (productTypeId) }">	 
													<option value = "${item.productTypeid}" selected>${item.productType}</option>
												</c:if>
											</c:if>
								  
								         	
								         	
								    	 </c:forEach>
								    </sec:authorize>
								    
                                </select> 
                            </div>
                            <input type="hidden" value="${isOrderExists}" id="is_order_exists">
<%--                             <h2>${hId}</h2> --%>
                            <input type="hidden" value="${hId}" id="headerID">
                        </div>

                        <div class="form-group new-class">
                            <label class="col-xs-6 control-label">Product Name :</label>
                            <div class="col-xs-6">
                                <select class="form-control" id="productcodelist"  onclick="setFieldData(this);">
                                </select>
                                
                            </div>
                        </div>

                        <!-- <div class="form-group">
                            <label class="col-xs-6 control-label padTopRem">Description
                                :</label>
                            <div class="col-xs-6">
                                <label><span id="productdes"></span></label>
                            </div>
                        </div> -->
                       <label><span id="productdes" style="display:none;" disabled="disabled"></span></label>
                        <div class="form-group new-class">
                            <label class="col-xs-6 control-label">Quantity :</label>
                            <c:if test="${user.business_name == 'Seeds'}">
                            <div class="col-xs-6">
<!--                                 <input type="Number" class="form-control" id="quantity" min="0"> -->
                                <input type="text" class="form-control" id="quantity" autocomplete="off" onkeyup="checkLength(this)" maxlength="6"
                                		onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13 || event.charCode == 46) ? null : event.charCode >= 48 && event.charCode <= 57" 
                                		onfocusout ="checkIFPositiveNumber(this.value,event);" 
                                		onfocus ="checkIFPositiveNumber(this.value,event);" />
                            </div>
                            </c:if>
                            <c:if test="${user.business_name == 'Dairy'}">
                            <div class="col-xs-6">
<!--                                 <input type="Number" class="form-control" id="quantity" min="0"> -->
                                <input type="text" class="form-control" id="quantity" autocomplete="off" onkeyup="checkLength(this)" maxlength="6" 
                                		onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13 ) ? null : event.charCode >= 48 && event.charCode <= 57" 
                                		onfocusout ="checkIFPositiveNumber(this.value,event);" 
                                		onfocus ="checkIFPositiveNumber(this.value,event);" />
                            </div>
                            </c:if>
                              <c:if test="${user.business_name == 'CropCare'}">
                            <div class="col-xs-6">
<!--                                 <input type="Number" class="form-control" id="quantity" min="0"> -->
                                <input type="text" class="form-control" id="quantity" autocomplete="off" onkeyup="checkLength(this)" maxlength="6" 
                                		onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13 ) ? null : event.charCode >= 48 && event.charCode <= 57" 
                                		onfocusout ="checkIFPositiveNumber(this.value,event);" 
                                		onfocus ="checkIFPositiveNumber(this.value,event);" />
                            </div>
                            </c:if>
                        </div>

                        <div class="form-group new-class">
                            <label class="col-xs-6 control-label padTopRem">Ordering Unit :</label>
                            <div class="col-xs-6">
                                <!--                            <input type="text" class="form-control" id="productunit"> -->
                                <label><span id="productUnit" disabled="disabled"></span></label> <input type="hidden" class="form-control" id="productPrice">
                                <input type="hidden" name="uom" id=uom />
                            </div>
                        </div>
						
                        <div class="form-group new-class">
                            <label class="col-xs-6 control-label padTopRem"><c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user_role ne 'RETAILER'}">Value :</c:if></label>
                            <div class="col-xs-6">
                                <input type="hidden" class="form-control" id="productPrice">
                                &nbsp;<label id="productPrice1Label"><span id="productValue" disabled="disabled"></span></label>
                            </div>
                        </div>

                        <div class="form-group new-class">
                            <label class="col-xs-6 control-label">Indent Date :</label>
                            <div class="col-xs-6">
                                <input type="text" class="form-control datepicker hasDatepicker" autocomplete="off" id="indent_date" disabled="disabled" >
                            </div>
                        </div>

                        
                        <sec:authorize access="hasAnyRole('ROLE_DEALER')"> 
								<div class="form-group new-class">
		                            <label class="col-xs-6 control-label padTopRem">Outstanding Crate :</label>
		                            <div class="col-xs-6">
		                                <!--                            <input type="text" class="form-control" id="limit"> -->
		                                <label><span id="limit" disabled="disabled">${creditLimit.creditlimit}</span></label>
		
		                            </div>
		                            
		                        </div>  
		                        	<div class="form-group new-class">
		                            <label class="col-xs-6 control-label padTopRem">Outsatanding Amount :</label>
		                            <div class="col-xs-6">
		                                <!--                            <input type="text" class="form-control" id="limit"> -->
		                                <c:choose>
		                                <c:when test="${outstanding ne null}">
		                                <label><span id="limit" disabled="disabled">${outstanding}</span> As on Date : ${asondate}</label>
		                               </c:when>
		                               <c:otherwise>
		                               <label><span id="limit" disabled="disabled">0.00</span> As on Date :${asondate} <%-- <%= new SimpleDateFormat("dd-MM-yyy").format(new java.util.Date()) %> --%></label>
		                               </c:otherwise>
		                                </c:choose>
		                            </div>
		                            
		                        </div>  
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ROLE_RETAILER')"> 
								<div class="form-group">
		                            <label class="col-xs-6 control-label padTopRem" style="display:none;">Limit :</label>
		                            <div class="col-xs-6">
		                                <!--                            <input type="text" class="form-control" id="limit"> -->
		                                <label style="display:none;"><span id="limit" disabled="disabled">${creditLimit.creditlimit}</span></label>
		                            </div>
		                        </div>  
						</sec:authorize>
                        <div class="form-group">
                            <div class="col-xs-12 text-center">
                                <button type="button" class="btn-green add" data-toggle="modal" onclick="validateForm(this)">Add</button>
                                <button type="button" class="btn btn-info" data-toggle="modal"  id="viewClass" data-target="#viewModal" disabled="disabled">View</button>
<!--                                 <button type="button" class="btn btn-info" id="saveClass" onclick="saveRecords()" disabled="disabled">Save</button> -->
                            </div>
                        </div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
<!--Validation Alert Dialog  -->
    <div id="addModal" class="modal fade" role="dialog">
        <div class="modal-dialog" style="width: 700px; margin: 56px auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Create Order</h4>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger" id="alert_danger_text">Please select a Product</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>


<!-- View Modal to display Added Records -->
			<div id="viewModal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Order Value</h4>
						</div>
						<div class="modal-body">
							<div class="pendingUpdate respTable">
							
							<form action="createOrders" id="createOrders" name="createOrders" CommandName="ItemtableDto" method="POST">
								<input type="hidden"name="${_csrf.parameterName}" value="${_csrf.token}" id= "csrf_token"/>	
								<div class="table-responsive">						   		
								<table class="table table-bordered" id="view_modal_table">
									<thead>
										<tr>
											<th class="fcol">Material</th>
											<th>Quantity</th>
											<th>Due Date</th>
											<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user_role ne 'RETAILER'}">
												<th>Value</th>
												<th>Rate</th>
											</c:if>
											<!--                                <th>Unit</th> -->
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<!-- <tr>
											<td data-title="Material">Saboro Tea Special Homogenised
												Milk</td>
											<td data-title="Quantity"><input type="Number"
												id="quantity10" class="new_Value form-control" value="7"></td>
											<td data-title="Due Date"><input disabled="" type="text"
												id="dueDate10"
												class="form-control datepicker dateReq hasDatepicker"
												value="17/08/2018"></td>
											<td data-title="Material">0</td>
											<td data-title="Material">0.00</td>
											<td data-title="Action"><button type="button"
													class="btn-del" onclick="deleteRecord(this)" data-posnr="10">
													<span class="glyphicon glyphicon-remove"></span>
												</button></td>
										</tr> -->
									</tbody>
								</table>
								</div>
								<div>
									<b>Comments</b>
                                    <input type="text" class="form-control" id="retailer_comments" name='items[0].comments' autocomplete="off" maxlength="200" placeholder="Please Enter 200 Characters Only"/>
                                    
								</div>
								
								<div class="text-right form-group">
<%-- 									<label><c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user_role ne 'RETAILER'}">Order Value : <span id="total_value"><c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user_role ne 'RETAILER'}">0</c:if></span></label> --%>
									<sec:authorize access="hasRole('ROLE_DEALER')"><label>Order Value : <span id="total_value">0</span></label></sec:authorize>
									<sec:authorize access="hasRole('ROLE_RETAILER')"><input type="hidden" id="total_value"/></sec:authorize>
									
								</div>

								<div class="text-right">
<!-- 								old	<button type="submit" class="btn btn-info" id="view_save" disabled="disabled">Save</button> -->
<!-- 									<button type="button" onclick="saveOrder();" class="btn btn-info" id="view_save" disabled="disabled" data-dismiss="modal">Save</button> -->
<!-- 									old<button type="submit" class="btn btn-info" id="view_save" onclick="saveRecords()" disabled="disabled">Save</button> -->
								</div>
                                          <input type="hidden" id="sales_org" name="items[0].sales_org" value="${salesOrg}"/>

							</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
								
							<button type="button" onclick="saveOrder('${user.user_role}');" class="btn btn-info" id="view_save" disabled="disabled" data-dismiss="modal">Save</button>
						</div>
					</div>
				</div>
			</div>
			
<!--END View Modal to display Added Records -->


 <!--Validation Positive Alert Dialog -->
    <div id="showAlert" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="showAlert_title">ALERT</h4>
                </div>
                <div class="modal-body">
<!--                     <div class="alert confirmed" id="showAlert_text"></div> -->
                    <h4 class="alert" id="showAlert_text"></h4>
<!--                     <div class="alert alert_danger" id="showAlert_text_negative"></div> -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


<!-- <script src="js/select2.full.min.js"></script> -->
<script src="js/save-order.js"></script>

<script type="text/javascript">

	function logoutSubmit(){
		
		document.getElementById("logoutForm").submit();
	}
	
	
	
	// Product Type on Change functionality .....
	// Product Category is dependent on Product type
    $("#product_type_list").on('change', function() {
  	  
    	setProductDetailsData(this.value);
		  	 /*  var productTypeId = this.value;
		  	  
		  	  console.log("productTypeId===>>>"+productTypeId);
		  	  
		  	  $.ajax({
		   		 type:"GET",
		//   		 dataType : "json",
// 		   	    url :"http://localhost:8080/Dairy/getProducts",
		   	    url :"getProducts",
		   	    data:{
		   	    	productTypeId	:	productTypeId,
		   	    	 random 		:	Math.random()
		   	    },
		   	    success:function(data,req,res){
		   	   
		//    	    	console.log("DATA==========="+JSON.stringify(data));
		   	    	
		   	    	$("#productcodelist").empty();
		   	    	
		   	    	var productsOptions = "<option value='All' style='display:none;'></option>";
// 		   	    	var productsOptions = "";
		   	    	var dataVal = JSON.stringify(data);    	    
		   	    	
		   	    	
		   	    	
		   	    	for(var i = 0; i < data.length; i++ ){
		   	    		var srNo = i+1;
		   	    		productsOptions = productsOptions + 
				     	    		srNo+". <option value="+data[i].matnr+" data-product-value='"+ data[i].kbetr+"' data-product-unit='"+data[i].vrkme +"' >"+data[i].maktx+"</option>";
		   	    			
		   	    	}
		   	    	
		   	    	
		   	     // Single select example if using params obj or configuration seen above
				    var configParamsObj = {
				        placeholder		: 'Select an option...', // Place holder text to place in the select
				        minimumResultsForSearch: 3 // Overrides default of 15 set above
				    };
				    $("#productcodelist").select2(configParamsObj);
				    
				    
				    
		   	    	
		   	    	// Appending product category options 
		   	    	$("#productcodelist").append(productsOptions);
		   	    	
		   	    	//Setting Field Data based on product Category
		   	    	setFieldData($("#productcodelist"));
		   	   	 
		   	   	 
		   	    },
		   	    error:function(oError){
		   	   	
		   	    }
		   	   });  */
  	  
  });
    
	function setProductDetailsData(productTypeId){
// 		 var productTypeId = this.value;
	  	  var headerID = document.getElementById("headerID").value;
	  	  console.log("productTypeId===>>>"+productTypeId+"=========>>>>"+headerID);
	  	  
	  	  $.ajax({
	   		 type:"GET",
	//   		 dataType : "json",
//	   	    url :"http://localhost:8080/Dairy/getProducts",
	   	    url :"getProducts",
	   	    data:{
	   	    	productTypeId	:	productTypeId,
	   	    	headerID		:	document.getElementById("headerID").value,
	   	    	 random 		:	Math.random()
	   	    },
	   	    success:function(data,req,res){
	   	   
// 	   	    	console.log("DATA===LineNo 501========"+JSON.stringify(data));
	   	    	
	   	    	$("#productcodelist").empty();
	   	    	
	   	    	var productsOptions = "<option value='All' style='display:none;'></option>";
// 	   	    	var productsOptions = "<option value='All' ></option>";
//	   	    	var productsOptions = "";
	   	    	var dataVal = JSON.stringify(data);    	    
	   	    	
	   	    	
	   	    	
	   	    	for(var i = 0; i < data.length; i++ ){
	   	    		
	   	    		var srNo = i + 1;
	   	    		console.log("KONWA==="+data[i].konwa+"===srNo==="+srNo);
	   	    	 var UNIT = data[i].konwa + " / " + data[i].vrkme;
	   	    		
	   	    		productsOptions = productsOptions + 
//      	    		"<option value="+data[i].matnr+" data-product-value='"+ data[i].kbetr+"' data-product-unit='"+data[i].vrkme +"' >"+data[i].maktx+"</option>";
     	    		"<option value="+data[i].matnr+" data-product-value='"+ data[i].kbetr+"' data-product-unit='"+ UNIT +"' >"+srNo+". "+data[i].maktx+"</option>";
	   	    			
	   	    	}
	   	    	
	   	    	
	   	     // Single select example if using params obj or configuration seen above
			    var configParamsObj = {
			        placeholder		: 'Select an option...', // Place holder text to place in the select
			        minimumResultsForSearch: 3 // Overrides default of 15 set above
			    };
			    $("#productcodelist").select2(configParamsObj);
			    
			    
			    
	   	    	
	   	    	// Appending product category options 
	   	    	$("#productcodelist").append(productsOptions);
	   	    	
	   	    	//Setting Field Data based on product Category
	   	    	setFieldData($("#productcodelist"));
	   	   	 
	   	   	 
	   	    },
	   	    error:function(oError){
	   	   	
	   	    }
	   	   }); 
	}
	
	
	//============Check if value not equal to All==========================
		if ($("#product_type_list").val() !== "All") {
		    
// 			console.log("=========INside if =========");
			setProductDetailsData($("#product_type_list").val());
		    
		}
		
	
	
    
    //================ Date format to display as Indent Date
    	function formatDate() {
    	    var d = new Date(),
    	        month = '' + (d.getMonth() + 1),
    	        day = '' + d.getDate(),
    	        year = d.getFullYear();

    	    if (month.length < 2) {month = '0' + month;}
    	    if (day.length < 2)
    	    {
    	    	day = '0' + day;
    	    }
    	    return [day, month, year].join('-');
    	}
        $('#indent_date').val(formatDate());
//     });​




//=================called when click on ADD Button
	var itemsAdded = [];
	function validateForm(object){
		
		
// 		alert("productcodelist===>>>"+document.getElementById("productcodelist").value);
		
// 		console.log("productcodelist===>>>"+document.getElementById("productcodelist").value);

		if(document.getElementById("product_type_list").value == "All" || document.getElementById("productcodelist").value == "All" || document.getElementById("productcodelist").value == ""){
			$("#addModal").modal("show");
			document.getElementById("alert_danger_text").innerHTML = "Please Select Value!!"
		}
		else if(document.getElementById("quantity").value == ""){
			$("#addModal").modal("show");
			document.getElementById("alert_danger_text").innerHTML = "Please fill quantity!!"
		}
		else{
			
// 			alert("product_type_list===>>>"+document.getElementById("product_type_list").value);
			// storing data in array object
			var obj = {
				"product_type_id" 	: document.getElementById("product_type_list").value,
				"product_type_text" : $("#product_type_list option:selected").text(),
				"product_cat_id" 	: document.getElementById("productcodelist").value,
				"product_cat_text" 	: $("#productcodelist option:selected").text(),
				"quantity" 			: document.getElementById("quantity").value,
				"unit"	 			: document.getElementById("uom").value,
// 				"header_id"	 		: document.getElementById("is_order_exists").value,//===commented for testing purpose
				"header_id"	 		: document.getElementById("headerID").value,//===commented for testing purpose
// 				"header_id"	 		: 0,
				"value" 			: (document.getElementById("productPrice").value * document.getElementById("quantity").value).toFixed(2),
				"rate"				: document.getElementById("productPrice").value,
				"uuid" 				: guid()
			};

			orderValue = (document.getElementById("productPrice").value * document.getElementById("quantity").value).toFixed(2);
			setOrderValue(orderValue);
			
			// Adding Items object to itemsAdded array
			itemsAdded.push(obj);
		
			if(itemsAdded.length > 0){
// 				$("#addModal").modal("show");
// 				document.getElementById("alert_danger_text").innerHTML = "Item Added Successfully !!!";
				//alert(itemsAdded[0].product_type_id);
				//alert(itemsAdded.includes(itemsAdded[0].product_type_id));
				for ( var i = 0; i < itemsAdded.length; i++){

					for (var j = i+1; j< itemsAdded.length; j++){

					if (itemsAdded[i].product_cat_id === itemsAdded[j].product_cat_id){

					//	console.log(itemsAdded[i]);console.log(itemsAdded[j]);
					//console.log(itemsAdded[i].product_cat_id);
					//console.log(itemsAdded[j].product_cat_id);
					showAlert('Added Item Already exists','Please Edit Item in View Tab !!!','positive');
					let removedItems = itemsAdded.splice(j)
					// this is how to remove items, n defines the number of items to be removed,
					// starting at the index position specified by pos and progressing toward the end of array.

					console.log(removedItems)
					return false;
					}
					}

					}
				showAlert('Create Order','Item Added Successfully !!!','positive');
				
				
				$( "#viewClass" ).prop( "disabled", false );
				$( "#saveClass" ).prop( "disabled", false );
				$( "#product_type_list" ).prop( "disabled", true );
				
				/* 
// 			    var pop_up_selection = $('.select2-results__options');
			    var pop_up_selection = $('#select2-productcodelist-results');

			    if ($("#productcodelist").val() !== "") {
			      // hide the selected values
			      console.log("pop_up_selection==========="+pop_up_selection);
			       pop_up_selection.find("li[aria-selected=false]").hide();

			      console.log("-----------INside IF-------------"+pop_up_selection.find("li[aria-selected=true]"));
			    }
			    else {
			      // show all the selection values
// 			      pop_up_selection.find("li[aria-selected=true]").show();
			      pop_up_selection.find("li[aria-selected=true]").hide();
			      console.log("--------INside ELSE---------");
			    } 

				 */
				
				
				//Reset Form Fields
// 				document.getElementById("productcodelist").value = 'All';
				$("#productcodelist").select2("val", "");
// 				document.getElementById("productcodelist").value = '';
				document.getElementById("quantity").value = '';
				document.getElementById("productValue").innerHTML = '';
				document.getElementById("productUnit").innerHTML = '';
				
			//Used to display added items in view modal
				viewAddedOrders();
				
			}
			
			
		}
		
			
	}
	
	
// Called when product code changes=========
	function setFieldData(object){

		$(object).select2()
		.on("select2:select", function (e) {
		    var selected_element = $(e.currentTarget);
		    var select_val = selected_element.val();
		    
		    
		    //console.log("===>>>"+select_val+"===="+$(object).find(':selected').attr('data-product-value'));
		    
		    var productValue = $(object).find(':selected').attr('data-product-value') 
							+ " " +$(object).find(':selected').attr('data-product-unit');
		    	if($('#userRole').text().trim() != 'retailer')
		    		document.getElementById("productValue").innerHTML = productValue+" [As of today]";
				
// 				console.log("productValue===>>"+productValue);
				if($(object).find(':selected').attr('data-product-value') == undefined){
					document.getElementById("productValue").innerHTML = "";
				}
				
				var productNameText = $(object).find(":selected").text();
				var pdName = productNameText.split(":");
				
				document.getElementById("uom").value = $(object).find(':selected').attr('data-product-unit');  
				
				document.getElementById("productUnit").innerHTML = "";
				
				if($(object).find(':selected').attr('data-product-unit') != undefined){
					document.getElementById("productUnit").innerHTML 
					= $(object).find(':selected').attr('data-product-unit');	
				}
				
				
				if(pdName[1] != undefined){
					document.getElementById("productUnit").innerHTML = pdName[1];
				}
				
				
				$("#productPrice").val($(object).find(':selected').attr('data-product-value'));
		    
		    
		});
	
		/* var productValue = $(object).find(':selected').attr('data-product-value') 
					+ " " +$(object).find(':selected').attr('data-product-unit');
		document.getElementById("productValue").innerHTML = productValue+" [As of today]";

		console.log("productValue===>>"+productValue);
		if($(object).find(':selected').attr('data-product-value') == undefined){
			document.getElementById("productValue").innerHTML = "";
		}
		
		var productNameText = $(object).find(":selected").text();
		var pdName = productNameText.split(":");
		
		document.getElementById("uom").value = $(object).find(':selected').attr('data-product-unit');  
		
		document.getElementById("productUnit").innerHTML = "";
		
		if($(object).find(':selected').attr('data-product-unit') != undefined){
			document.getElementById("productUnit").innerHTML 
			= $(object).find(':selected').attr('data-product-unit');	
		}
		
		
		if(pdName[1] != undefined){
			document.getElementById("productUnit").innerHTML = pdName[1];
		}
		
		
		$("#productPrice").val($(object).find(':selected').attr('data-product-value')); */
	}


// This function is used to set Limit label 
	function  setOrderValue(orderValue){
		var limit = document.getElementById("limit").innerHTML;
		var limitValue = Number(limit) - Number(orderValue)  ;
		
		document.getElementById("limit").innerHTML = limitValue.toFixed(2);
		
	}
	
	
	//=======================
		
		// Setting default configuration here or you can set through configuration object as seen below
		$.fn.select2.defaults = $.extend($.fn.select2.defaults, {
		    allowClear: true, // Adds X image to clear select
		    closeOnSelect: true, // Only applies to multiple selects. Closes the select upon selection.
		    placeholder: 'Select...',
		    minimumResultsForSearch: 15 // Removes search when there are 15 or fewer options
		});
		
		$(document).ready(function () {
		
			   /*  // Single select example if using params obj or configuration seen above
			    var configParamsObj = {
			        placeholder: 'Select an option...', // Place holder text to place in the select
			        minimumResultsForSearch: 3 // Overrides default of 15 set above
			    };
			    $("#singleSelectExample").select2(configParamsObj); */
			    
		});
		
		
		
		
	
</script>
<script type="text/javascript" src="js/view-added-orders.js"></script>                        
<script type="text/javascript" src="js/common-js.js"></script>                        
<script type="text/javascript" src="js/auto-logout.js"></script>                        
    
</body>

</html>