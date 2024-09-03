<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ page session="true" %>
<!DOCTYPE html>

<html>
<sec:authentication var="user" property="principal" />
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9"> <![endif]-->
 <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--         <title>Dairy App</title> -->
        <title>White Spread Foods</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/style2.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" 
        integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
       
<!--        	<link rel="stylesheet" href="css/business-image.css">  -->



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
<%-- <sec:authentication var="principal" property="principal" /> --%>
<span id = "userRole"  style="display:none;">
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
           <%--  <nav class="navbar navbar-default mobile-navbar">
                <div>
                    <div class="navbar-header">
                    <button type="button" class="navbar-toggle pull-left" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <!-- <a class="navbar-brand" href="#">Welcome</a> -->
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
<!--                         <li class="active"><a href="#">Profile</a></li> -->
<!--                         <li><a href="#">Settings</a></li> -->
                        <li><a onclick="javascript:logoutSubmit()">Log Out</a></li> 
                    </ul>
                    </div>
                    <div class="mobile-header text-center">
                        Welcome<br>
                        <h3>${user.firstname} ${user.lastname}</h3>
<!--                         <h3>ABC</h3> -->
                    </div>
                </div>
            </nav> --%>

            <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- <div class="navbar-header">
                    <a class="navbar-brand" href="#">Logo</a>
                </div> -->
<%--                 <sec:authentication var="user" property="principal" /> --%>
                <ul class="nav navbar-nav navbar-right">
                    <!-- <li><a href="#">Welcome <strong>Shree Traders </strong><i class="fas fa-caret-down"></i></span></a></li> -->
                    <li class="dropdown">  
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Welcome <strong> ${user.firstname} </strong></span>       
                        <span class="caret"></span></a> 
                        <ul class="dropdown-menu">
<!--                             <li><a href="#">Profile</a></li> -->
<!--                             <li><a href="#">Settings</a></li> -->
                            <li><a onclick="javascript:logoutSubmit()">Log Out</a></li>
                        </ul>
                    </li>
                </ul>

            </div>
            </nav>

            <div class="col-xs-12 desktop-navlist">
                <div>
                    <ul class="nav nav-pills" id="myTabs">
						
						
						<c:choose>
         
					         <c:when test = "${active_class == '1'}">
					            <li class="active" data-tab = "menu1"><a  href="<c:url value = "/inner?tid=1"/>" >Pending</a></li>
					            <li data-tab = "menu4"><a  href="<c:url value = "/inner?tid=4"/>" >Confirmed</a></li>
								<li data-tab = "menu5"><a  href="<c:url value = "/inner?tid=5"/>">Rejected</a></li>
								<sec:authorize access="hasAnyRole('ROLE_DEALER')">
									<%-- <li data-tab = "menu2" ><a  href="<c:url value = "/inner?tid=2"/>">My Billing</a></li> --%>
										<c:if test="${user.is_retailer_exists == '0'}">	 
			<%-- 								<li data-tab = "menu3"><a href="<c:url value = "/inner?tid=3"/>" >Retailers Orders</a></li>
			 --%>							</c:if>
								</sec:authorize>
								
								
					         </c:when>
					         
					         <c:when test = "${active_class == '4'}">
					            <li data-tab = "menu1"><a  href="<c:url value = "/inner?tid=1"/>" >Pending</a></li>
					            <li data-tab = "menu4" class="active"><a  href="<c:url value = "/inner?tid=4"/>" >Confirmed</a></li>
								<li data-tab = "menu5"><a  href="<c:url value = "/inner?tid=5"/>">Rejected</a></li>
								<sec:authorize access="hasAnyRole('ROLE_DEALER')"> 
<%-- 									<li data-tab = "menu2" ><a  href="<c:url value = "/inner?tid=2"/>">My Billing</a></li>
 --%>									<c:if test="${user.is_retailer_exists == '0'}">
		<%-- 								<li data-tab = "menu3"><a href="<c:url value = "/inner?tid=3"/>" >Retailers Orders</a></li>
		 --%>							</c:if>	  
								</sec:authorize>
					         </c:when>
					         
					         <c:when test = "${active_class == '5'}">
					            <li data-tab = "menu1"><a  href="<c:url value = "/inner?tid=1"/>" >Pending</a></li>
					            <li data-tab = "menu4"><a href="<c:url value = "/inner?tid=4"/>" >Confirmed</a></li>
								<li data-tab = "menu5" class="active"><a  href="<c:url value = "/inner?tid=5"/>">Rejected</a></li>
								<sec:authorize access="hasAnyRole('ROLE_DEALER')">
<%-- 									<li data-tab = "menu2" ><a  href="<c:url value = "/inner?tid=2"/>">My Billing</a></li>
 --%>									<c:if test="${user.is_retailer_exists == '0'}"> 
	<%-- 									<li data-tab = "menu3"><a href="<c:url value = "/inner?tid=3"/>" >Retailers Orders</a></li>
	 --%>								</c:if>  
								</sec:authorize>
					         </c:when>
					         
					         <c:when test = "${active_class == '2'}">
					            <li data-tab = "menu1"><a  href="<c:url value = "/inner?tid=1"/>" >Pending</a></li>
					            <li data-tab = "menu4"><a href="<c:url value = "/inner?tid=4"/>" >Confirmed</a></li>
								<li data-tab = "menu5"><a  href="<c:url value = "/inner?tid=5"/>">Rejected</a></li>
								<sec:authorize access="hasAnyRole('ROLE_DEALER')">
							<%-- 		<li data-tab = "menu2" class="active"><a  href="<c:url value = "/inner?tid=2"/>">My Billing</a></li>
							 --%>		<c:if test="${user.is_retailer_exists == '0'}"> 
<%-- 										<li data-tab = "menu3"><a href="<c:url value = "/inner?tid=3"/>" >Retailers Orders</a></li>
 --%>									</c:if>  
								</sec:authorize>
					         </c:when>
					         <c:when test = "${active_class == '3'}">
					            <li data-tab = "menu1"><a  href="<c:url value = "/inner?tid=1"/>" >Pending</a></li>
					            <li data-tab = "menu4"><a href="<c:url value = "/inner?tid=4"/>" >Confirmed</a></li>
								<li data-tab = "menu5"><a  href="<c:url value = "/inner?tid=5"/>">Rejected</a></li>
								<sec:authorize access="hasAnyRole('ROLE_DEALER')">
								<%-- 	<li data-tab = "menu2" ><a  href="<c:url value = "/inner?tid=2"/>">My Billing</a></li>
								 --%>	<c:if test="${user.is_retailer_exists == '0'}"> 
<%-- 										<li data-tab = "menu3" class="active"><a href="<c:url value = "/inner?tid=3"/>" >Retailers Orders</a></li>
 --%>									</c:if>  
								</sec:authorize>
					         </c:when>
					         
					         <c:otherwise>
					            
					         </c:otherwise>
					    </c:choose>
						
						<%-- <sec:authorize access="hasAnyRole('ROLE_DEALER')"> 
								<li><a data-toggle="pill" href="#menu3">Retailers Orders</a></li>  
						</sec:authorize> --%>
								 

                    </ul>
                </div>    
            </div>

	 <div class="container">
		<div class="row">
		<div class="col-xs-12">
			<div class="flash_box">
			<p class="flash_txt"> ${user.scheme}</p>
		</div>
		</div>	
	</div>
	</div>

            <div class="col-md-12">
                    <div class="tab-content">

                        <!-- Tab 1 Content -->
