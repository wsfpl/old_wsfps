<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="_csrf" content="${_csrf.token}" />
	<meta name="_csrf_header" content="${_csrf.headerName}" />
  <title>pending order</title>
  <link rel="stylesheet" href="css/tm_css/bootstrap.min.css">
  <link rel="stylesheet" href="css/tm_css/style.css">
  <link rel="stylesheet" href="css/tm_css/responsive.css">
  <link rel="stylesheet" href="css/tm_css/o_style.css">
  <link rel="stylesheet" href="css/tm_css/themify-icons.css">
  <link href="css/tm_css/fontawesome-all.css" rel="stylesheet" type="text/css">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="css/tm_css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/tm_css/owl.carousel.min.css">
<link rel="stylesheet" href="css/tm_css/owl.theme.default.min.css">
</head>
<body class="orderdetails-cls o-orderdetails-cls"> 
<div class="overlay">
        <div class="inner_overlay">
            <img src="images/tenor.gif" class="loader_img">
        </div>
    </div>
<spring:url value="/" var="contextPath" />
	<c:url value="/logout" var="logoutUrl" />
	    	<!-- csrt for log out-->
	<form action="${logoutUrl}" method="POST" id="logoutForm">
	  <input type="hidden" 		name="${_csrf.parameterName}"		value="${_csrf.token}" />
	</form>
<section class="header-sec">
    <div class="header">
       <div class="logo-left-sec">
         <div class="logo-left">
            <a href="" class="logo-img"><img src="images/white-spread1.png"></a>
         </div>
           
        </div>
        <div class="sec-right">
            <div class="burger-menu">
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
            </div>
            <ul class="xs-dropdown-open-ul">
                <li><i class="fa fa-user-circle-o user-circle-icon"></i><i class="fa fa-angle-down dropdown-xs"></i><span class="admin-name-text-desktop">${fName}</span></li>
               <!--  <li class="xs-hidden"><span class="logout-sec"><i class="glyphicon glyphicon-off"></i><span class="logout-text">Logout</span></span></li> -->
               <li class="xs-hidden"><span class="logout-sec"><a onclick="javascript:logoutSubmit()"><i class="glyphicon glyphicon-off"></i>  Logout</a></li>
            </ul>
            <ul class="dropdown-menu-xs">
                <li  class="">
                    <i class="fa fa-user-o"></i>
                    <span class="admin-name-text-xs">Admin name</span>
                </li>
                <li  class="">
                    <span class="logoutsec"><a onclick="javascript:logoutSubmit()"><i class="glyphicon glyphicon-off"></i>Logout</a></span>
                </li>
            </ul>
            <div class="clearfix"></div>
        </div>
         
    </div> 
