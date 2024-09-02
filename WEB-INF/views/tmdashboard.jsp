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
<%System.out.println("inside tm dashboard.jsp");%>
<head>
<spring:url value="/" var="contextPath" />
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="_csrf" content="${_csrf.token}" />
	<meta name="_csrf_header" content="${_csrf.headerName}" />
  <title>Dashboard</title>
 
  <link rel="stylesheet" href="css/tm_css/bootstrap.min.css">
  <link rel="stylesheet" href="css/tm_css/style.css">
  <link rel="stylesheet" href="css/tm_css/themify-icons.css">
  <link rel="stylesheet" href="css/tm_css/responsive.css">
  <link rel="stylesheet" href="css/tm_css/o_style.css">
  <link href="css/tm_css/fontawesome-all.css" rel="stylesheet" type="text/css">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  
  <link rel="stylesheet" href="css/tm_css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="o-orderdetails-cls"> 
       <spring:url value="/" var="contextPath" />
		<c:url value="/logout" var="logoutUrl" />
		    	<!-- csrt for log out-->
		<form action="${logoutUrl}" method="POST" id="logoutForm">
		  <input type="hidden" 		name="${_csrf.parameterName}"		value="${_csrf.token}" />
		</form>
 <input type="hidden" id="loginId" value="${loginId}"/>
 <input type="hidden" id="loginBussId" value="${admin_buss_id}"/>
 
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
                <!-- <li class="xs-hidden"><span class="logout-sec"><i class="glyphicon glyphicon-off"></i><span class="logout-text">Logout</span></span></li> -->
                <li class="xs-hidden"><span class="logout-sec"><a onclick="javascript:logoutSubmit()" class="logout-a"><i class="glyphicon glyphicon-off"></i>  Logout</a></li>
            </ul>
            <ul class="dropdown-menu-xs">
                <li  class="">
                    <i class="fa fa-user-o"></i>
                    <span class="admin-name-text-xs">${fName}</span>
                </li>
                
                 <li  class="">
                  
                    <span class="logoutsec"><i class="glyphicon glyphicon-off"></i> <button  onclick="javascript:logoutSubmit()" class="logout-btn-cls">Logout</button></span>
                    
                </li> 
            </ul>
            <div class="clearfix"></div>
        </div>
         
    </div> 