<!--                         <div id="menu1" class="tab-pane fade in active"> -->
                        <div id="menu1" class="tab-pane fade">
                            <div class="col-xs-12 mobile-create-filter">
<!--                                     <a><span data-toggle="modal" data-target="#filterTask" class="pull-right create-filter-icons"><i class="fas fa-filter fa-2x"></i></span></a>  -->
<%--                                     <a href="<c:url value = "/createorder"/>"><span data-toggle="modal" class="pull-right label label-danger create-filter-icons"><i class="fas fa-edit"></i> Create</span></a> --%>
                                    
                                    <sec:authorize access="hasAnyRole('ROLE_DEALER')"> 
											<a href="<c:url value = "/createorder"/>" style="float:left;"><span data-toggle="modal" class="pull-right label label-danger create-filter-icons"><i class="fas fa-edit"></i> Create</span></a>
									</sec:authorize> 


									<!-- Commented for Testing purpose-->
									<sec:authorize access="hasAnyRole('ROLE_RETAILER')"> 
										<%-- <c:if test = "${isOrderConfirmed == '0' }"> 
											<c:choose>
											    <c:when test="${isOrderExists == '0'}">
											        
											        <a href="<c:url value = "/createorder"/>"><span data-toggle="modal" class="pull-right label label-danger create-filter-icons"><i class="fas fa-edit"></i> Create</span></a>
	<!-- 										        <a data-toggle="modal" data-target="#confirmedOrder"> -->
											    </c:when>    
											    <c:otherwise>
											        <a data-target="#isOrderExists" data-toggle="modal"><span data-toggle="modal" class="pull-right label label-danger create-filter-icons"><i class="fas fa-edit"></i> Create</span></a>
											    </c:otherwise>
											</c:choose>
										</c:if>
										<c:if test = "${isOrderConfirmed == '1' }">
											<h3><span style="background-color: yellow;font-weight:bold;"><strong>You have already placed today's order and it has been confirmed.</strong></span></h3> 
										</c:if> --%>
										
										
										
										<c:choose>
											<c:when test = "${totalOrderPlaced  == '0'}">
<%-- 												<a href="<c:url value = "/createorder"/>"><span --%>
<%-- 												<a href="<c:url value = "/createorder"/>"><span --%>
												<a  style="float:left;" href="<c:url value = "/retailerCreateOrder?pId=${item.SPART}&newRecord=1&hId=0"/>"><span
													data-toggle="modal"
													class="pull-right label label-danger create-filter-icons">
														<i class="fas fa-edit"></i> Create
												</span></a>
											</c:when>
											<c:otherwise>
												<c:if test = "${isTodaysPOExists == '0'}">
<%-- 												<c:if test = "${isTodaysPOExists ne '0'}"> --%>
													<h3><span style="background-color: yellow;font-weight:bold;"><strong>You have already placed today's order.</strong></span></h3>
												</c:if>
												
												
												
											</c:otherwise>
											
										</c:choose>
										
										
									</sec:authorize> 
                            </div>                            
                            <div>
                            
	                            <c:forEach items="${headerList}" var="item" varStatus="status">
								    
	                                        
	                                        <input type="hidden"name="${_csrf.parameterName}" value="${_csrf.token}" id= "csrf_token"/>
<%-- 	                                       <h1><c:out value="AAA:-${item.FLAG}"></c:out></h1> --%>
											
											<c:choose>
	                                        
													
													<c:when test="${(item.FLAG == 'P') || (item.STATUS == 'Pending') || (item.FLAG == 'C1') || (item.FLAG == 'B1')}">
														
															<div class="col-xs-12 col-md-4">
		                                        				<div class="well well-confirmed">
	<!-- 		<a data-toggle="modal" data-target="#editOrder" > -->
															        <a data-toggle="modal" onclick="editOrder(${item.headerID},'${item.sync}',${item.SPART})" >
															         
							                                            <div>
							                                                <h4><strong>${item.headerID}</strong></h4>
							                                                <span class="pull-right pending"><i class="fas fa-dot-circle"></i> PENDING</span>
																		</div>  
							                                            <div class="date">
							                                                Created On : <span>${item.ERDAT}</span>
							                                                <c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user_role ne 'RETAILER'}">
							                                                   <h4 class="pull-right confirmed">Rs.&nbsp;<strong>${item.NETWR}</strong></h4>
							                                                </c:if>
							                                            </div>
							                                            <div>
							                                            	<h5><span class="">Number of Items : </span>
							                                                	<span >${item.noOfItems}</span>
							                                                </h5>
							                                                
							                                               <%--  <sec:authorize access="hasAnyRole('ROLE_RETAILER')"> 
<!-- 							                                                <button> -->
									                                                <a href="<c:url value = "/retailerCreateOrder?pId=${item.SPART}&newRecord=0&hId=${item.headerID}"/>"><span
																						data-toggle="modal"
																						class="pull-right confirmed create-filter-icons">
																							<i class="fas fa-edit"></i> Edit
																					</span></a>
																					<%session.setAttribute("UserName", "${item.SPART}");%>
<!-- 																			</button> -->
																			</sec:authorize>	 --%>
							                                            </div>
							                                            
<%-- 							                                            <sec:authorize access="hasAnyRole('ROLE_RETAILER')"> --%>
								                                            <div >
								                                            	<h5><strong>${item.productType}</strong></h5>
								                                            </div>
