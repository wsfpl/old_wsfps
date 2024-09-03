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
<html lang="en">
<sec:authentication var="user" property="principal" />
<head>
<spring:url value="/" var="contextPath" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="_csrf" content="${_csrf.token}" />
	<meta name="_csrf_header" content="${_csrf.headerName}" />
    <title>Users - Seed and Dairy</title>
    <link rel="stylesheet"  href="${contextPath}css/a_freaking-custom.css">
    <link rel="stylesheet"  href="${contextPath}css/a_bootstrap.min.css">
    <link rel="stylesheet"  href="${contextPath}css/a_jquery.dataTables.css">
    <link rel="stylesheet"  href="${contextPath}css/a_dataTables.bootstrap.min.css">
    <link rel="stylesheet"  href="${contextPath}css/a_fixedHeader.bootstrap.min.css">
    <link rel="stylesheet"  href="${contextPath}css/a_responsive.bootstrap.min.css">
    <link rel="stylesheet"  href="${contextPath}css/a_font-awesome.min.css">
    <link rel="stylesheet"  href="${contextPath}css/a_jquery-ui.css">
    <link rel="stylesheet"  href="${contextPath}css/a_style.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/a_animate.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/sweetalert2.min.css">
    <style>
    .container{
    margin-top:20px;
    }
    .image-preview-input {
    position: relative;
    overflow: hidden;
    margin: 0px;    
    color: #333;
    background-color: #fff;
    border-color: #ccc;    
    }
    .image-preview-input input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 20px;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0);
    }
    .image-preview-input-title {
    margin-left:2px;
    }
    
  .wid_box{display: block;width: 121px;}
  .req{
  color:red;
  }
  
   .excel-btn{
    display: inline-block;
    top: 0;
    right: 0;
    -webkit-appearance: none;
    padding: 8px 16px;
    border-radius: 50px;
    vertical-align: bottom;
 /*    float: right; */
    border: 1px solid #e31837;
    background-color: #fff;
    color: #e31837;
    position: relative;
    overflow: hidden;
    z-index: 3;
}

.excel-btn:hover{
    color: #fff;
    background-color: #e31837;
    border-color: #e31837;
}
    </style>
</head>

<body>
<spring:url value="/" var="contextPath" />
<c:url value="/logout" var="logoutUrl" />
    	<!-- csrt for log out-->
