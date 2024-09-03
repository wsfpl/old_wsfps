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
    <title>Dashboard - Seed and Dairy</title>
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
    <style>
    
    </style>
</head>

<body>
<spring:url value="/" var="contextPath" />
<c:url value="/admin" var="admin" />
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
                    <li class="active">
                        <a href="${admin}/dashboard">
                            <div class="icon-box"><i class="fa fa-tachometer"></i></div>
                            <p>Dashboard</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <li class="">
                        <a href="${admin}/usersmaster">
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
                        <a href="${admin}/billing">
                            <div class="icon-box"><i class="fa fa-file"></i></div>
                            <p>Billing Details</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                      <li class="">
                        <a href="${admin}/getAllDealerTmRmDetails">
                            <div class="icon-box"><i class="fa fa-file"></i></div>
                            <p>Dealer TM RM deatils</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <%-- <li>
                        <a href="${admin}/prdplnt">
                            <div class="icon-box"><i class="fa fa-user"></i></div>
                            <p>Product 862 Master</p>
                            <div class="clearfix"></div>
                        </a>
                    </li> --%>
                    <li>
                        <a href="${admin}/prddlr">
                            <div class="icon-box"><i class="fa fa-user"></i></div>
                            <p>Dealerwise Product Master</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <li>
                        <a href="${admin}/outstanding">
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
                        <div class="profile-box">
                            <a href=""><i class="fa fa-user"></i><!--<img src="" class="img-responsive" / >-->
                            <p class="p-text trans-4ms"><c:out value="${user.firstname}"></c:out></p>
                            </a>
                        </div>
                        <div class="logout-box">
                            <a onclick="javascript:logoutSubmit()"><i class="fa fa-sign-out"></i>
                            <p class="l-text trans-4ms">Logout</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-box-wrapper1">
                <div class="content-box-inner-wrapper">
                    <div class="breadcrumps-box">
                        <p class="breadcrumps-text">Dashboard</p>
                        <div class="clearfix"></div>
                    </div>
                    <div class="card-box">
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <div class="overview-item overview-item--c1">
                            <!-- <div class="icon-box">
                            <i class="fa fa-user icon-size" aria-hidden="true"></i>
                            <div class="icon-overlay">
                                <h4>User</h4>
                            </div>
                            <span class="photo-zoom">
                                <a href="single-project.html" class="view-project"><i class="fa fa-search-plus fa-2x"></i></a>
                            </span>
                            </div> -->
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="fa fa-user icon-size" aria-hidden="true"></i>
                                        </div>
                                        <div class="text">
                                            <h2><c:out value="${userCount}"></c:out></h2>
                                            <span>Users</span>
                                        </div>
                                        <div class="text1">
                                            <span class="photo-zoom">
                                                <a href="${admin}/userdashboard" class="view-project"><i class="fa fa-eye fa-2x search-color"></i></a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <div class="overview-item overview-item--c2">
                            <!-- <div class="icon-box">
                            <i class="fa fa-product-hunt icon-size" aria-hidden="true"></i>
                            <div class="icon-overlay">
                                <h4>Product</h4>
                            </div>
                            <span class="photo-zoom">
                                <a href="single-project.html" class="view-project"><i class="fa fa-search-plus fa-2x"></i></a>
                            </span>
                            </div> -->
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="fa fa-product-hunt icon-size" aria-hidden="true"></i>
                                        </div>
                                        <div class="text">
                                            <h2><c:out value="${productCount}"></c:out></h2>
                                            <span>Products</span>
                                        </div>
                                        <div class="text1">
                                            <span class="photo-zoom">
                                                <a href="${admin}/productdetails" class="view-project"><i class="fa fa-eye fa-2x search-color"></i></a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <div class="overview-item overview-item--c3">
                            <!--  <div class="icon-box">
                            <i class="fa fa-4x fa-rocket icon-size" aria-hidden="true"></i>
                            <div class="icon-overlay">
                                <h4>Reports</h4>
                            </div>
                            <span class="photo-zoom">
                                <a href="single-project.html" class="view-project"><i class="fa fa-search-plus fa-2x"></i></a>
                            </span>
                            </div> -->
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="fa fa-shopping-cart icon-size" aria-hidden="true"></i>
                                        </div>
                                        <div class="text">
                                            <h2><c:out value="${orderCount}"></c:out></h2>
                                            <span>Orders</span>
                                        </div>
                                        <div class="text1">
                                            <span class="photo-zoom">
                                                <a href="${admin}/orders" class="view-project"><i class="fa fa-eye fa-2x search-color"></i></a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>  
                    </div>
                </div>
                <div class="data-table-box">
                    <div>
                        <div class="table-respondsive"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type='text/javascript' src="${contextPath}js/a_jquery-2.1.3.min.js"></script>
    <script type='text/javascript' src="${contextPath}js/a_jquery-ui.js"></script>
    <script type='text/javascript' src="${contextPath}js/a_bootstrap.min.js"></script>
    <script type='text/javascript' src="${contextPath}js/a_jquery.dataTables.js"></script>
    <script type='text/javascript' src="${contextPath}js/a_dataTables.bootstrap.min.js"></script>
    <script type='text/javascript' src="${contextPath}js/a_dataTables.fixedHeader.min.js"></script>
    <script type='text/javascript' src='${contextPath}js/a_wow.js'></script>
    <script type='text/javascript' src="${contextPath}js/a_main.js"></script>
    <script>
        new WOW().init();
        $(document).ready(function() {
            if($(window).width <= 768){
					$('.site-navigation').addClass('opened');
					$('.content-box-wrapper').addClass('wid-change');
                }
            var table = $('#myTable').DataTable({
                responsive: true,
                paging: true,
            });
            $(".datepicker").datepicker();
            $(".filter-row td").each(function(i) {
                var select = $('<select><option value=""></option></select>')
                    .appendTo($(this).empty())
                    .on('change', function() {
                        table.column(i)
                            .search($(this).val())
                            .draw();
                    });

                table.column(i).data().unique().sort().each(function(d, j) {
                    select.append('<option value="' + d + '">' + d + '</option>')
                });
            });

            new $.fn.dataTable.FixedHeader(table);
            $(table.table().container()).on('keyup', 'tfoot input', function() {
                table
                    .column($(this).data('index'))
                    .search(this.value)
                    .draw();
            });
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
function logoutSubmit(){
    		
    		document.getElementById("logoutForm").submit();
    	}
    </script>
</body>
</html>