<%-- 							                                            </sec:authorize> --%>
							                                            <div >
								                                            <c:if test="${item.sync == 'Y'}">
									                                            
									                                            	<h5 ><span style="background-color: yellow;font-weight:bold;"><strong>Sent For Approval</strong></span></h5>
									                                                
								                                            </c:if>
								                                            <c:if test="${item.sync == 'X'}">
									                                            
									                                            <h5 ><span style="background-color: Cyan;font-weight:bold;"><strong>Sent For RM Approval</strong></span></h5>
									                                            	<!-- <h5 >&nbsp;</h5> -->
									                                                
								                                            </c:if> 
							                                            </div>
							                                              
							                                             <%-- <sec:authorize access="hasAnyRole('ROLE_DEALER')">
							                                            	<h4>Comments : </h4>
							                                            	<span>${item.comments}</span>
							                                                <h4 class="pull-right confirmed"><strong>${item.NETWR}</strong></h4> 
																		</sec:authorize>   --%>                
			                                        				</a>
		                                        				 </div>                
	                                 						</div>
															
													</c:when>													
													
													
											</c:choose>
	                                        
								    
								</c:forEach>

                                  <!--   <div class="col-xs-12">
                                        <a data-toggle="modal" data-target="#createTask"  class="mobile-create">
                                            <span><i class="fas fa-plus fa-2x"></i></span>
                                        </a>
                                        <a data-toggle="modal" data-target="#filterTask"  class="mobile-filter">
                                            <span><i class="fas fa-filter fa-2x mobile-filter-icon"></i></span>
                                        </a>
                                    </div> -->
                                    
                                </div>

                                <!-- Create Order Task Modal -->
                                <div id="createTask" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                    
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Create Task</h4>
                                        </div>
                                        <div class="modal-body">
                                                <form class="form-horizontal" id="createTaskForm">
                                                    <div class="form-group">
                                                        <label for="sel1" class="col-xs-4 col-md-5">Product</label>
                                                        <!-- 
                                                        <div class="col-xs-8 col-md-7">
                                                            <select class="form-control" id="product">
                                                                <option selected>Select</option>
                                                                <option>Dairy</option>
                                                                <option>Dairy Product</option>
                                                            </select>
                                                        </div>
                                                       -->
                                                        <div class="col-xs-8 col-md-7" style="overflow: hidden;">
                                                            <select class="form-control" id="product_type_id_tl" >
                                                                <option selected>Select</option>
                                                                <c:forEach items="${productTypeList}"  var="item" varStatus="status">
															         <option value = "${item.productTypeid}">${item.productType}</option>
															    </c:forEach>
                                                            </select>
                                                        </div>
                                                        
                                                        
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="sel1" class="col-xs-4 col-md-5">Product Name</label>
                                                        <div class="col-xs-8 col-md-7">
                                                            <select class="form-control" id="product_name_tl">
                                                                <!-- <option>1</option>
                                                                <option>2</option>
                                                                <option>3</option>
                                                                <option>4</option> -->
                                                            </select>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group">
                                                        <label class="control-label col-xs-4 col-md-5" for="quantity">Quantity</label>
                                                        <div class="col-xs-8 col-md-7"> 
                                                            <input type="text" class="form-control" id="quantity" placeholder="Enter Quantity" autocomplete="off">
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label col-xs-4 col-md-5" for="unit">Ordering Unit</label>
                                                        <div class="col-xs-8 col-md-7"> 
                                                            <input type="text" class="form-control" id="unit" disabled autocomplete="off">
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label col-xs-4 col-md-5" for="value">Value</label>
                                                        <div class="col-xs-8 col-md-7"> 
                                                            <input type="text" class="form-control" id="value" disabled>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label col-xs-4 col-md-5" for="date">Indent Date</label>
                                                        <div class="col-xs-8 col-md-7"> 
                                                            <input type="text" class="form-control" id="date" disabled>
                                                        </div>
                                                    </div>                                                    

                                                    <div class="form-group">
                                                        <label class="control-label col-xs-4 col-md-5" for="limit">Limit</label>
                                                        <div class="col-xs-8 col-md-7"> 
                                                            <input type="text" class="form-control" id="limit" disabled>
                                                        </div>
                                                    </div>                                                                                                        


                                                  <div class="form-group"> 
                                                    <div class="col-xs-12 col-xs-12 text-center">
                                                      <button type="submit" class="btn btn-default">Submit</button>
                                                    </div>
                                                  </div>
                                                </form>                                                    
                                        </div>
                                        <!-- <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div> -->
                                        </div>
                                    
                                    </div>
                                </div>
                                
                                

                                <!-- Filter Order Task Modal -->
                                <div id="filterTask" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                    
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Filter Task</h4>
                                        </div>
                                        <div class="modal-body">
                                                <form class="form-horizontal" id="filterTaskForm" action="inner">
                                                    <div class="form-group">
                                                        <label for="sel1" class="col-xs-4 col-md-5">Filter Orders</label>
                                                        <input type="hidden" id="filterBy" name="filterBy" value="<%=session.getAttribute("filterBy")%>>"/>
                                                        <div class="col-xs-8 col-md-7" style="overflow: hidden;">
                                                            <select class="form-control" id="filterOrder" name="filterOrder">
                                                                <option value="all" selected >All</option>
                                                                <option value="C">Confirmed</option>
                                                                <option value="P">Pending</option>
                                                                <option value="R">Rejected</option>
                                                            </select>
                                                        </div>
                                                    </div>                                            

                                                      <div class="form-group"> 
                                                        <div class="col-xs-12 col-xs-12 text-center">
                                                          <button type="submit" class="btn btn-default">Submit</button>
                                                        </div>
                                                      </div>
                                                </form>   
                                            
                                        </div>
                                        
                                        </div>
                                    
                                    </div>
                                </div> 
                                
                                <!-- Confirmed Order Modal -->
                                <!-- <div id="confirmedOrder" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        Modal content
                                        <div class="modal-content">
                                            <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title" id="status_title">Confirmed Order</h4>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table table-hover" id="confirmed_order_table">
                                                    <thead>
                                                        <tr>
                                                        <th>Material</th>
                                                        <th>Qty</th>
                                                        <th>Confirmed Qty</th>
                                                        <th>Rejected Qty</th>
                                                        <th>Unit</th>
                                                        <th>Rate</th>
                                                        <th>Value</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div> -->
                        </div>


<!-- Tab 2 Content menu 4 Confirmed -->
                        <div id="menu4" class="tab-pane fade">
                            
                            <div>
	                            <c:forEach items="${headerList}" var="item" varStatus="status">
								    <h1></h1>
	                                        
<%-- 	                                        <input type="hidden"name="${_csrf.parameterName}" value="${_csrf.token}" id= "csrf_token"/> --%>
<%-- 		                                        <c:choose> --%>
<%-- 														<c:when test="${item.FLAG == 'C'}"> --%>
													<c:if test="${(item.FLAG == 'C')  || (item.FLAG == 'B') || (item.FLAG == 'C21') || (item.FLAG == 'B21')}">
															<div class="col-xs-12 col-md-4">
	                                        					<div class="well well-confirmed">
															
																<a data-toggle="modal" onclick="viewConfirmedOrder(${item.headerID},'Confirmed')" >
																
						                                            <div>
						                                                <h4><strong>${item.headerID}</strong></h4>
						                                                <span class="pull-right confirmed"><i class="fas fa-check-circle"></i> CONFIRMED</span>
																	</div>  
						                                            <div class="date">
						                                                Created On : <span>${item.ERDAT}</span>
						                                                <c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user_role ne 'RETAILER'}">
						                                                	<h4 class="pull-right confirmed">Rs.&nbsp;<strong>${item.NETWR}</strong></h4>
						                                                </c:if>
						                                            </div>
						                                            <div>
						                                            	<h5><span class="">Number of Items : </span>
							                                                	<span >${item.noOfItems}</span>
						                                                </h5>
						                                            </div>     
						                                            <sec:authorize access="hasAnyRole('ROLE_RETAILER')">
							                                            <div>
							                                            	<h5><span class="">Reference No : </span>
								                                                	<span >${item.reference_no}</span>
							                                                </h5>
							                                            </div>     
						                                            </sec:authorize>
						                                            <div>
						                                            	<c:if test = "${item.FLAG == 'B'}">
						                                            		<h5>Comments : <span>${item.STATUS}</span></h5>
						                                            	</c:if>
						                                            </div>
						                                            
						                                            <%-- <sec:authorize access="hasAnyRole('ROLE_DEALER')">
						                                            	<h4>Comments : </h4>
						                                            	<span>${item.comments}</span>
						                                                <h4 class="pull-right confirmed"><strong>${item.NETWR}</strong></h4> 
																	</sec:authorize> --%>
						                                                          
		                                        				</a>    
																</div>                
	                                 							</div>
	                                 				</c:if>					
<%-- 														</c:when> --%>
														
<%-- 												</c:choose> --%>
	                                        
	                                        
	                                        <%-- <c:if test="${(item.FLAG == 'C')  || (item.FLAG == 'B')}">
											   <b>Try again!</b><br/>
											</c:if> --%>
	                                        
								    
								</c:forEach>

                                  
                                    
                                </div>

                              
                        </div>


