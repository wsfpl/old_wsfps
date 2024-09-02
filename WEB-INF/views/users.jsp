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
    </style>
</head>

<body>
<spring:url value="/" var="contextPath" />
<c:url value="/logout" var="logoutUrl" />
    	<!-- csrt for log out-->
<form action="${logoutUrl}" method="POST" id="logoutForm">
  <input type="hidden" 		name="${_csrf.parameterName}"		value="${_csrf.token}" />
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
                    <li class="active">
                        <a href="usersmaster">
                            <div class="icon-box"><i class="fa fa-user"></i></div>
                            <p>User Master</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <!-- <li class="">
                        <a href="sync">
                            <div class="icon-box"><i class="fa fa-refresh"></i></div>
                            <p>Services</p>
                            <div class="clearfix"></div>
                        </a>
                    </li> -->
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
                    <li>
                        <a href="prdplnt">
                            <div class="icon-box"><i class="fa fa-user"></i></div>
                            <p>Product 862 Master</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <li>
                        <a href="prddlr">
                            <div class="icon-box"><i class="fa fa-user"></i></div>
                            <p>Dealerwise Product Master</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <li>
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
                            <!--<img src="" class="img-responsive" / >-->
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
                        <p class="breadcrumps-text">User Master</p>
                        <button class="create-btn"><i class="fa fa-plus trans-4ms"></i> &nbsp;Add user</button>
                        <div class="clearfix"></div>
                        
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                           <div class="panel panel-default">
                                <div class="panel-heading"><strong>Upload Template</strong> <small> </small></div>
                                <div class="panel-body">
                                   <div class="input-group image-preview ">
	                                   <form:form method = "POST" action="uploadUsers" id="fileUploadForm" enctype = "multipart/form-data"> 
		                                   <input type="hidden" 		name="${_csrf.parameterName}"	id="csrf_token"	value="${_csrf.token}" /> 
									     	<input type = "file" id="selectFile" class="file-select"  name = "file" accept=".xls,.xlsx" onblur="ValidateSingleInput(this)"/>  
									    	<!--  <input type = "submit" id ="uploadTemplate" value = "upload" /> --> 
									    	<button type="submit"  id ="uploadTemplate" class="btn btn-labeled btn-primary btn-align1"> <span class="btn-label"><i class="glyphicon glyphicon-upload"></i> </span>Upload</button>
									     	<c:if test="${not empty message}">
												<div class="msg">${message}</div>     
											</c:if>
									  </form:form>
								  </div>
                                </div>
                            </div>
                        </div> 
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading"><strong>Download Template</strong> <small> </small></div>
                                <div class="panel-body">
                                <form action="downloadTemplate" method="GET">
                                    <button type="submit" class="btn btn-labeled btn-primary" onclick="window.location.href='downloadTemplate'"> <span class="btn-label"><i class="glyphicon glyphicon-download"></i> </span>Download </button>
                                </form>
                                </div>
                            </div>
                        </div>        
                    </div>
                    <!-- /container --> 
                    <div class="data-table-box">
                        <div>
                            <div class="table-responsive">
                                <table class="table table-stripped table-bordered data-userTable" id="userTable">
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>User ID</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Password</th>
                                            <th class="hidden"></th>
                                            <th class="hidden"></th>
                                            <th class="hidden"></th>
                                            <th class="hidden"></th>
                                            <th class="hidden"></th>
                                            <th class="hidden"></th>
                                            <th class="hidden"></th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- <tr>
                                            <td>1</td>
                                            <td>U0001</td>
                                            <td>Akash</td>
                                            <td>Chavan</td>
                                            <td>******** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" data-toggle="modal" data-target="#encryptModal" class="btn-sm btn-style"> Encrypt</button></td>
                                            <td><button class="btn btn-warning" data-toggle="modal" data-target="#editModal">edit</button> <button class="btn btn-danger delete-popup">delete</button></td>
                                        </tr> -->
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
    <div id="create-modal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content addUser" id="addUser">
                <form  id="addUsersForm" name="addUsersForm"  method="POST" commandName="userDto" action="addUsers">
                <input type="hidden" 		name="${_csrf.parameterName}"	id="csrf_token"	value="${_csrf.token}" />
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="addUsersModel">Add User</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="email">User ID <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="userID" name="userID" required="required">
                                  <span id="mySpan" style="display:none;color:red">Already exist</span>
                                  <span id="mySpan1" style="display:none;color:red">Already Deactivated</span>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="email">First Name <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="userfname" name="userfname" required="required">
                                
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="email">Last Name <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="userlname" name="userlname" required="required">
                                </div>
                            </div>
                            </div>
                            <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="address">Address <span class="req" >*</span></label>
                                    <textarea class="style-area" id="useraddress" name="useraddress" rows="5" cols="36" required="required"></textarea>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="role">User Role <span class="req" >*</span></label>
                                    <select class="select-style" class="form-control" id="userrole" name="userrole" required="required" onchange="OnSelectionChange()">
                                            <option value="DEALER">DEALER</option>
                                            <option value="TM">TM</option>
                                             <option value="RM">RM</option>
                                        </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="plant">Plant <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="plant" name="plant" required="required">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="region">Regio <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="regio" name="regio" required="required">
                                </div>
                            </div>
                            <!-- <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="region">User Business :</label>    
                                    <div class="input-group" id="business" name="business">
                                        <select class="select-style" selected="selected">
                                            <option value="1">Dairy</option>
                                            <option value="2">Seeds</option>
                                        </select>
                                    </div>
                                </div> 
                            </div> -->
                            <%-- <c:if test="${user.business_name == 'Dairy'}">
                              <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="region">User Business :</label>
                                    <input type="text" class="form-control"  id="business" name="business" value="Dairy">
                                </div>
                            </div>
                            </c:if> --%>
                        <%--     <c:if test="${user.business_name == 'Seeds'}"> --%>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="region">User Business </label>
                                    <input type="text" class="form-control"  id="business" name="business" value="${user.business_name}" readonly="readonly">
                                </div>
                            </div>
                          <%--   </c:if> --%>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="mobile">Mobile No. </label>
                                    <input type="text" class="form-control" id="mobile_no" name="mobile_no">
                                </div>
                            </div>
                            <!-- <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="mobile">Sales Org <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="sales_org" name="sales_org" required="required">
                                </div>
                            </div>
                            -->
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="mobile">Manager Id <span class="req" id="mnrek">*</span></label>
                                    <input type="text" class="form-control" id="manager_id" name="manager_id" required="required">
                                     <span id="edit_mySpan" style="display:none;color:red">Already exist</span>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="region">Password <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="userpass" name="userpass" required="required">
                                </div>
                            </div>

                            <div class="clearfix"></div>
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
    <!-- add user modal -->

    <!-- edit modal -->
    <div id="editModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">

        <!-- Modal content-->
        <div class="modal-content updateUser" id="updateUser">
            <%-- <form action="/action_page.php">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    
                    <h4 class="modal-title">Edit Details</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="email">User ID :</label>
                                <input type="text" class="form-control" id="email">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="email">First Name :</label>
                                <input type="text" class="form-control" id="email">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="email">Last Name :</label>
                                <input type="text" class="form-control" id="email">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="address">Address :</label>
                                <textarea class="style-area" id="address" rows="5" cols="36"></textarea>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="role">User Role :</label>
                                <input type="text" class="form-control" id="role">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="plant">Plant :</label>
                                <input type="text" class="form-control" id="plant">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="region">Region :</label>
                                <input type="text" class="form-control" id="region">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="region">User Business :</label>    
                                <div class="input-group" id="business">
                                    <select class="select-style">
                                        <option value="1">Dairy</option>
                                        <option value="2">Seeds</option>
                                    </select>
                                </div>
                            </div> 
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="mobile">Mobile No. :</label>
                                <input type="text" class="form-control" id="mobile">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="mobile">Sales Org :</label>
                                <input type="text" class="form-control" id="mobile">
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form> --%>
             <form  id="updateUsersForm" name="updateUsersForm"  method="POST" commandName="userDto" action="updateUser">
                <input type="hidden" 		name="${_csrf.parameterName}"	id="csrf_token"	value="${_csrf.token}" />
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="addUsersModel">Edit User</h4>
                    </div>
                    <input type="hidden" id="edit_loginID" name="loginID"/>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="User ID">User ID <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="edit_userID" name="userID" required="required">
                                    <span id="edit_mySpan" style="display:none;color:red">Already exist</span>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="First Name">First Name <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="edit_userfname" name="userfname" required="required">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="Last Name">Last Name <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="edit_userlname" name="userlname" required="required">
                                </div>
                            </div>
                            </div>
                            <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="address">Address <span class="req" >*</span></label>
                                    <textarea class="style-area" id="edit_useraddress" name="useraddress" rows="5" cols="36"></textarea>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="role">User Role <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="edit_userrole" name="userrole" required="required">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="plant">Plant <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="edit_plant" name="plant" required="required">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="region">Region <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="edit_regio" name="regio" required="required">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="User Business">User Business </label>
                                    <input type="text" class="form-control"  id="edit_business" name="business" value="${user.business_name}" readonly="readonly">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="mobile">Mobile No. </label>
                                    <input type="text" class="form-control" id="edit_mobile_no" name="mobile_no">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="Password">Password <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="edit_password" name="userpass" required="required">
                                </div>
                            </div>                            
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="managerId">Manager Id <span class="req" >*</span></label>
                                    <input type="text" class="form-control" id="edit_managerId" name="managerId" required="required">
                                </div>
                            </div>                       

                         <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-default" id="updateUserBtn">Submit</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </form>
        </div>
    </div>