</section>
<section class="main-container">
    <div class="left-menu-panel order-menu-panel">
        <div class="overlay-menu"></div>
        <div class="search-tab">
            <input type="text" class="form-control search-input" placeholder="search here..">
        </div>
        <div class="scroll-div">
        <ul class="order-menu-panel-ul" id="headers">
        <c:forEach items="${headerDtlsList}" var="list"  varStatus="status">
            <li class=" all_headers_li ${status.index eq 0 ? 'active' : ''}"  id="${list.headerId}">
                <a  class="menu-items-a">
                    <div class="order-sec">
                        <div class="order-panel-left">
                            <p class="order-id">${list.headerId}</p>
                        </div>
                        <div class="order-panel-right">
                            <p class="order-rs">${list.netPrice}</p>
                            <span class="inr-text">${list.curr}</span>
                        </div>
                    </div>
                    <div class="date-sec"><i class="fa fa-calendar-o"></i>${list.date}</div>
                </a>
            </li>
            </c:forEach>
        </ul>
        </div>
    </div>
    <div class="left-content-panel">
     <div class="wrapper-orders">
        <div class="card-text">Orders Details</div>
             <ol class="breadcrumb text-black mb-0 pull-right">
                 <li><a href="<spring:url value="/rmdashboard"/>" class="menu-items-a"><i class="glyphicon "></i>Dashboard</a></li>
                <li><a class ="abcded menu-items-a pendingorders-redirectlink" href="<spring:url value="/pendingorder"/>" >Pending Orders</a></li>
                <li class="active text-theme-colored">orders Details</li>
            </ol>
        </div>
     <div class="container-fluid">
          <div class="common-inner-padding">
           <div class="order-top-detail">
            <div class="dealer-top-detail">
                <p class="dealer-p">Dealer:<span class="">${dlr.name}/${dlr.userId}</span></p>
            </div>
            <div class="credit-top-detail">
                 <p class="dealer-p">Credit:<span class=""><i class="fas fa-rupee-sign"></i>${dlr.crdtlmt}</span></p>
            </div>
        </div>
            <div class="table-wrapper o-table-wrapper">
            <div class="hiddenxs">
                <div class="col-sm-12">
                	<div class="pull-left classOrderId"><h5 class="order-left-title">Order Id: 30009611</h5></div>
                    <div class="pull-right mb-15 approve-reject-box">
                        <button type="button" class="btn approve-btn approve-btn-dsk-divice enbdisbuttons"><i class="fa fa-check"></i>Approve</button>
                        <button type="button" class="btn reject-btn reject-btn-dsk-divice enbdisbuttons"><i class="fa fa-times"></i>Reject</button>
                    </div>
                </div>
                <div class="col-sm-12">
                <div class="">
                    <div class="table-responsive">
                                 <table id="order-table" class="display table-style" style="width: 100%">
                                    <thead>
                                        <tr>
                                           <th><input type="checkbox" class="chkboxAll" id="" name="" value=""></th>
                                           <th>Product Name</th>
                                            <th>Product Id</th>
                                            <th>Qty(Dlr/TM)</th>
                                            <th>Appr. Qty</th>
                                            <th>Unit</th>
                                            <th>Price</th>
                                            <th>Net Price</th>
                                            <th>Requested Date</th>
                                        </tr>
                                   </thead>
                                    <tbody>
                                </tbody>
                               </table>
                               <div id="dlrCommentsDivId"></div> 
                            </div>
                </div>
            </div>
            </div>
       <div class="hiddenlargedevice">
           <div class="col-sm-12 p-0">
           <%-- <c:if test="${headerDtlsList.size() eq 0}"> --%>
            <div hidden class="hideElement" id="noResult">  Data Not Found</div>
        <%-- </c:if>  --%>
           <c:forEach items="${headerDtlsList}" var="list"  varStatus="status"> 
            <div class="o-details-card">
            <div class="o-display-wrapper">
          	  <div class="o-display-table">
                <div class="o-left-detail">
                    <h4 class="inr-h4">${list.netPrice}</h4>
                    <div class="o-inr-text">${list.curr}</div>
                </div>
                <div class="o-right-detail orderId">
                    <div class="o-order-panel">
                        <div class="o-order-header">
                            <div class="textleft">
                                <p>Order Id:<span class="value-span class-order-ref" id="orderId">${list.headerId}</span></p>
                                <p>Order Date:<span class="value-span class-order-date">${list.date}</span></p>
                            </div>
                            <div class="design-overview">
                                <div class="upper-circle"></div>
                                <div class="vertical-bar"></div>
                            </div>
                            <div class="lower-circle"></div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div> 
            </div>
            <div class="o-all-details" id="prdItemsdtlsId">
                 
            </div>
           </div>
            </c:forEach>
        </div>	
           </div>
           
       </div>
     </div>
     <!-- end of table wrapper -->
     
        </div>
             </div>
            </div>
        </div>
    </div>
    </div>
</section>
<!-- Modal -->
<div id="deletemodal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-dialog-width">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <p>Are you sure you want to delete?</p>
      </div>
      <div class="modal-footer">
          <div class="text-center">
            <button type="button" class="btn ok-btn">OK</button>
            <button type="button" class="btn cancel-btn" data-dismiss="modal">Cancel</button>
          </div>
      </div>
    </div>

  </div>
</div>
<!-- Modal -->
<div id="myModal" class="modal fade order-modal-style" role="dialog">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content i-btn-content" >
      
    </div>

  </div>
</div>
<!-- Modal -->
<div id="statusapproverejectmodal" class="modal fade statusapproverejectmodal-style" role="dialog">
  <div class="modal-dialog" id="approveRejectModalId">
    <!-- Modal content-->

  </div>
</div>
<script src="js/tm_js/jquery.min.js"></script>
<script src="js/tm_js/bootstrap.min.js"></script>
<script src="js/tm_js/jquery.dataTables.min.js"></script>
<script src="js/tm_js/owl.carousel.js"></script>
<script src="js/tm_js/rmpendingordsdtls.js"></script>
</body>
</html>