<!-- END of Tab 2 Content menu 4 -->


<!-- Tab 3 Content menu 5 Confirmed -->
                        <div id="menu5" class="tab-pane fade">
                            
                            <div>
	                            <c:forEach items="${headerList}" var="item" varStatus="status">
								    
	                                        
<%-- 	                                        <input type="hidden"name="${_csrf.parameterName}" value="${_csrf.token}" id= "csrf_token"/> --%>
		                                        <c:choose>
														<c:when test="${item.FLAG == 'R' || item.FLAG == 'R1' || item.FLAG == 'R2'}">
															<div class="col-xs-12 col-md-4">
	                                        					<div class="well well-confirmed">
															
																	<a data-toggle="modal" onclick="viewConfirmedOrder(${item.headerID},'Rejected')" >
		                                                        	<input type="hidden"name="confirmed_${item.headerID}" value="${item.headerID}" id= "confirmed_${item.headerID}"/>
						                                            <div>
						                                                <h4><strong>${item.headerID}</strong></h4>
						                                                <span class="pull-right rejected"><i class="fas fa-ban"></i> REJECTED</span>
																	</div>  
						                                            <div class="date">
						                                                Created On : <span>${item.ERDAT}</span>
						                                                <c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user_role ne 'RETAILER'}">
						                                                	<h4 class="pull-right confirmed">Rs.&nbsp;<strong>${item.NETWR}</strong></h4>
						                                                </c:if>
						                                            </div>
						                                            <div>
						                                            	<h5><span class="">Number of Items : </span>
							                                                	<span >${item.noOfItems}</span>
							                                            </h5>
						                                            </div>        
						                                            <div>
						                                            	<c:if test = "${item.FLAG == 'R'}">
						                                            		<%-- <h5>Comments : <span>${item.STATUS}</span></h5> --%>
						                                            		<h5>Comments : <span>${item.comments}</span></h5>
						                                            	</c:if>
						                                            </div>
						                                            
						                                            <%-- <sec:authorize access="hasAnyRole('ROLE_RETAILER')">
						                                            	<c:if test = "${item.STATUS == 'R'}">
						                                            		<h5>Comments : <span>${item.comments}</span></h5>
						                                            	</c:if>
						                                            	
						                                            	<h5>Comments : <span>${item.comments}</span></h5>
						                                            	
						                                                <h4 class="pull-right confirmed"><strong>${item.NETWR}</strong></h4> 
																	</sec:authorize> --%>                
		                                        				</a>
																</div>                
	                                 						</div>
														</c:when>
														
														
												</c:choose>
								    
								</c:forEach>

                                    
                                </div>

                              
                        </div>


<!-- END of Tab 3 Content menu 5 -->






                        <!-- Tab 2 Content Not in use  My Billing TaB-->
                        <div id="menu2" class="tab-pane fade">
                                <div class="col-xs-12 mobile-create-filter">
<!--                                         <a><span data-toggle="modal" data-target="#filterBilling" class="pull-right create-filter-icons"><i class="fas fa-filter fa-2x"></i></span></a>  -->
<!--                                         <a><span data-toggle="modal" data-target="#createBilling" class="pull-right label label-danger create-filter-icons"><i class="fas fa-edit"></i> Create</span></a>  -->
                                </div>   
                                
                            <c:forEach items="${billingList}" var="item" varStatus="status">
							    <div class="col-xs-12 col-md-4">
                                        <div class="well well-confirmed">