</section>
<section class="main-container">
    <div class="left-menu-panel">
        <div class="overlay-menu"></div>
        <ul class="left-menu-panel-ul">
            <%-- <li><a href="${pageContext.request.contextPath}/tmdashboard" class="menu-items-a"><i class="glyphicon glyphicon-dashboard"></i>Dashboard</a></li> --%>
            <li><a href="<spring:url value="/tmdashboard"/>" class="menu-items-a"><i class="glyphicon glyphicon-dashboard"></i>Dashboard</a></li>
            
            <!--<li><a href="approveorders.html" class="menu-items-a"><i class="fa fa-check-square-o"></i>Approve Orders</a></li>-->
            
        </ul>
    </div>
    <div class="left-content-panel">
       
        <div class="inner-left-panel content-view active" id="dashboard-section">
            <h4 class="dasboard-text">Dashboard</h4>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="card-panel mb-15">
                  
                    <div class="inner-card-structure">
                        <div class="icons pending-icon">
                            <i class="ti-shopping-cart"></i>
                        </div>
                        <div class="content-detail">
                            <p class="content-title text-pending-color">Pending Orders</p>
                            <a class="content-value">${noOfPendingOrders }</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                     <div class="view-detail"><a class="view-page pendingorderviewclass"  data-tab="pendingorderview"><i class="fa fa-eye "></i>view</a></div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="card-panel mb-15">
                    <div class="inner-card-structure">
                        <div class="icons confirmed-icon">
                             <i class="ti-shopping-cart-full"></i>
                        </div>
                        <div class="content-detail">
                            <p class="content-title text-confirmed-color">Order and Billing Status</p>
                            <a class="content-value">${noOfOrders}</a>
                        </div>
                         <div class="clearfix"></div>
                    </div>
                     <div class="view-detail"><a class="view-page" data-tab="orderstatus"><i class="fa fa-eye"></i>view</a></div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="card-panel mb-15">
                    <div class="inner-card-structure">
                        <div class="icons dealer-icon">
                             <i class="fa fa-sitemap"></i>
                        </div>
                        <div class="content-detail">
                            <p class="content-title text-dealer-color">Dealer List</p>
                            <p class="content-value">${noOfDlrs}</p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                     <div class="view-detail"><a class="view-page" data-tab="dealerlist"><i class="fa fa-eye"></i>view</a></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <!--pending order content view-->
        <div id="pendingorderview" class="content-view">
        <div class="wrapper-orders"><div class="card-text">Pending Orders</div></div>
        <div class="container-fluid">
            <div class="common-inner-padding pending-common-inner-width">
                
                <div class="table-wrapper o-table-wrapper">
                 
                 <div class="col-sm-12 p-xs640-0 p-xs320-0">
                    <div class="filtering-orders-class">
                    <div class="col-sm-12">
	              	  <div class="">
	                    <div class="pendingorder-filter mb-15">
	                        <select class="form-control" id="pendingorders-select">
	                            <option value="ALL">All orders</option>
	                            <c:forEach items="${pendingOrderList}" var="opt">
	                            <option value="${opt.dlrNo}">${opt.dlrNm}</option>
	                            </c:forEach>
	                        </select>
	                    </div>
	                    <div class="clearfix"></div>
	                </div>
                </div>
                    <div class=" xs-responsive loop-header" id="divDlrViewCardsId">
                    
                    <c:forEach items="${pendingOrderList}" var="list">
                     <div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
                        <div class="card-box mb-15">
                            <div class="card-header">
                                <h4 class="card-header-h4">${list.dlrNm }</h4>
                            </div>
                            <div class="card-description-box">
                                <div class="details">
                                    <div class="dealer-p">
                                        <div class="dealer-title"><i class="ti-layout-grid2"></i>No of Orders:</div>
                                        <span class="dealer-value">${list.noOfOrders }</span>
                                    </div>
                                    <div class="dealer-p">
                                        <div class="dealer-title"><i class="fa fa-sitemap"></i>Dealer No:</div>
                                        <span class="dealer-value">${list.dlrNo}</span>
                                    </div>
                                </div>
                                <div class="view-box">
                                    <div class="text-center">
                                         <a  type="button" class="btn btn-view view-page" href="<spring:url value="/tmpendingordsdtls?dlrNo=${list.dlrNo}"/>">View</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   </c:forEach>
                    </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
        </div>
      
        <!--order status content view-->
        <div id="orderstatus" class="content-view">
            <div class="wrapper-orders"><div class="card-text">Order and Billing Status</div></div>
    <div class="container-fluid">
        <div class="common-inner-padding orderbilling-parent">
            <div class="table-wrapper o-table-wrapper" id="billing-order-status-filter">
             <div class="col-sm-12 p-xs-0 plr-10">
      	<form class="o-form-filtering parent-cal" >
            <div class="col-xs-4 col-sm-5 col-md-3 col-lg-3">
                  <div class="form-group form-group-mb-10">
                    <label class="from-grp-lbl">Status:</label>
                    <select class="form-control statusSel-s-cls" id="statusSel-s">
                        <option value="Pending">Pending</option>
                        <option value="Approved by TM">Processed by TM</option>
                        <option value="Approved by RM">Processed by RM</option>
                      <!--   <option value="Invoice generated">Invoice generated</option> -->
                    </select>
                  </div>
              </div>
              
              <div class="col-xs-8 col-md-9 col-sm-7 p-0 xs-w-100">
	             <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 xs-w-50">
	                  <div class="form-group form-group-mb-10">
	                    <label class="from-grp-lbl">From Date*:</label>
	                    <div class="cal-parent">
	                        <input type="text" class="form-control datepicker datepickerFrom-s statusSel-s-cls" id="fromdate">
	                        <div class="calender-icon"><i class="fa fa-calendar-o fa-calendar-from-s"></i></div>
	                    </div>
	                  </div>
	              </div>
	             <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 xs-w-50">
                 <div class="form-group form-group-mb-10">
                    <label class="from-grp-lbl">To Date*:</label>
                    <div class="cal-parent">
                        <input type="text" class="form-control datepicker datepickerTo-s statusSel-s-cls" id="todate">
                        <div class="calender-icon"><i class="fa fa-calendar-o fa-calendar-to-s"></i></div>
                   </div>
                  </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 xs-w-50">
              	abcdefg
              </div>
             </div>
              <div class="clearfix"></div>
        </form>
   			 </div>
            <div class="hiddenxs">
                <div class="col-sm-12">
                <div class="">
                    <div class="table-responsive" id ="orderstatus-table-append">
                                <table id="orderstatus-table" class="display table-style border-collapse-unset orderbillingstatus-cls" style="width: 100%">
                                    <thead>
                                    	<tr>
                                    		<th rowspan="2">Sr No.</th> 
                                            <th colspan="2">Dealer</th>
                                            <th colspan="2">Order</th>
                                            <th rowspan="2">Status</th>
                                            <th colspan="3">Quantity</th>
                                            <th rowspan="2">Net Amt.</th>
                                            <!-- <th colspan="2">Invoice</th> -->
                                            <th rowspan="2" class="text-center">View Dtls</th>
                                    	
                                    	</tr>
                                        <tr>
                                            
                                            <th>Dealer Name</th>
                                            <th>Dealer Code</th>
                                            <th>Order No.</th>
                                            <th>Order Date</th>
                                            <th>Dlr Qty</th>
                                            <th>TM appr. Qty</th>
                                            <th>RM appr. Qty</th>
                                           <!--  <th>Invoice/Ref No.</th>
                                            <th>Invoice Date</th> -->
                                            
                                        </tr>
                                   </thead>
                                    <tbody>
                                    <c:forEach items="${orderBillStatus}" var="ordBillList" varStatus="counter">
                                      <tr>
                                        <td  class="text-center">${counter.count}</td> 
                                         <td>${ordBillList.dlrNm }</td>
                                         <td>${ordBillList.dlrCd }</td>
                                         <td class="text-center">${ordBillList.ordrNo}</td>
                                         <td class="text-center">${ordBillList.ordrDate}</td>
                                         <td class="text-center">${ordBillList.status}</td>
                                         <td class="text-center">${ordBillList.dlrQty}</td>
                                         <td class="text-center">${ordBillList.tmQty}</td>
                                         <td class="text-center">${ordBillList.rmQty}</td>
                                         <td class="text-center">${ordBillList.netAmt}</td>
                                         <%-- <td class="text-center">${ordBillList.invcNo}</td>
                                         <td class="text-center">${ordBillList.invcDate}</td>
                                         --%> <td class="text-center"><button type="button" class="btn view-btn view-statusbilling-btn"><i class="fa fa-eye vieworders" value="${ordBillList.ordrNo}"></i></button></td>
                                     </tr>
                                     </c:forEach>
                                </tbody>
                               </table>
                            </div>
                </div>
            </div>
            </div>
            <!--display in mobile-->
