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

<head>
<spring:url value="/" var="contextPath" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Products1 - Seed and Dairy</title>
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
       
    </style>
</head>

<body>
<spring:url value="/" var="contextPath" />
    <div class="site-navigation trans-4ms">
        <div class="site-nav-inner-box">
            <div>
                <ul class="">
                    <li>
                        <div class="top-logo-box">
                            <img src="${contextPath}images/Mahindra-logo1.png" class="rm-logo" />
                            <img src="${contextPath}images/mahindra_Agri_white.png" class="m-logo" />
                            <div class="clearfix"></div>
                        </div>
                    </li>
                    <li class="active">
                        <a href="dashboard.html">
                            <div class="icon-box"><i class="fa fa-tachometer"></i></div>
                            <p>Dashboard</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <li class="">
                        <a href="users.html">
                            <div class="icon-box"><i class="fa fa-user"></i></div>
                            <p>User Master</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <li class="">
                        <a href="sync.html">
                            <div class="icon-box"><i class="fa fa-refresh"></i></div>
                            <p>Services</p>
                            <div class="clearfix"></div>
                        </a>
                    </li>
                    <li class="">
                        <a href="reports.html">
                            <div class="icon-box"><i class="fa fa-file"></i></div>
                            <p>Reports</p>
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
                        <img src="images/white-spread-black.png" class="mag_logo" />
                        <div class="clearfix"></div>
                    </div>
                    <div class="profile-logout-box">
                        <div class="profile-box">
                            <a href=""><i class="fa fa-user"></i><!--<img src="" class="img-responsive" / >-->
                                <p class="p-text trans-4ms">Admin</p>
                            </a>
                        </div>
                        <div class="logout-box">
                            <a href=""><i class="fa fa-sign-out"></i>
                                <p class="l-text trans-4ms">Logout</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-box-wrapper1">
                <div class="content-box-inner-wrapper">
                    <div class="breadcrumps-box">
                        <p class="breadcrumps-text">Product Detail</p>
                        <!-- <button class="create-btn"><i class="fa fa-plus trans-4ms"></i> &nbsp;Add user</button> -->
                        <div class="clearfix"></div>
                    </div>
                    <div class="input-daterange input-group" id="flight-datepicker">
                        <div class="col-sm-3">    
                            <div class="form-item">
                                <label>From Date:</label>
                                <span class="fontawesome-calendar"></span>
                                <input class="input-sm form-control select-style1" type="text" id="start-date" name="start" placeholder="from date" data-date-format="DD, MM d"/><span class="date-text date-depart"></span>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-item">
                                <label>To Date:</label>
                                <span class="fontawesome-calendar"></span>
                                <input class="input-sm form-control select-style1" type="text" id="end-date" name="end" placeholder="to date" data-date-format="DD, MM d"/><span class="date-text date-return"></span>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label for="region">Indicator</label>    
                                <div class="input-group" id="business">
                                    <select class="select-style1">
                                        <option value="860">860</option>
                                        <option value="862">862</option>
                                        <option value="933">933</option>
                                        <option value="935">935</option>
                                    </select>
                                </div>
                            </div> 
                        </div>
                        <div class="col-sm-3">
                            <button type="button" class="btn btn-success btn-posit">Submit</button>
                        </div> 
                    </div>
                    <div class="data-table-box">
                        <div>
                            <div class="table-responsive">
                                <table class="table table-stripped table-bordered user-data-table">
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>KUNNR</th>
                                            <th>VKORG</th>
                                            <th>SPART</th>
                                            <th>NETWR</th>
                                            <th>FLAG</th>
                                            <th>STATUS</th>
                                            <th>ERDAT</th>
                                            <th>HEADER ID</th>
                                            <!-- <th>ACTION</th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                           <!--  <td><button class="btn btn-warning" data-toggle="modal" data-target="#editModal">edit</button> <button class="btn btn-danger delete-popup">delete</button></td> -->
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
    <script type='text/javascript' src="${contextPath}js/bootstrap-datepicker.min.js"></script>
    <script type='text/javascript' src="${contextPath}js/jquery.dateFormat.js"></script>
    <script>
        new WOW().init();
        $(document).ready(function() {
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

         $('.delete-popup').click(function(){
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
            })
        includeHTML();

    </script>

    <script type="text/javascript">
        var dateSelect     = $('#flight-datepicker');
        var dateDepart     = $('#start-date');
        var dateReturn     = $('#end-date');
        var spanDepart     = $('.date-depart');
        var spanReturn     = $('.date-return');
        var spanDateFormat = 'ddd, MMMM D yyyy';

        dateSelect.datepicker({
        autoclose: true,
        format: "mm/dd",
        maxViewMode: 0,
        startDate: "now"
        }).on('change', function() {
        var start = $.format.date(dateDepart.datepicker('getDate'), spanDateFormat);
        var end = $.format.date(dateReturn.datepicker('getDate'), spanDateFormat);
        spanDepart.text(start);
        spanReturn.text(end);
        });
    </script>
</body>
</html>