<!--                                         <a href="" target="_blank"> -->
                                        <a data-toggle="modal" onclick="showBillingItem(${item.vbeln})" data-target="#billingPopup">
                                            <div>
                                                <h4><strong>${item.vbeln}</strong></h4>
                                          
											</div>  
                                            <div class="date">
                                                Created On : <span>${item.erdat}</span>
                                                <h4 class="pull-right confirmed">Rs.&nbsp;<strong>${item.netwr}</strong></h4>
                                                
                                            </div>
                                            <div>
                                            	<h5><span class="">Number of Items</span> : ${item.noOfItems}</h5>
                                            	<input type="hidden" id="bill_hdn_no_of_items_${item.vbeln}" value="${item.noOfItems}">
                                            </div>                        
                                            <div>
                                            	<h5><span class="">Reference No.</span> : ${item.xblnr}</h5>
                                            	<input type="hidden" id="bill_hdn_ref_no_${item.vbeln}" value="${item.xblnr}">
                                            </div>                        
                                            <div>
                                            	<h4><span class="">${item.productType}</span></h4>
                                            	<input type="hidden" id="bill_hdn_prod_type_${item.vbeln}" value="${item.productType}">
                                            </div>                        
                                        </a>    
                                        </div>                
                                 </div>
							    
							</c:forEach>
                                <!--                          
                                <div>
                                        <div class="col-xs-12 col-md-4">
                                            <div class="well well-confirmed">
                                            <a data-toggle="modal" data-target="#confirmedBilling">
                                                <div>
                                                    <h4><strong>30000364</strong></h4>
                                                    <span class="pull-right confirmed"><i class="fas fa-dot-circle"></i> CONFIRMED</span>
                                                </div>  
                                                <div class="date">
                                                    18/07/2018
                                                    <h4 class="pull-right confirmed"><strong>207.73</strong></h4>
                                                </div>
                                                <div>
                                                    <h5><span class="label label-confirmed">Items 3</span></h5> 
                                                </div>                        
                                            </a>    
                                            </div>                
                                        </div>
                            
                                        <div class="col-xs-12 col-md-4">
                                            <div class="well well-pending">
                                            <a href="http://www.google.com" target="_blank">                                            
                                                <div>
                                                    <h4><strong>30000364</strong></h4>
                                                    <span class="pull-right pending"><i class="fas fa-dot-circle"></i> PENDING</span>
                                                </div>  
                                                <div class="date">
                                                    18/07/2018
                                                    <h4 class="pull-right pending"><strong>207.73</strong></h4>
                                                </div>
                                                <div>
                                                    <h5><span class="label label-pending">Items 3</span></h5> 
                                                </div>
                                            </a>                            
                                            </div>                
                                        </div>
                            
                                        <div class="col-xs-12 col-md-4">
                                            <div class="well well-rejected">
                                            <a href="http://www.google.com" target="_blank">                                            
                                                <div>
                                                    <h4><strong>30000364</strong></h4>
                                                    <span class="pull-right rejected"><i class="fas fa-dot-circle"></i> REJECTED</span>
                                                </div>  
                                                <div class="date">
                                                    18/07/2018
                                                    <h4 class="pull-right rejected"><strong>207.73</strong></h4>
                                                </div>
                                                <div>
                                                    <h5><span class="label label-rejected">Items 3</span></h5> 
                                                </div>                        
                                            </a>
                                            </div>                
                                        </div>
                            
                                        <div class="col-xs-12 col-md-4">
                                            <div class="well well-pending">
                                            <a href="http://www.google.com" target="_blank">                                                
                                                <div>
                                                    <h4><strong>30000364</strong></h4>
                                                    <span class="pull-right pending">PENDING</span>
                                                </div>  
                                                <div class="date">
                                                    18/07/2018
                                                    <h4 class="pull-right pending"><strong>207.73</strong></h4>
                                                </div>
                                                <div>
                                                    <h5><span class="label label-pending">Items 3</span></h5> 
                                                </div>                        
                                            </a>
                                            </div>                
                                        </div>
                            
                                        <div class="col-xs-12 col-md-4">
                                            <div class="well well-rejected">
                                            <a href="http://www.google.com" target="_blank">    
                                                <div>
                                                    <h4><strong>30000364</strong></h4>
                                                    <span class="pull-right rejected">REJECTED</span>
                                                </div>  
                                                <div class="date">
                                                    18/07/2018
                                                    <h4 class="pull-right rejected"><strong>207.73</strong></h4>
                                                </div>
                                                <div>
                                                    <h5><span class="label label-rejected">Items 3</span></h5> 
                                                </div>                        
                                            </a>
                                            </div>                
                                        </div>
                            
                                        <div class="col-xs-12 col-md-4">
                                            <div class="well well-confirmed">
                                            <a href="http://www.google.com" target="_blank">                                        
                                                <div>
                                                    <h4><strong>30000364</strong></h4>
                                                    <span class="pull-right confirmed">CONFIRMED</span>
                                                </div>  
                                                <div class="date">
                                                    18/07/2018
                                                    <h4 class="pull-right confirmed"><strong>207.73</strong></h4>
                                                </div>
                                                <div>
                                                    <h5><span class="label label-confirmed">Items 3</span></h5> 
                                                </div>                        
                                            </a>
                                            </div>                
                                        </div>
    
                                        <div class="col-xs-12">
                                            <a data-toggle="modal" data-target="#createBilling"  class="mobile-create">
                                                <span><i class="fas fa-plus fa-2x"></i></span>
                                            </a>
                                            <a data-toggle="modal" data-target="#filterBilling"  class="mobile-filter">
                                                <span><i class="fas fa-filter fa-2x mobile-filter-icon"></i></span>
                                            </a>
                                        </div>
                                        
                            </div>
                            
                            -->
    
                                    <!-- Create Billing Task Modal -->
                                    <div id="createBilling" class="modal fade" role="dialog">
                                        <div class="modal-dialog">
                                        
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Create Billing</h4>
                                            </div>
                                            <div class="modal-body">
                                                    <form class="form-horizontal" id="createTaskForm">
                                                        <div class="form-group new-class">
                                                            <label for="sel1" class="col-xs-4 col-md-5">Product</label>
                                                            <div class="col-xs-8 col-md-7">
                                                                <select class="form-control" id="product_id">
                                                                    <option selected>Select</option>
                                                                    <option>Dairy</option>
                                                                    <option>Dairy Product</option>
                                                                </select>
                                                            </div>
                                                        </div>
    
                                                        <div class="form-group new-class">
                                                            <label for="sel1" class="col-xs-4 col-md-5">Product Code</label>
                                                            <div class="col-xs-8 col-md-7">
                                                                <select class="form-control" id="productCode">
                                                                    <!-- <option>1</option>
                                                                    <option>2</option>
                                                                    <option>3</option>
                                                                    <option>4</option> -->
                                                                </select>
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="form-group new-class">
                                                            <label class="control-label col-xs-4 col-md-5" for="quantity">Quantity</label>
                                                            <div class="col-xs-8 col-md-7"> 
                                                                <input type="text" class="form-control" id="quantity" placeholder="Enter Quantity" autocomplete="off">
                                                            </div>
                                                        </div>
    
                                                        <div class="form-group new-class">
                                                            <label class="control-label col-xs-4 col-md-5" for="unit">Ordering Unit</label>
                                                            <div class="col-xs-8 col-md-7"> 
                                                                <input type="text" class="form-control" id="unit" disabled>
                                                            </div>
                                                        </div>
    
                                                        <div class="form-group new-class">
                                                            <label class="control-label col-xs-4 col-md-5" for="value">Value</label>
                                                            <div class="col-xs-8 col-md-7"> 
                                                                <input type="text" class="form-control" id="value" disabled>
                                                            </div>
                                                        </div>
    
                                                        <div class="form-group new-class">
                                                            <label class="control-label col-xs-4 col-md-5" for="date">Indent Date</label>
                                                            <div class="col-xs-8 col-md-7"> 
                                                                <input type="text" class="form-control" id="date" disabled>
                                                            </div>
                                                        </div>                                                    
    
                                                        <div class="form-group">
                                                            <label class="control-label col-xs-4 col-md-5" for="limit">Limit</label>
                                                            <div class="col-xs-8 col-md-7"> 
                                                                <input type="text" class="form-control" id="limit" disabled>
                                                            </div>
                                                        </div>                                                                                                        
    
    
                                                      <div class="form-group"> 
                                                        <div class="col-xs-12 col-xs-12 text-center">
                                                          <button type="submit" class="btn btn-default">Submit</button>
                                                        </div>
                                                      </div>
                                                    </form>                                                    
                                            </div>
                                            <!-- <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div> -->
                                            </div>
                                        
                                        </div>
                                    </div>
    
                                    <!-- Filter Billing Task Modal -->
                                    <div id="filterBilling" class="modal fade" role="dialog">
                                        <div class="modal-dialog">
                                        
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Filter Billing</h4>
                                            </div>
                                            <div class="modal-body">
                                                    <form class="form-horizontal" id="filterTaskForm">
                                                        <div class="form-group">
                                                            <label for="sel1" class="col-xs-4 col-md-5">Filter Orders</label>
                                                            <div class="col-xs-8 col-md-7" style="overflow: hidden;">
                                                                <select class="form-control" id="filterOrder">
                                                                    <option selected>All</option>
                                                                    <option>Confirmed</option>
                                                                    <option>Pending</option>
                                                                    <option>Rejected</option>
                                                                </select>
                                                            </div>
                                                        </div>                                            
    
                                                          <div class="form-group"> 
                                                            <div class="col-xs-12 col-xs-12 text-center">
                                                              <button type="submit" class="btn btn-default">Submit</button>
                                                            </div>
                                                          </div>
                                                        </form>   
                                                
                                            </div>
                                            <!-- <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div> -->
                                            </div>
                                        
                                        </div>
                                    </div> 
                                    
                                    <!-- Modal -->
                                    <div id="confirmedBilling" class="modal fade" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Confirmed Order</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                            <th>Material</th>
                                                            <th>Qty</th>
                                                            <th>Unit</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                            <td>200021</td>
                                                            <td>36</td>
                                                            <td>EA</td>
                                                            </tr>
                                                            <tr>
                                                            <td>200017</td>
                                                            <td>60</td>
                                                            <td>L</td>
                                                            </tr>
                                                            <tr>
                                                            <td>200016</td>
                                                            <td>12</td>
                                                            <td>EA</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>

                            <!-- Tab 3 Content  Retailers Orders-->
                            <div id="menu3" class="tab-pane fade">
<!--                                     <div class="col-xs-12 mobile-create-filter"> -->
<!--                                             <a><span data-toggle="modal" onclick="approveReject('C')" class="pull-right label label-danger create-filter-icons"><i class="fas fa-check"></i> Approve</span></a> -->
<!--                                             <a><span data-toggle="modal" data-target="#rejectedDialog" class="pull-right label label-danger create-filter-icons"><i class="fas fa-ban"></i> Reject</span></a>  -->
<!--                                     </div>   -->
                                    
