<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9"> <![endif]-->
 <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Dairy App</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/style2.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
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
                    <!-- <a class="navbar-brand" href="#">Welcome</a> -->
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Profile</a></li>
                        <li><a href="#">Settings</a></li>
                        <li><a href="#">Log Out</a></li> 
                    </ul>
                    </div>
                    <div class="mobile-header text-center">
                        Welcome<br>
                        <h3>Shree Traders</h3>
                    </div>
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
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Welcome <strong>Shree Traders </strong></span>
                        <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Profile</a></li>
                            <li><a href="#">Settings</a></li>
                            <li><a href="#">Log Out</a></li>
                        </ul>
                    </li>
                </ul>

                <div class="col-xs-12 mobile-navlist">
                    <div>
                        <ul class="nav nav-pills">
                            <li class="active"><a data-toggle="pill" href="#menu1">My Task List</a></li>
                            <li><a data-toggle="pill" href="#menu2">My Billing</a></li>
                            <li><a data-toggle="pill" href="#menu3">Retailers Orders </a></li>
                        </ul>
                    </div>    
                </div>

            </div>
            </nav>

            <div class="col-xs-12 desktop-navlist">
                <div>
                    <ul class="nav nav-pills">
                        <li class="active"><a data-toggle="pill" href="#menu1">My Task List</a></li>
                        <li><a data-toggle="pill" href="#menu2">My Billing</a></li>
                        <li><a data-toggle="pill" href="#menu3">Retailers Orders</a></li>
                    </ul>
                </div>    
            </div>

            <div class="col-md-12">
                    <div class="tab-content">
                        <div id="menu1" class="tab-pane fade in active">
                            <div class="col-xs-12 mobile-create-filter">
                                    <a href="#"><span class="pull-right create-filter-icons"><i class="fas fa-filter fa-2x"></i></span></a> 
                                    <a href="#"><span class="pull-right label label-danger create-filter-icons"><i class="fas fa-edit"></i> Create</span></a> 
                            </div>                            
                            <div>
                            
                            <c:forEach items="${headerList}" var="item" varStatus="status">
							    <div class="col-xs-12 col-md-4">
                                        <div class="well well-confirmed">
                                        <a href="http://www.google.com" target="_blank">
                                            <div>
                                                <h4><strong>${item.headerID}</strong></h4>
                                                
												<c:choose>
													<c:when test="${item.FLAG == 'C'}">
												        <span class="pull-right confirmed"><i class="fas fa-check-circle"></i> CONFIRMED</span>
													</c:when>
													<c:when test="${item.FLAG == 'R'}">
                                                        <span class="pull-right rejected"><i class="fas fa-ban"></i> REJECTED</span>
													</c:when>
													<c:otherwise>
												        <span class="pull-right pending"><i class="fas fa-dot-circle"></i> PENDING</span>
													</c:otherwise>
												</c:choose>
											</div>  
                                            <div class="date">
                                                <span>${item.ERDAT}</span>
                                                <h4 class="pull-right confirmed"><strong>${item.NETWR}</strong></h4>
                                            </div>
                                            <div>
                                            	<h5><span class="">Number of Items</span></h5>
                                                
                                                <c:choose>
													<c:when test="${item.FLAG == 'C'}">
												        <h5><span class="label label-confirmed">${item.noOfItems}</span></h5>
													</c:when>
													<c:when test="${item.FLAG == 'R'}">
                                                        <h5><span class="label label-rejected">${item.noOfItems}</span></h5> 
													</c:when>
													<c:otherwise>
												        <h5><span class="label label-pending">${item.noOfItems}</span></h5> 
													</c:otherwise>
												</c:choose>
                                            </div>                        
                                        </a>    
                                        </div>                
                                 </div>
							    
							</c:forEach>
							
							
                                  <!--   <div class="col-xs-12 col-md-4">
                                        <div class="well well-confirmed">
                                        <a href="http://www.google.com" target="_blank">
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
 -->
                                    <div class="col-xs-12">
                                        <a href="https://fontawesome.com/icons/plus?style=solid" target="_blank" class="mobile-create">
                                            <span><i class="fas fa-plus fa-2x"></i></span>
                                        </a>
                                        <a href="https://fontawesome.com/icons/filter?style=solid" target="_blank" class="mobile-filter">
                                            <span><i class="fas fa-filter fa-2x mobile-filter-icon"></i></span>
                                        </a>
                                    </div>
                                    
                                </div>
                        </div>

                        <div id="menu2" class="tab-pane fade">
                            <h3>Menu 2</h3>
                            <div class="col-xs-12 mobile-create-filter">
                                    <a href="#"><span class="pull-right create-filter-icons"><i class="fas fa-filter fa-2x"></i></span></a> 
                                    <a href="#"><span class="pull-right label label-danger create-filter-icons"><i class="fas fa-edit"></i> Create</span></a> 
                            </div>                            
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                            <div class="col-xs-12">
                                <a href="https://fontawesome.com/icons/plus?style=solid" target="_blank" class="mobile-create">
                                    <span><i class="fas fa-plus fa-2x"></i></span>
                                </a>
                                <a href="https://fontawesome.com/icons/filter?style=solid" target="_blank" class="mobile-filter">
                                    <span><i class="fas fa-filter fa-2x mobile-filter-icon"></i></span>
                                </a>
                            </div>
                        </div>

                        <div id="menu3" class="tab-pane fade">
                            <h3>Menu 3</h3>
                            <div class="col-xs-12 mobile-create-filter">
                                    <a href="#"><span class="pull-right create-filter-icons"><i class="fas fa-filter fa-2x"></i></span></a> 
                                    <a href="#"><span class="pull-right label label-danger create-filter-icons"><i class="fas fa-edit"></i> Create</span></a> 
                            </div>                            
                            <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                            <div class="col-xs-12">
                                <a href="https://fontawesome.com/icons/plus?style=solid" target="_blank" class="mobile-create">
                                    <span><i class="fas fa-plus fa-2x"></i></span>
                                </a>
                                <a href="https://fontawesome.com/icons/filter?style=solid" target="_blank" class="mobile-filter">
                                    <span><i class="fas fa-filter fa-2x mobile-filter-icon"></i></span>
                                </a>
                            </div>
                        </div>
                    </div>
            </div>

        </div>
    </div>    
    
</body>
</html>