<div class="hiddenlargedevice" id="header-dtl-s-id">
   <div class="col-sm-12 p-0" >
        <!-- header card strats --> 
        <c:forEach items="${hdrDtls}" var="hdrDtls" >
         
        <div class="o-details-card">
        <div class="o-display-wrapper">
        <c:choose>
           <c:when test="${hdrDtls.flag.equals('C1')}">
              <div class="o-display-table approve-orders-bg">
            </c:when>
            <c:when test="${hdrDtls.flag.equals('B1')}">
               <div class="o-display-table partialapporve-orders-bg">
            </c:when>
            <c:when test="${hdrDtls.flag.equals('R1')}">
               <div class="o-display-table reject-orders-bg"> 
            </c:when>
        </c:choose>
                <div class="o-left-detail">
                    <h4 class="inr-h4">${hdrDtls.netPrice}</h4>
                    <div class="o-inr-text">${hdrDtls.curr}</div>
                </div>
                <div class="o-right-detail">
                    <div class="o-order-panel">
                        <div class="o-order-header">
                            <div class="textleft">
                                <p>Order Id:<span class="value-span class-order-ref-s">${hdrDtls.headerId}</span></p>
                                <p>Order Date:<span class="value-span class-order-date-s">${hdrDtls.date}</span></p>
                                <input type="hidden" class="totalQty-s" name="totalQty" value ="${hdrDtls.totalQty }"/>
                                <input type="hidden" class="totalAmt-s" name="totalAmt" value="${hdrDtls.netPrice}"/>
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
            <div class="o-all-details"></div>
         </div>
         
        </c:forEach><!-- end of foreach -->
        </div>
        <!-- header card ends -->
    </div>               