<%--                                     <span>${fn:length(retailerOrdersList)}</span>   --%>
                                    <c:if test="${fn:length(retailerOrdersList) gt 0}">
	                                    <div class="col-xs-12 mobile-create-filter" style="display:none" id="approve_reject_div">
	                                            <a href="javascript:void(0);" id="approve_id"><span data-toggle="modal" onclick="approveReject('C')" class="pull-right label label-danger create-filter-icons" ><i class="fas fa-check"></i> Approve</span></a>
<!-- 	                                            <a><span data-toggle="modal" data-target="#rejectedDialog" class="pull-right label label-danger create-filter-icons"><i class="fas fa-ban"></i> Reject</span></a>  -->
	                                            <a href="javascript:void(0);" id="reject_id"><span data-toggle="modal" data-target="#rejectedDialog" class="pull-right label label-danger create-filter-icons"><i class="fas fa-ban"></i> Reject</span></a> 
	                                    </div>  
                                    </c:if>      
                                    
                                                      
                                    <div>
	                                    <c:forEach items="${retailerOrdersList}"  var="item" varStatus="status">
	                                    
	                                    <div class="col-xs-12 col-md-4" id="retailer_${item.headerID}">
                                        	<div class="well well-pending">
                                        	<input type='checkbox' onclick='handleClick(this,"${item.headerID}"); 'id="checkbox_${status.index}">	
	                                    
<%-- 												<a data-toggle="modal" onclick="editRetailerOrder(${item.headerID})"> --%>
												<a data-toggle="modal" onclick="editOrder(${item.headerID},'${item.sync}',${item.SPART})" >
													<div>
														<h4>
															<strong>${item.firstName} ${item.lastName} - ${item.headerID} </strong>
														</h4>
														<span class="pull-right pending"><i
															class="fas fa-dot-circle"></i> PENDING</span>
													</div>
													<div class="date">
														Created On : <span>${item.ERDAT}</span>
														<h4 class="pull-right confirmed">
															Rs.&nbsp;<strong>${item.NETWR}</strong>
														</h4>
													</div>
													<div>
														<h5><span class="">Number of Items : </span>
		                                                	<span >${item.noOfItems}</span>
		                                                </h5>
													</div>
													<div>
		                                            	<h5><strong>${item.productType}</strong></h5>
		                                            </div>
		                                            <%-- <sec:authorize access="hasAnyRole('ROLE_RETAILER')">
		                                            </sec:authorize> --%>
		                                             <div class="comment-box">
		                                            	<h5><span class="comment-panel">Comments : </span>
		                                                	<span >${item.retailer_comments}</span>
		                                                </h5>
		                                            </div>
												</a>
											</div>
										</div>
											</c:forEach>
        
                                            <!-- <div class="col-xs-12">
                                                <a data-toggle="modal" data-target="#createROrder"  class="mobile-create">
                                                    <span><i class="fas fa-plus fa-2x"></i></span>
                                                </a>
                                                <a data-toggle="modal" data-target="#filterROrder"  class="mobile-filter">
                                                    <span><i class="fas fa-filter fa-2x mobile-filter-icon"></i></span>
                                                </a>
                                            </div> -->
                                            
                                    </div>
        
                                       
                                        
                                        <!-- Modal Retailer Order EDIT-->
				
										<div class="modal fade" id="editRetailerOrder" tabindex="-1" role="dialog"
											aria-labelledby="basicModal" aria-hidden="true">
											<div class="modal-dialog">
												<form action="updateOrders" id="updateOrders"
													name="updateOrders" CommandName="ItemtableDto" method="POST">
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" id="csrf_token" />
													<div class="modal-content">
														<div class="modal-header headercolor">
															<h4 class="modal-title" id="myModalLabel">Edit Retailer Order</h4>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<table class="table table-bordered" id="edit_retailer_order_table">
																<thead>
																	<tr>
																		<th>Material</th>
																		<th>Quantity</th>
																		<th>Due Date</th>
																		<th>Action</th>
																	</tr>
																</thead>
																<tbody>
																</tbody>
															</table>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">Close</button>
															<button type="submit" class="btn btn-primary"
																id="save_retailer" style="display: none;">Save</button>
														</div>
													</div>
												</form>
											</div>
										</div>
				
				
				
										<!-- END OF RETAILER ORDER EDIT MODAL -->
                                </div>
                    </div>
            </div>

         

        </div>
    </div>    
    
    
    
    
                             <!-- aniket basic modal EDIT DEALER ORDERS-->
                                       <!-- basic modal -->
								<div class="modal fade" id="editOrder" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
								  <div class="modal-dialog">
								   <form action="updateOrders" id="updateOrders" name="updateOrders" CommandName="ItemtableDto" method="POST">
								   		<input type="hidden"name="${_csrf.parameterName}" value="${_csrf.token}" id= "csrf_token"/>
									    <div class="modal-content">
									      <div class="modal-header headercolor">
									        <h4 class="modal-title" id="myModalLabel">Edit Order</h4>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      <div class="modal-body">
									      <div class="table-panel">
									        <table class="table table-bordered" id="edit_order_table">
									                        <thead>
									                            <tr>
									                                <th>Material</th>
									                                <th>Quantity</th>
									                                <th>Due Date</th>
									                                <th>Action</th>
									                            </tr>
									                        </thead>
									                        <tbody>
									                        </tbody>
									         </table>
									      </div>
									      </div>
									      
									      <div class="modal-footer">
<!-- 									      <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button> -->
									        <sec:authorize access="hasAnyRole('ROLE_RETAILER')"> 
<%--                                                <c:forEach items="${headerList}" var="item" varStatus="status"> --%>
														<input type = "hidden" id="RET_SPART" name ="RET_SPART"  />
														<input type = "hidden" id="RET_HEADERID" name ="RET_HEADERID"  />
<%-- 													<c:choose> --%>
<%-- 														<c:when test="${item.FLAG == ''}"> --%>
<%-- 															<a href="<c:url value = "/retailerCreateOrder?pId=${item.SPART}&newRecord=0&hId=${item.headerID}"/>"> --%>
<!-- 																<button type="button" class="btn btn-primary" onclick="gotoPage()"><i class="fas fa-edit"></i>Add</button> -->
																<button type="button" class="btn btn-primary" onclick="gotoPage()">Add</button>
<!-- 															</a> -->
															
<%-- 														</c:when> --%>
<%-- 													</c:choose>                                         --%>
																				    
<%-- 												</c:forEach> --%>
													
											</sec:authorize>	
<!-- 									        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button> -->
									        <button type="submit" class="btn btn-primary" id="save_changes" style="display:none;">Save</button>
     									    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
									      </div>
									    </div>
								    </form>
								  </div>
								</div>

                                <!-- aniket basic modal end -->
                                
                                
                                <div id="isOrderExists" class="modal fade" role="dialog">
							        <div class="modal-dialog">
							            <div class="modal-content">
							                <div class="modal-header">
							                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							                        <span aria-hidden="true">×</span>
							                    </button>
							                    <h4 class="modal-title" id="myModalLabel">Order Status</h4>
							                </div>
							                <div class="modal-body">
							                    <div class="alert alert-danger" >You have already placed today's order. Would you like to add item in existing order?</div>
