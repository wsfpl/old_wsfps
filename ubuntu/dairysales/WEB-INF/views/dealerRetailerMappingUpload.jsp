<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<% response.addHeader("X-Frame-Options", "SAMEORIGIN");  %>  
<% response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");  %>  
<% response.addHeader("Pragma", "no-cache");  %>  
<% response.addDateHeader ("Expires", 0); %>  
<% response.addHeader("X-Powered-By",""); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Upload DRM</title>                
		<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'>
	    <meta name="viewport" content="width=device-width">
	    <meta name="_csrf" content="${_csrf.token}" />
		<meta name="_csrf_header" content="${_csrf.headerName}" />
	    <!-- Bootstrap js start -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/ajaxSetup.js"></script>  
		<!-- Bootstrap js end -->
		<!-- Bootstrap css start -->
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet"> 

	    
	    
<script>
   
   $(document).ready(function(){
	   $('#selectFile').change(function() {
		  	 var ext = $('#selectFile').val().split('.').pop().toLowerCase();
		       if($.inArray(ext, ['xlsx','xls'])>-1) {
		           $('#uploadTemplate').prop('disabled',false);
		       }
		     });
		   
		   /** METHOD FOR UPLOAD STUDENT EXCEL SHEET **/
		   $("#uploadTemplate").click(function (event) {
		  	 debugger;   
		  	//stop submit the form, we will post it manually.
		       event.preventDefault();
		       // Get form
		       var form = $('#fileUploadForm')[0];

				// Create an FormData object
		       var data = new FormData(form);
		       //var file=$("#selectFile").val();
		    // disabled the submit button
		      // $("#uploadTemplate").prop("disabled", true);
		       
		       $.ajax({
		           type: "POST",
		           enctype: 'multipart/form-data',
		           url: "uploadDRMSheet",     
		           data: data,  
		           //data: {file:file},  
		           processData: false,
		           contentType: false,
		           cache: false,
		           timeout: 600000,
		           success: function (data) {
		        	   
		          	 debugger;
		          	 if(data=="Error"){
		          		
		          		 alert("Success xXXXXXXx: "+data);
		          		 console.log(" =================== INSIDE ERROR =================== ");
		          		 document.getElementById("drmErrorExcelForm").submit();
		          		 
		              	
		                    
		          	 }else{
		          		 alert("Success:"+data);
		              	
		          	 } 
		          	  
		           },
		           error: function (e) {
		          	 alert("error"+e);  
		              

		           }
		       });

		   });
  
   
   }); 
   
   </script>
	</head>
  
<body>

 <form:form method = "POST" action="#" id="fileUploadForm" enctype = "multipart/form-data">  
     Please select a file to upload : 
     <input type = "file" id="selectFile" name = "file" />  
     <input type = "submit" id ="uploadTemplate" value = "upload" />  
     <c:if test="${not empty message}">
			<div class="msg">${message}</div>     
		</c:if>
  </form:form>
	<c:url value="/drmErrorExcel" var="drmErrorExcelUrl" />
	<form action="${drmErrorExcelUrl}" method="GET" id="drmErrorExcelForm">
<%-- 		<input type="hidden" name="${_csrf.parameterName}" --%>
<%-- 			value="${_csrf.token}" /> --%>
	</form>

</body>
  
</html>