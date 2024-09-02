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
    
    <title>Reports</title>
    <!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
    <link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/a_freaking-custom.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/a_bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/a_jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/a_dataTables.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/a_fixedHeader.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/a_responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/a_font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/a_jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/a_style.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/a_animate.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/sweetalert2.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}css/bootstrap-datepicker3.standalone.css">
   
    <style>
      .panel.with-nav-tabs .panel-heading{
    padding: 5px 5px 0 5px;
}
.panel.with-nav-tabs .nav-tabs{
    border-bottom: none;
}
.panel.with-nav-tabs .nav-justified{
    margin-bottom: -1px;
}
/********************************************************************/
/*** PANEL DEFAULT ***/
.with-nav-tabs.panel-default .nav-tabs > li > a,
.with-nav-tabs.panel-default .nav-tabs > li > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li > a:focus {
    color: #777;
}
.with-nav-tabs.panel-default .nav-tabs > .open > a,
.with-nav-tabs.panel-default .nav-tabs > .open > a:hover,
.with-nav-tabs.panel-default .nav-tabs > .open > a:focus,
.with-nav-tabs.panel-default .nav-tabs > li > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li > a:focus {
    color: #777;
    background-color: #ddd;
    border-color: transparent;
}
.with-nav-tabs.panel-default .nav-tabs > li.active > a,
.with-nav-tabs.panel-default .nav-tabs > li.active > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li.active > a:focus {
    color: #555;
    background-color: #fff;
    border-color: #ddd;
    border-bottom-color: transparent;
}
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu {
    background-color: #f5f5f5;
    border-color: #ddd;
}
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > li > a {
    color: #777;   
}
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
    background-color: #ddd;
}
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > .active > a,
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
    color: #fff;
    background-color: #555;
}

tr.row1{
    background-color: #d0d3d6 !important;
}