<!-- 							                    <div class="alert alert-danger" >You have already placed today's order.</div> -->
							                </div>
							                <div class="modal-footer">
<!-- 							                	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<%-- 								                <a href="<c:url value = "/createorder"/>" class="btn btn-default">Yes</a> --%>
								                
								                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
							                	<button type="button" class="btn btn-default" ><a href = "<c:url value = "/createorder"/>">Yes</a></button>
							                	
							                    
							                </div>
							            </div>
							        </div>
							    </div>



<!-- View Modal to display Added Records APPROVE / REJECT RECORDS -->
			<div id="approvedViewModal" class="modal fade" role="dialog">
				<div class="modal-dialog" >
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Approve Order</h4>
						</div>
						<div class="modal-body">
							<div class="pendingUpdate respTable">
							
							<form action="createOrders" id="createApprovedOrders" name="createApprovedOrders" CommandName="ItemtableDto" method="POST">
								<input type="hidden"name="${_csrf.parameterName}" value="${_csrf.token}" id= "csrf_token"/>								   		
								<table class="table table-bordered" id="approve_view_modal_table">
									<thead>
										<tr>
											<th class="fcol">Material</th>
											<th>Category</th>
											<th>Quantity</th>
											<th>Due Date</th>
											<th>Value</th>
											<th>Rate</th>
											<!--                                <th>Unit</th> -->
<!-- 											<th>Action</th> -->
										</tr>
									</thead>
									<tbody>
										
										
									</tbody>
								</table>
								
								<!-- <div class="text-right form-group">
									<label>Order Value : <span id="total_value">0</span></label>
								</div> -->

<!-- 								<div class="text-right"> -->
								<%-- <div>
<!-- 									<b>Select Comment</b> -->
									<b>Comments</b>
									<select class="form-control" id="approve_reject_comments" name='items[0].comments'>
                                        <!-- <option selected>Select</option>-->
                                        <c:forEach items="${arcDtoList}"  var="item" varStatus="status">
											<option value = "${item.comments}">${item.comments}</option>
										</c:forEach>
                                    </select>
                                    <input type="text" class="form-control" id="approve_reject_comments" name='items[0].comments' />
                                    
								</div> --%>


							</div>
							
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" onclick="submitApprovedRecords()" class="btn btn-info" id="view_update" >Submit</button>
<!-- 							<button type="submit" class="btn btn-info" id="view_update" >Submit</button> -->
						</div>
						
						</form>
					</div>
				</div>
			</div>
			
<!--END View Modal to display Added APPROVE / REJECT RECORDS-->    
    
    
    <!--Validation Alert Dialog for Rejected Order-->
    <div id="rejected_order" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="alert_title">Order Status</h4>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger" id="alert_text">Order Rejected Successfully!!!</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    
        <!--Validation Positive Alert Dialog -->
    <div id="showAlert" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
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
    
    
    
    
    <!-- CONFIRMED ORDER  -->
    						<div id="confirmedOrder" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content" style="width:100%">
                                            <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title" id="status_title">Confirmed Order</h4>
                                            </div>
                                            <div class="modal-body">
                                            <div class="outer-order-table">
                                            <div class="inner-order-table">
                                                <table class="table table-hover" id="confirmed_order_table">
                                                    <thead>
                                                        <tr>
                                                        <th>Material</th>
                                                        <th>Qty</th>
                                                        <th>Confirmed Qty</th>
                                                        <th>Rejected Qty</th>
                                                        <th>Unit</th>
                                                        <c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user_role ne 'RETAILER'}">
	                                                        <th>Rate</th>
	                                                        <th>Value</th>
                                                        </c:if>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        
                                                    </tbody>
                                                </table>
                                                </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
    
    <!-- END OF CONFIRMED ORDER  -->
    <!-- Billing ORDER POPUP -->
    						<div id="billingPopup" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content" style="width:100%">
                                            <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title" >Billing Order<span id="billing_order_id"></span></h4>
                                            
                                            </div>
                                            <div class="modal-body">
                                                <table class="table table-hover" id="billing_table">
                                                	
                                                    <thead>
                                                    	
                                                    	<tr>
	                                                		<td>Reference No : <span id="bill_ref_no" ></span> </td>
	                                                		<td>No. of Items : <span id="bill_no_of_items" ></span>  </td>
	                                                		<td>Product Type : <span id="bill_prod_type" ></span></td>
	                                                	</tr>
                                                        <tr>
                                                        <th>Material</th>
                                                        <th>Qty</th>
<!--                                                         <th>Confirmed Qty</th>	
<!--                                                         <th>Rejected Qty</th> -->
                                                        <th>Unit</th>
<!--                                                         <th>Rate</th> -->
                                                        <th>Value</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
    
    <!-- END OF CONFIRMED ORDER  -->
    
    
    
     <!--REJECTED ORDER DIALOG -->
    <div id="rejectedDialog" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="showAlert_title">Rejected Order</h4>
                </div>
                <div class="modal-body">
                
<!--                 		<b>Select Comment</b> -->
                		<b>Comments</b>
						<%-- <select class="form-control" id="rejected_comments" name='rejected_comments'>
                                     <!-- <option selected>Select</option>-->
                                    <c:forEach items="${arcDtoList}"  var="item" varStatus="status">
										<option value = "${item.comments}">${item.comments}</option>
									</c:forEach>
                         </select> --%>
                         <input type="text" class="form-control" id="rejected_comments" name='rejected_comments' onkeyup="showYesButton(this);" />
                         <label style="color:red; font-weight:bold; " id="comments_label">*Please fill the comments !!!</label>
                	
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                    <button type="button" class="btn btn-default" onclick="approveReject('R')" data-dismiss="modal" id="rejected_yes" disabled>Yes</button>
                </div>
            </div>
        </div>
    </div>
    
</body>