</div>
    <!-- edit modal -->

    <!-- encrypt modal -->
    <div class="modal fade" id="encryptModal" role="dialog">
        <div class="modal-dialog modal-sm modal-position">
            <div class="modal-content">
                <div class="modal-body">
                    <input type="text" class="form-control" placeholder="Enter encryption code" id="code">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm" data-dismiss="modal">Submit</button>
                </div>
            </div>
        </div>
    </div>
    <!-- encrypt modal -->
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
    <script type='text/javascript' src="${contextPath}js/users.js"></script>
     
    <script>
        new WOW().init();
        $(document).ready(function() {
            $(".datepicker").datepicker();

            /* new $.fn.dataTable.FixedHeader(table);
            $(table.table().container()).on('keyup', 'tfoot input', function() {
                table
                    .column($(this).data('index'))
                    .search(this.value)
                    .draw();
            }); */
        })

        function includeHTML() {
            var z, i, elmnt, file, xhttp;
            /*loop through a collection of all HTML elements:*/
            z = document.getElementsByTagName("*");
            for (i = 0; i < z.length; i++) {
                elmnt = z[i];
                /*search for elements with a certain atrribute:*/
                file = elmnt.getAttribute("w3-include-html");
                if (file) {
                    /*make an HTTP request using the attribute value as the file name:*/
                    xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() {
                        if (this.readyState == 4) {
                            if (this.status == 200) {
                                elmnt.innerHTML = this.responseText;
                            }
                            if (this.status == 404) {
                                elmnt.innerHTML = "Page not found.";
                            }
                            /*remove the attribute, and call this function once more:*/
                            elmnt.removeAttribute("w3-include-html");
                            includeHTML();
                        }
                    }
                    xhttp.open("GET", file, true);
                    xhttp.send();
                    /*exit the function:*/
                    return;
                }
            }
        }

        includeHTML();
    </script>
    <script type="text/javascript">
        $(document).on('click', '#close-preview', function(){ 
    $('.image-preview').popover('hide');
    // Hover befor close the preview
    $('.image-preview').hover(
        function () {
           $('.image-preview').popover('show');
        }, 
         function () {
           $('.image-preview').popover('hide');
        }
    );    
});
        function logoutSubmit(){
    		document.getElementById("logoutForm").submit();
    	}

