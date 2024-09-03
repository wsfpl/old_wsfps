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
    <title>Products</title>
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

.excel-btn{
    display: inline-block;
    top: 0;
    right: 0;
    -webkit-appearance: none;
    padding: 8px 16px;
    border-radius: 50px;
    vertical-align: bottom;
    /* float: right; */
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
                    <li class="active">
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
                    <!-- <li>
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
                             <input type="hidden" value="${sales_org}" id="admin_sales_org">
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
                            <div class="panel-heading" id="ProdType">
                                <ul class="nav nav-tabs">
                                <c:if test="${user.business_name == 'Dairy'}">
                                    <li class="active li-width prodDairy" id="47"><a class="tab-color" data-toggle="tab" href="#home">Dairy</a></li>
                                    <li class="li-width prodDairyProduct" id="48"><a class="tab-color" data-toggle="tab" href="#menu1">Dairy Product</a></li>
                                    </c:if>
                                      <c:if test="${user.business_name == 'Seeds'}">
                                    <li class="active li-width prodSeed" id="25"><a class="tab-color" data-toggle="tab" href="#menu2">Seeds</a></li>
                                    <li class="li-width prodCrop" id="27"><a class="tab-color" data-toggle="tab" href="#menu3">Crop</a></li>
                                    </c:if>
                                </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                     <c:if test="${user.business_name == 'Dairy'}">
                        <div id="home" class="tab-pane fade in active">
      <div class="content-box-wrapper1">
                <div class="content-box-inner-wrapper">
                    <div class="breadcrumps-box">
                      
                        <p class="breadcrumps-text">Dairy</p>
                       
                            <!-- <button class="create-btn"><i class="fa fa-plus trans-4ms"></i> &nbsp;Add user</button> -->
                        <div class="clearfix"></div>
                    </div>
                    <div class="data-table-box">
                        <div>
                            <div class="table-responsive">
                                <table class="table table-stripped table-bordered " id="dairyTable">
                                    <thead>
                                        <tr>
                                           <th>Sr. No</th>
                                           
                                            <th>Product Description</th>
                                            <th>Product Code</th>
                                            <th>Product Name</th>
                                            
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- <tr>
                                            <td>1</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
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
    </c:if>
    <div id="menu1" class="tab-pane fade">
      <div class="content-box-wrapper1">
                <div class="content-box-inner-wrapper">
                    <div class="breadcrumps-box">
                        <p class="breadcrumps-text">Dairy Product</p>
                        <!-- <button class="create-btn"><i class="fa fa-plus trans-4ms"></i> &nbsp;Add user</button> -->
                        <div class="clearfix"></div>
                    </div>
                    <div class="data-table-box">
                        <div>
                          <div class="table-responsive">
                                <table class="table table-stripped table-bordered " id="dairyProductTable">
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            
                                            <th>Product Description</th>
                                            <th>Product Code</th>
                                            <th>Product Name</th>
                                           
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- <tr>
                                            <td>1</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
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
    <c:if test="${user.business_name == 'Seeds'}">
    <div id="menu2" class="tab-pane fade in active">
      <div class="content-box-wrapper1">
                <div class="content-box-inner-wrapper">
                    <div class="breadcrumps-box">
                        <p class="breadcrumps-text">Seeds</p>
                        <!-- <button class="create-btn"><i class="fa fa-plus trans-4ms"></i> &nbsp;Add user</button> -->
                        
                        <div class="clearfix"></div>
                    </div>
                    <div class="data-table-box">
                        <div>
                           <div class="table-responsive">
                                <table class="table table-stripped table-bordered " id="dairyTable">
                                    <thead>
                                        <tr>
                                        <th>Sr. No</th>
                                            <th>Product Code</th>
                                            <th>Product Description</th>
                                            <th>MATNR</th>
                                            <th>MAKTX</th>
                                            <th>SPART</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- <tr>
                                            <td>1</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
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
    </c:if>
    <div id="menu3" class="tab-pane fade">
      <div class="content-box-wrapper1">
                <div class="content-box-inner-wrapper">
                    <div class="breadcrumps-box">
                        <p class="breadcrumps-text">Crop</p>
                        <!-- <button class="create-btn"><i class="fa fa-plus trans-4ms"></i> &nbsp;Add user</button> -->
                        <div class="clearfix"></div>
                    </div>
                    <div class="data-table-box">
                        <div>
                             <div class="table-responsive">
                                <table class="table table-stripped table-bordered " id="cropTable">
                                    <thead>
                                        <tr>
                                             <th>Sr. No</th>
                                            <th>Product Code</th>
                                            <th>Product Description</th>
                                            <th>MATNR</th>
                                            <th>MAKTX</th>
                                            <th>SPART</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- <tr>
                                            <td>1</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
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
    <c:if test="${user.business_name == 'CropCare'}">
    <div id="menu2" class="tab-pane fade in active">
      <div class="content-box-wrapper1">
                <div class="content-box-inner-wrapper">
                    <div class="breadcrumps-box">
                        <p class="breadcrumps-text">CropCare</p>
                        <!-- <button class="create-btn"><i class="fa fa-plus trans-4ms"></i> &nbsp;Add user</button> -->
                        
                        <div class="clearfix"></div>
                    </div>
                    <div class="data-table-box">
                        <div>
                           <div class="table-responsive">
                                <table class="table table-stripped table-bordered " id="cropCareTable">
                                    <thead>
                                        <tr>
                                        <th>Sr. No</th>
                                            <th>Product Code</th>
                                            <th>Product Description</th>
                                            <th>Product Code</th>
                                            <th>Product Name</th>
                                            <th>SPART</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- <tr>
                                            <td>1</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
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
    </c:if>
                        </div>


                       
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
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
    <script type='text/javascript' src="${contextPath}js/sweetalert2.min.js"></script>
    <script type='text/javascript' src="${contextPath}js/product.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script>
        new WOW().init();
        $(document).ready(function() {
    if($(window).width() <= 768){
        $('.site-navigation').addClass('opened');
        $('.content-box-wrapper').addClass('wid-change');
    }
            $(".datepicker").datepicker();
          
          
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
</body>
</html>