<script type="text/javascript">
    
    function viewConfirmedOrder(headerId,status){
//     	alert("headerId=====>>>>"+headerId);
    	$('#confirmedOrder').modal('show');
    	
//     	document.getElementById("status_title").innerHTML = status+" Order";
    	document.getElementById("status_title").innerHTML = " Order Details";
    	
    	
    	
    	 $.ajax({
    		 type:"GET",
//    		 dataType : "json",
    	    url :"getConfirmedOrder",
//    		     contentType:"text/xml",
//    	     dataType:"xml",
    		
//    	    headers : {
//    	        'Accept' : 'application/json',
//    	        'Content-Type' : 'application/json'
//    	    },
    	    data:{
//     	    	sendDataArr	:	JSON.stringify(sendDataArr),
				header_id	:	headerId,
    	    	 random 	:	Math.random(),
    	    	 _csrf 		: 	document.getElementById("csrf_token").value
    	    },
    	    success:function(data,req,res){
    	   
    	    	$("#confirmed_order_table tbody").empty();
    	    	
    	    	console.log("DATA============>>>"+JSON.stringify(data)+"======="+data.length);
    	    	var coTableData = "";
    	    	var dataVal = JSON.stringify(data);    	  
    	    	
    	    	if(data.length < 0){
    	    		
    	    	}
    	    	else{
    	    		
		    	    	for(var i = 0; i < data.length; i++ ){
		    	    		
		    	    		confirmedQty = "0";
		    	    		console.log("status===>>>"+status)
		    	    		
							/* if(status == "Confirmed"){
								confirmedQty = data[i].zmeng;	
		    	    		}
		    	    		
		    	    		
		    	    		if(data[i].ameng != "0.0" && status == "Confirmed"){
		    	    			confirmedQty = data[i].ameng;
		    	    		} */
		    	    		
		    	    		//ZMENG is qty placed by user
		    	    		
		    	    		
		    	    		console.log("FLAG=======>>>"+data[i].flag+"===="+(data[i].flag == "null")+"=="+(data[i].flag == null));
		    	    		
		    	    		//AMENG is confirmed Qty from SAP side
// 		    	    		if(data[i].ameng != "0.0" ){
		    	    		if(data[i].flag != null || data[i].flag != ""){

		    	    			confirmedQty = data[i].ameng;
		    	    		}
		    	    		else{
		    	    			confirmedQty = data[i].zmeng;
		    	    		}
		    	    		
		    	    		
		    	    		var totalQty = parseFloat(data[i].ordered_qty);
		    	    		var rejectedQty = totalQty - confirmedQty;
// 		    	    		console.log("totalQty===>>"+totalQty+"==="+rejectedQty);
		    	    		
		    	    		if(status == "Rejected"){
		    	    			rejectedQty = totalQty;
		    	    			confirmedQty = "0.0";
		    	    		}
		    	    		if(data[i].flag == 'R1' || data[i].flag == "R2"){
		    	    			rejectedQty = data[i].zmeng;
		    	    			confirmedQty = "0.0";
			    	    		}
// 		    	    		console.log("data[i].ameng=====>>"+data[i].ameng+"===>>"+data[i].zmeng+"==rejectedQty==="+rejectedQty);
		    	    		
		    	    		if($('#userRole').text().trim() != 'retailer') {
		    	    			coTableData = coTableData + 
				   	    		"<tr><td>"+data[i].maktx+"</td><td>"+totalQty+"</td><td>"+confirmedQty+"</td><td>"+rejectedQty+"</td> "+
				   	    		"<td>"+data[i].zieme+"</td><td>"+data[i].netpr+"</td><td>"+data[i].netwr_ITEM+"</td> "+
				   	    		/* "<td>"+data[i].zieme+"</td> "+ */
				    	    		"</tr>";
		    	    		}else{
		    	    			coTableData = coTableData + 
				   	    		"<tr><td>"+data[i].maktx+"</td><td>"+totalQty+"</td><td>"+confirmedQty+"</td><td>"+rejectedQty+"</td> "+
				   	    		"<td>"+data[i].zieme+"</td>" /* <td>"+data[i].netpr+"</td><td>"+data[i].netwr_ITEM+"</td> "+ 
				   	    		"<td>"+data[i].zieme+"</td> "+*/
				    	    		"</tr>";
		    	    		}
		    	    			
		    	    	}
    	    	}
    	    	
    	    	$("#confirmed_order_table tbody").append(coTableData);
    	   	 
    	    },
    	    error:function(oError){
    	    	showAlert('Error', 'Something went wrong !!!', 'negative');
    	    }
    	   }); 
    	  
    }
    
    $(document).ready(function(){
//     	document.getElementById("filterOrder").value = document.getElementById("filterBy").value;
    	
    });

    $("#product_type_id_tl").on('change', function() {
//     	  alert( "Product Type==="+this.value );
    	  var productTypeId = this.value;
    	  
    	  $.ajax({
     		 type:"GET",
//     		 dataType : "json",
     	    url :"getProducts",
     	    data:{
     	    	productTypeId	:	productTypeId,
     	    	 random 		:	Math.random(),
     	    	 _csrf 			: 	document.getElementById("csrf_token").value
     	    },
     	    success:function(data,req,res){
     	   
     	    	$("#product_name_tl").empty();
     	    	
     	    	var productsOptions = "";
     	    	var dataVal = JSON.stringify(data);    	    
     	    	
     	    	
     	    	for(var i = 0; i < data.length; i++ ){
     	    		
     	    		productsOptions = productsOptions + 
		     	    		"<option value="+data[i].matnr+">"+data[i].maktx+"</option>";
     	    			
     	    	}
     	    	
     	    	
     	    	
     	    	
     	    	$("#product_name_tl").append(productsOptions);
     	   	 
     	   	 
     	    },
     	    error:function(oError){
     	   	
     	    }
     	   }); 
    	  
    });
    
    var retailerCheck = [];
    function handleClick(object,headerID){
//     	alert("object.id=====>>>"+object.id+"====="+headerID+"===="+object.checked);
//     	retailerCheck.push(headerID);
		if(object.checked){
			retailerCheck.push(headerID)
		}
		else{
			
			for (var i = 0; i < retailerCheck.length; i++){
				
				if (retailerCheck[i] === headerID) { 
					retailerCheck.splice(i, 1);
			        break;
			    }
				
			}
		}
		
		
		if(retailerCheck == 0){
			 document.getElementById("approve_reject_div").style.display = "none";
		}
		else{
			 document.getElementById("approve_reject_div").style.display = "block";
		}
		
    
    }
    
    function gototab(tabName)
    {
//      window.location.hash = '#'+tabName;
     window.location.reload(true);
     console.log("tabName===="+tabName)
  	}
    
    
    
    	function myTab(){
//     		console.log("Zaheer Chowhan");
    		
//     		window.localStorage.setItem();
    	}
    	
    	function logoutSubmit(){
    		document.getElementById("logoutForm").submit();
    	}
    
    	
    	
    	$(document).ready(function() { 
//     	    $("#tabs-mini-panel-mp_2right-middle > ul").tabs({selected: 2}); 
//     	    $("#myTabs > li").hasClass("intro");
//     	    console.log("===>>>>"+($("#myTabs > li").hasClass("active")));
//     	    console.log("chowhan---->>>"+($("#myTabs > li").attr('data-tab')));
    	    
    	    var listItems = $("#myTabs li");
    	    listItems.each(function(idx, li) {
    	        var product = $(li);
    	        var tabName = $(li).attr('data-tab');
//     	        $("#"+tabName).hide();
    	        if($(li).hasClass("active")){
    	        	
//     	        	$("#myTabs > li").attr('data-tab')
					$("#"+tabName).addClass("in active");
//     	        	console.log("CHOWHAN=====>>>"+($(li).attr('data-tab')));
    	        }

    	        // and the rest of your code
    	    });
    	});
    	
    	
    	function gotoPage(){
//     		/retailerCreateOrder?pId=${item.SPART}&newRecord=0&hId=${item.headerID}
			var SPART = document.getElementById("RET_SPART").value;
			var HEADERID = document.getElementById("RET_HEADERID").value;
    		window.location.href = "retailerCreateOrder?pId="+SPART+"&newRecord=0&hId="+HEADERID+"";
    	}
    	
    	function showYesButton(field){
    		var fieldValue = field.value;
    		if(fieldValue.length > 0){
    			 $('#rejected_yes').prop('disabled', false);
    		}else{
    			$('#rejected_yes').prop('disabled', true);
    			
    		}
    	}
</script>
<script src="js/common-js.js"></script>
<script src="js/edit-order.js"></script>
<!-- <script src="js/edit-retailers-orders.js"></script> -->
<script src="js/approve-reject-order.js"></script>
<script src="js/show-billing-item.js"></script>
<script type="text/javascript" src="js/auto-logout.js"></script>

</html>