</div>
            </div>
            
        </div>
    </div>
          <!--dealer list view-->
        <div id="dealerlist" class="content-view">
            <div class="wrapper-orders"><div class="card-text">Dealer List</div></div>
            <div class="container-fluid">
     		<div class="common-inner-padding">
            <div class="table-wrapper o-table-wrapper">
                <div class="col-sm-12">
                <div class="">
                    <div class="table-responsive table-responsive-code">
                           <table id="orderstatus-table_dealer" class="display table-style last-td-withoutstatus dealerlist-datatable-cls" style="width: 100%">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Sr No</th>
                                            <th>Dealer Name</th>
                                            <th class="text-center">User Id</th>
                                            <th class="text-center">Phone No.</th>
                                            <th class="text-center">Credit Limits</th>
                                            <th class="text-center">Outstanding</th>
                                        </tr>
                                   </thead>
                                    <tbody>
                                     <c:forEach items="${dlrDtlsList}" var="dlrList"  varStatus="counter">
                                      <tr>
                                         <td data-title="Sr No: " class="text-center">${counter.count}</td>
                                         <td data-title="Dealer Name: ">${dlrList.name }</td>
                                         <td data-title="User Id: " class="text-center">${dlrList.userId }</td>
                                         <td data-title="Phone No: " class="text-center">${dlrList.phNo }</td>
                                         <td data-title="Credit Limits: " class="text-center">${dlrList.crdtlmt }</td>
                                         <td data-title="Outstanding:" class="text-center">${dlrList.outStanding}</td>
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
 
 
 
 </div>
      
     
        
</section>

<!-- Modal -->
<div id="viewdetail-modal" class="modal fade view-detail-modal-style" role="dialog">
  <div class="modal-dialog modal-lg" >

    <!-- Modal content-->
     <div class="modal-content" id="modalOrderDtlsInnerId">
      </div> 
      <!-- Modal content end-->
    </div>

  </div>
</div>
<!-- Modal -->
<div id="myModal" class="modal fade order-modal-style" role="dialog">
  <div class="modal-dialog modal-sm i-btn-content">
    <!-- Modal content-->
    
  </div>
</div>
<div id="orderbillingmodal" class="modal fade order-modal-style" role="dialog">
  <div class="modal-dialog modal-sm i-btn-cnt-hdr">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">3000946</h4>
      </div>
      <div class="modal-body">
          <div class="modal-body-border">
              <div class="order-description">
                  <p class="allorderdetail">
                      <span class="title-information">Invoice Ref:</span>
                      <span class="fieldvalue-information">345</span>
                  </p>
                  <p class="allorderdetail">
                      <span class="title-information">Invoice Date:</span>
                      <span class="fieldvalue-information">15-02-2020</span>
                  </p>
                  <p class="allorderdetail">
                      <span class="title-information">Order Date:</span>
                      <span class="fieldvalue-information">15-02-2020</span>
                  </p>
                  
                  
              </div>
          </div>
      </div>
    </div>

  </div>
</div>   
    

<script src="js/tm_js/jquery.min.js"></script>
<script src="js/tm_js/bootstrap.min.js"></script>
<script src="js/tm_js/jquery.dataTables.min.js"></script>
<script src="js/tm_js/custom.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
var roleSeq = '${roleSeq}';
if("rmpendingorders" == roleSeq){
    $(".pendingorderviewclass").trigger('click');
}
/*  if("dealerList" == roleSeq){
    $(".dealerPageview").trigger('click');
}  */
 

});
</script>
</body>
</html>