tr.row2{
    background-color: #d0d3d6 !important;
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

.li-width{
    width: 15%;
    text-align: center;
}

.nav-tabs > li > a {
    color: #fff;
    background-color: #e31837;
    margin-right: 2px;
    line-height: 1.42857143;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
}

.with-nav-tabs.panel-default .nav-tabs > li > a{
    color: #fff;
}
table.dataTable tbody tr.bg_row_color{
	background-color: #f5f5f5;
}
table.dataTable tbody tr td.hide_bill .viewBill{
	display: none;
}
.hideBill{
	display:none;
}
table.dataTable tbody tr td.hide_bill .hideBill{
	display: inline-block;
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
                    <li class="">
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
                    <li class="active">
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
                  <!--   <li>
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
                    <div class="col-md-12">
                        <div class="panel with-nav-tabs panel-default">
                            <div class="panel-heading">
                            <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#product1">Billing Details</a></li>
 <!--    <li><a data-toggle="tab" href="#product2">Product2</a></li>
    <li><a data-toggle="tab" href="#product3">Product3</a></li> -->
  </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div id="product1" class="tab-pane fade in active">
      <div class="content-box-wrapper1">
                <div class="content-box-inner-wrapper">
                    <div class="breadcrumps-box">
                        <p class="breadcrumps-text">Billing Details </p>
                        <!-- <button class="create-btn"><i class="fa fa-plus trans-4ms"></i> &nbsp;Add user</button> -->
                        <div class="clearfix"></div>
                    </div>
                    
                    <!-- /container --> 
                    <div class="data-table-box">
                        <div>
                            <div class="table-responsive">
                                <table class="table table-stripped table-bordered" id="allBillingDetailsTable">
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>Order Id</th>
                                            <th>Name</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                     <!--    <tr>
                                            <td>1</td>
                                            <td>Milk Product</td>
                                            <td>20000</td>
                                            <td>100</td>
                                            <td>50000</td>
                                            <td><button class="btn btn-default btn-sm" data-toggle="collapse" id="row1" data-target=".row1">View Detail</button></td>
                                        </tr>
                                        <tr class="collapse row1 row-color">
                                            <td>1.1</td>
                                            <td>Milk Sub-cat</td>  
                                            <td>500</td>
                                            <td>10</td>
                                            <td>5000</td>
                                            <td><input type="checkbox" /> Select</td>
                                        </tr>
                                        <tr class="collapse row1">
                                            <td>1.1</td>
                                            <td>Milk Sub-cat</td>  
                                            <td>500</td>
                                            <td>10</td>
                                            <td>5000</td>
                                            <td><input type="checkbox" /> Select</td>
                                        </tr>
                                        -->
                                       <!--  <tr>
                                            <td>2</td>
                                            <td>Seeds Product</td>
                                            <td>50000</td>
                                            <td>300</td>
                                            <td>100000</td>
                                            <td><button class="btn btn-default btn-sm" data-toggle="collapse" id="row2" data-target=".row2">View Detail</button></td>
                                        </tr>
                                        <tr class="collapse row2">
                                            <td>2.1</td>
                                            <td>Seed Sub-cat</td>  
                                            <td>500</td>
                                            <td>10</td>
                                            <td>5000</td>
                                            <td><input type="checkbox" /> Select</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Seeds Product</td>
                                            <td>50000</td>
                                            <td>300</td>
                                            <td>100000</td>
                                            <td><button class="btn btn-default btn-sm" data-toggle="collapse" id="row3" data-target=".row3">View Detail</button></td>
                                        </tr>
                                        <tr class="collapse row3">
                                            <td>3.1</td>
                                            <td>Seed Sub-cat</td>  
                                            <td>500</td>
                                            <td>10</td>
                                            <td>5000</td>
                                            <td><input type="checkbox" /> Select</td>
                                        </tr> -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <div id="product2" class="tab-pane fade">
      <div class="content-box-wrapper1">
                <div class="content-box-inner-wrapper">
                    <div class="breadcrumps-box">
                        <p class="breadcrumps-text">Billing Report 2</p>
                        <!-- <button class="create-btn"><i class="fa fa-plus trans-4ms"></i> &nbsp;Add user</button> -->
                        <div class="clearfix"></div>
                    </div>
                    
                    <!-- /container --> 
                    <div class="data-table-box">
                        <div>
                            <div class="table-responsive">
                                <table class="table table-stripped table-bordered user-data-table" id="table2">
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>Product</th>
                                            <th>Amount</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Milk Product</td>
                                            <td>20000</td>
                                            <td>100</td>
                                            <td>50000</td>
                                            <td><button class="btn btn-default btn-sm" data-toggle="collapse" id="row1" data-target=".row1">View Detail</button></td>
                                        </tr>
                                        <tr class="collapse row1">
                                            <td>1.1</td>
                                            <td>Milk Sub-cat</td>  
                                            <td>500</td>
                                            <td>10</td>
                                            <td>5000</td>
                                            <td><input type="checkbox" /> Select</td>
                                        </tr>
                                        <tr class="collapse row1">
                                            <td>1.2</td>
                                            <td>Milk Sub-cat</td>  
                                            <td>500</td>
                                            <td>10</td>
                                            <td>5000</td>
                                            <td><input type="checkbox" /> Select</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Seeds Product</td>
                                            <td>50000</td>
                                            <td>300</td>
                                            <td>100000</td>
                                            <td><button class="btn btn-default btn-sm" data-toggle="collapse" id="row2" data-target=".row2">View Detail</button></td>
                                        </tr>
                                        <tr class="collapse row2">
                                            <td>2.1</td>
                                            <td>Seed Sub-cat</td>  
                                            <td>500</td>
                                            <td>10</td>
                                            <td>5000</td>
                                            <td><input type="checkbox" /> Select</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <div id="product3" class="tab-pane fade">
      <div class="content-box-wrapper1">
                <div class="content-box-inner-wrapper">
                    <div class="breadcrumps-box">
                        <p class="breadcrumps-text">Billing Report 3</p>
                        <!-- <button class="create-btn"><i class="fa fa-plus trans-4ms"></i> &nbsp;Add user</button> -->
                        <div class="clearfix"></div>
                    </div>
                    
                    <!-- /container --> 
                    <div class="data-table-box">
                        <div>
                            <div class="table-responsive">
                                <table class="table table-stripped table-bordered user-data-table" id="table3">
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>Product</th>
                                            <th>Amount</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Milk Product</td>
                                            <td>20000</td>
                                            <td>100</td>
                                            <td>50000</td>
                                            <td><button class="btn btn-default btn-sm" data-toggle="collapse" id="row1" data-target=".row1">View Detail</button></td>
                                        </tr>
                                        <tr class="collapse row1">
                                            <td>1.1</td>
                                            <td>Milk Sub-cat</td>  
                                            <td>500</td>
                                            <td>10</td>
                                            <td>5000</td>
                                            <td><input type="checkbox" /> Select</td>
                                        </tr>
                                        <tr class="collapse row1">
                                            <td>1.2</td>
                                            <td>Milk Sub-cat</td>  
                                            <td>500</td>
                                            <td>10</td>
                                            <td>5000</td>
                                            <td><input type="checkbox" /> Select</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Seeds Product</td>
                                            <td>50000</td>
                                            <td>300</td>
                                            <td>100000</td>
                                            <td><button class="btn btn-default btn-sm" data-toggle="collapse" id="row2" data-target=".row2">View Detail</button></td>
                                        </tr>
                                        <tr class="collapse row2">
                                            <td>2.1</td>
                                            <td>Seed Sub-cat</td>  
                                            <td>500</td>
                                            <td>10</td>
                                            <td>5000</td>
                                            <td><input type="checkbox" /> Select</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
                        </div>


                       
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
            
        </div>
        
        </div>
    </div>

</div>

   <!-- add user modal -->
    <div id="create-modal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <form action="/action_page.php">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add User</h4>
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
                </form>
            </div>
        </div>
    </div>
    <!-- add user modal -->

    <!-- edit modal -->
    <div id="editModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
                <form action="/action_page.php">
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
    <script type='text/javascript' src="${contextPath}js/a_dataTables.fixedHeader.min.js"></script>
    <script type='text/javascript' src='${contextPath}js/a_wow.js'></script>
    <script type='text/javascript' src="${contextPath}js/a_main.js"></script>
    <script type='text/javascript' src="${contextPath}js/sweetalert2.min.js"></script>
    <script type='text/javascript' src="${contextPath}js/billing_details.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script>
        new WOW().init();
        $(document).ready(function() {

           // $("#from").datepicker();


    if($(window).width() <= 768){
        $('.site-navigation').addClass('opened');
        $('.content-box-wrapper').addClass('wid-change');
        }
        

         /*$('.delete-popup').click(function(){
            swal({
            title: 'Are you sure?',
            text: "It will permanently deleted !",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
            }).then(function() {
                swal(
                'Deleted!',
                'Your file has been deleted.',
                'success'
                );
            })
            });*/



    
    
     /*$( ".selector" ).datepicker({ dateFormat: 'yy-mm-dd' });*/
//$( "tr.collapse" ).wrapAll( "<div class='coll'></div>" );
/*setTimeout(function(){

$('.collapse').not('.collapse+.collapse').each(function(){
  $(this).nextUntil(':not(.collapse)').andSelf().wrapAll('<tr class="coll" ></tr>');
});
}, 1000);*/
$(".collapse+.collapse").addClass("akash");
   
   var addSerialNumber = function () {
    var index = 1 ;
    $('#table1 tr').each(function(index) {
        $(this).find('td:nth-child(1)').html(index+0);
    });

    $('#table2 tr').each(function(index) {
        $(this).find('td:nth-child(1)').html(index+0);
    });

    $('#table3 tr').each(function(index) {
        $(this).find('td:nth-child(1)').html(index+0);
    });
};
addSerialNumber();
})
 function logoutSubmit(){
    		
    		document.getElementById("logoutForm").submit();
    	}
    </script>
   
</body>
</html>