<form action="${logoutUrl}" method="POST" id="logoutForm">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
    <div class="site-navigation trans-4ms">
        <div class="site-nav-inner-box">
            <div>
                <ul class="">
                    <li>
                        <div class="top-logo-box">
                            <img src="${contextPath}images/white-bird.png" class="rm-logo" />
                            <img src="${contextPath}images/white-spread1.png" class="m-logo" />
                            <div class="clearfix"></div>
                        </div>
                    </li>
                    <li class="">
                        <a href="dashboard">
                            <div class="icon-box"><i class="fa fa-tachometer"></i></div>
                            <p>Dashboard</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <li>
                        <a href="usersmaster">
                            <div class="icon-box"><i class="fa fa-user"></i></div>
                            <p>User Master</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <li class="">
                        <a href="billing">
                            <div class="icon-box"><i class="fa fa-file"></i></div>
                            <p>Billing Details</p>
                            <div class="clearfix"></div>
                        </a>
                    </li> 
                     <li class="">
                        <a href="getAllDealerTmRmDetails">
                            <div class="icon-box"><i class="fa fa-file"></i></div>
                            <p>Dealer TM RM deatils</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                 <!--    <li>
                        <a href="prdplnt">
                            <div class="icon-box"><i class="fa fa-user"></i></div>
                            <p>Product 862 Master</p>
                            <div class="clearfix"></div>
                        </a>
                    </li> -->
                    <li>
                        <a href="prddlr">
                            <div class="icon-box"><i class="fa fa-user"></i></div>
                            <p>Dealerwise Product Master</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <li class="active">
                        <a href="outstanding">
                            <div class="icon-box"><i class="fa fa-file"></i></div>
                            <p>Outstanding</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="body-wrapper">
        
        <div class="content-box-wrapper">
            <div class="top-head">
                <div class="top-innner-head">
                    <div class="menu-btn-box">
                        <div class="menu-box">
                            <div class="menu-bars menu-bar1 trans-4ms"></div>
                            <div class="menu-bars menu-bar2 trans-4ms"></div>
                            <div class="menu-bars menu-bar3 trans-4ms"></div>
                        </div>
                    </div>
                    <div class="top-logo-box">
                        <img src="${contextPath}images/white-spread-black.png" class="mag_logo" />
                        <div class="clearfix"></div>
                    </div>
                    <div class="profile-logout-box">
                        <div class="profile-box"><a href=""><i class="fa fa-user"></i>
                            <p class="p-text trans-4ms"><c:out value="${user.firstname}"></c:out></p></a>
                            <input type="hidden" value="${admin_buss_id}" id="admin_buss_id">
                        </div>
                        <div class="logout-box">
                            <a onclick="javascript:logoutSubmit()">
                                <p class="l-text trans-4ms">Logout</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-box-wrapper1">
                <div class="content-box-inner-wrapper">
                    <div class="breadcrumps-box">
                        <!-- <p class="breadcrumps-text">Product 862 Master</p> -->
                        
                         <div class="leftsec"><p class="breadcrumps-text">Outstanding Amount Master</p><div class="btnsec"><button type="submit" class="btn btn-labeled btn-primary" onclick="window.location.href='downloadTemplateOutstanding'"> <span class="btn-label"><i class="glyphicon glyphicon-download"></i> </span>Download Template</button>
                       <input type="file" name="s_file" id="s_file" class="uploadfletype">  <button type="button" class="btn uploadbtn btn-primary" id="uploadOutBtn">Upload Button</button><button type="button" class="btn del-btn" id="deleteAll">Delete All</button></div></div>
                        <button class="create-btn" id="addPrdBtn"><i class="fa fa-plus trans-4ms"></i> &nbsp;Add Overdraft</button>
                        <div class="clearfix"></div>
                    </div>
                    <!-- /container --> 
                    <div class="data-table-box">
                        <div>
                            <div class="table-responsive">
                                <table class="table table-stripped table-bordered data-userTable" id="prodTable">
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>Dealer Id</th>
                                            <th>Outstanding Amount</th>
                                            <!-- <th>kbetr</th>
                                            <th>knumh</th>
                                            <th>matnr</th>
                                            <th>mtart</th>
                                            <th>werks</th>
                                            <th>spart</th>
                                            <th>vrkme</th>
                                            <th>vtext</th>
                                            <th>sales_org</th> -->
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${overdrafts}" var="od" varStatus="stat">
                                    		<tr id="${od.id}">
												<td>${stat.index+1}</td>
												<td class="kunnr">${od.kunnr}</td>
												<td class="outstanding">${od.outstanding}</td>
												<%-- <td class="kbetr">${od.kbetr}</td>
												<td class="knumh">${od.knumh}</td>
												<td class="matnr">${od.matnr}</td>
												<td class="mtart">${od.mtart}</td>
												<td class="werks">${od.werks}</td>
												<td class="spart">${od.spart}</td>
												<td class="vrkme">${od.vrkme}</td>
												<td class="vtext">${od.vtext}</td>
												<td class="sales_org">${od.sales_org}</td> --%>
												<td>
													<div class="wid_box">
														<button class="btn btn-warning actionbtn edtPrdBtn" value="${od.id}">Edit</button>
														<button class="btn btn-danger delete-popup delPrdBtn" value="${od.id}">Delete</button>
													</div>
												</td>
											</tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- add user modal -->
    <div id="prdAddUpModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content addUser" id="addUser">
                <form  id="prdForm" name="addUsersForm" >
	                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                <input type="hidden" id="id" name="id" value="" />
	                <input type="hidden" id="MESSAGE" name="MESSAGE" value="" />
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="addUsersModel">Add/Update OverDraft</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="email">Dealer Id <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="kunnr" name="kunnr" required="required">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="email">Outstanding Amount <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="outstanding" name="outstanding" required="required">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-default" id="addUserBtn">Submit</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- add overdraft modal -->
    
    <script type='text/javascript' src="${contextPath}js/a_jquery-2.1.3.min.js"></script>
    <script type='text/javascript' src="${contextPath}js/a_jquery-ui.js"></script>
    <script type='text/javascript' src="${contextPath}js/a_bootstrap.min.js"></script>
    <script type='text/javascript' src="${contextPath}js/a_jquery.dataTables.js"></script>
    <script type='text/javascript' src="${contextPath}js/a_dataTables.bootstrap.min.js"></script>
<%--     <script type='text/javascript' src="${contextPath}js/a_dataTables.fixedHeader.min.js"></script> --%>
    <script type='text/javascript' src='${contextPath}js/a_wow.js'></script>
    <script type='text/javascript' src="${contextPath}js/a_main.js"></script>
    <script type='text/javascript' src="${contextPath}js/sweetalert2.min.js"></script>
    <script type='text/javascript' src="${contextPath}js/ajaxSetup.js"></script>
    <script type='text/javascript' src="${contextPath}js/outstanding.js"></script>
      <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
   
 <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
   
     
   </body>
</html>