$(function() {
    // Create the close button
    var closebtn = $('<button/>', {
        type:"button",
        text: 'x',
        id: 'close-preview',
        style: 'font-size: initial;',
    });
    closebtn.attr("class","close pull-right");
    // Set the popover default content
    $('.image-preview').popover({
        trigger:'manual',
        html:true,
        title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
        content: "There's no image",
        placement:'bottom'
    });
    // Clear event
    $('.image-preview-clear').click(function(){
        $('.image-preview').attr("data-content","").popover('hide');
        $('.image-preview-filename').val("");
        $('.image-preview-clear').hide();
        $('.image-preview-input input:file').val("");
        $(".image-preview-input-title").text("Browse"); 
    }); 
    // Create the preview image
    $(".image-preview-input input:file").change(function (){     
        var img = $('<img/>', {
            id: 'dynamic',
            width:250,
            height:200
        });      
        var file = this.files[0];
        var reader = new FileReader();
        // Set preview image into the popover data-content
        reader.onload = function (e) {
            $(".image-preview-input-title").text("Change");
            $(".image-preview-clear").show();
            $(".image-preview-filename").val(file.name);            
            img.attr('src', e.target.result);
            $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
        }        
        reader.readAsDataURL(file);
    });  
});
</script>

<script>
	$(".custom-file-input").on("change", function() {
			var fileName = $(this).val().split("\\").pop();
			$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
		});
</script>
   
   </body>
</html>
