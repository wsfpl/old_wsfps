$(document).ready(function() {
	
	getAllOrders();
	
	$('#addAgendaDocs').trigger("reset");
	
	$("#addUsersForm").submit(function(e)
    	  {
    	   			e.preventDefault();
    	   			
    	   			
    		//	if(myfun1()){ 
    	   			//var formData = $("#addUsersForm").serialize();
    	   			var formData = new FormData();
    	   			formData.append("userID",$("#userID").val());
    	   			formData.append("userfname",$("#userfname").val());
    	   			formData.append("userlname",$("#userlname").val());
    	   			formData.append("useraddress",$("#useraddress").val());
    	   			formData.append("userrole",$("#userrole").val());
    	   			formData.append("plant",$("#plant").val());
    	   			formData.append("regio",$("#regio").val());
    	   			formData.append("business",$("#business option:selected").text());
    	   			formData.append("mobile_no",$("#mobile_no").val());
    	   			formData.append("sales_org",$("#sales_org").val());
    	   			var sales_org=$("#sales_org").val();
    	   			//formData.append("_csrf",$("#csrf_token").val());
    	   			alert($("#csrf_token").val());
    	   		//	alert($("#business option:selected").text());
    	   			var massege = null;
    	   			var url = "addUser";
    	   			var jsonDataFromServer = null;
                          
    	   			//     jsonDataFromServer = sendData(message,jsonDataToServer, url);

    	   			$.ajax({
    	   				type : "POST",  	   				
    	   				url : "addUser", 
      	   				async:true,
    	   			    dataType:'json',
    	   				processData:false,
    	   				contentType:false,
    	   				//contentType: "application/json; charset=utf-8",
    	   				/*data : {sales     :   sales_org,
    	   					       _csrf 			: 	$("#csrf_token").val()
    	   					},*/
    	   				success : function(data)
    	   				{
    	   					jsonDataFromServer = data;
    	   					swal(jsonDataFromServer);                                       
    	   					$("#addUsersModel").modal('hide');
    	   					//$(".addAlert").modal('show');
    	   					//$(".addAlert .alert-success").show();
    	   					setTimeout(function(){$(".addAlert").modal('hide');}, 4000);
    	   					getAllUsers();
    	   					
                                        
    	   				},
    	   				error : function(xhr, ajaxOptions, throwError)
    	   				{
    	   					//alert("Please Try Again");
    	   				}    	   				
    	   			});


    	   			if(null != jsonDataFromServer || ''!=jsonDataFromServer)
    	   			{
    	   				jsonDataFromServer = jQuery.parseJSON(jsonDataFromServer);
                   
    	   			} else {
    	   				jsonDataFromServer = '';
    	   				getAllUsers();
    	   			}
    			//}	
       });
       
             	
      
        
        
       // $('#updateCompanyButton').attr('disabled',true);

function getAllOrders(){
	 var jsonDataToServer='';//admin bussiness id
     var message = '';
     jsonDataFromServer = sendData(message,jsonDataToServer, "getAllOrders");
     if(jsonDataFromServer!=null && jsonDataFromServer!="")
     {
    	 jsonDataFromServer=jQuery.parseJSON(jsonDataFromServer);
    	 populateAllOrders(jsonDataFromServer);
     }	
}
$('#tofromsubmit').on('click', function(){
    var from=$("#start-date").val();
    var to =$("#end-date").val();
    if(from == ''|| to == ''){
    	alert();
    }
    //alert(from);alert(to);
 });
function getAllOrdersToFrom(){
	 var from=$("#start-date").val();//admin bussiness id
    var to =$("#end-date").val();
    jsonDataFromServer = sendData(from,to, "getAllOrdersToFrom");
    if(jsonDataFromServer!=null && jsonDataFromServer!="")
    {
   	 jsonDataFromServer=jQuery.parseJSON(jsonDataFromServer);
   	 populateAllOrders(jsonDataFromServer);
    }	
}

function populateAllOrders(AjendaDocs){
	
	var tr='';
		$('#orderTable tbody').empty();
             
    	$.each(AjendaDocs,function (index, element) {
    		
    		var sr = 1+index;
    		if(element.flag=="" || element.status=="Pending") {
				var STATUS ="Pending";
			}
			else if(element.flag=="C" || element.flag=="c") {
				var STATUS ="Complete";
			}
			else if(element.flag=="B" || element.flag=="b") {
				var STATUS ="Pending";
			}
			else if(element.flag=="R" || element.flag=="r")
				var STATUS ="Rejected";
    		tr = "<tr>";	
    	
    	
    	tr += "<td>" + sr + "</td>";
    	tr += "<td>" + element.userId+ "</td>";
    	tr += "<td>" + element.userName+ "</td>";
    	tr += "<td>" + element.headerId+ "</td>";
    	tr += "<td>" + element.netwr+ "</td>";
    	tr += "<td>" + element.date+ "</td>";
    	tr += "<td>" + STATUS+ "</td>";
      	tr += "</tr>";
    	
    	$('#orderTable tbody').append(tr);
    	});

}
function sendData(from, to, svrUrl)

{
       var returnData = null;
       $(".loader").show();
       $.ajax({
              type : "GET",
              url : svrUrl,
              async:false,
              data :
              {
                     from : from,
                     to : to
              },
              success : function(data)
              {
                     $(".loader").hide();
                     returnData = data;
              },
              error : function(xhr, ajaxOptions, throwError)

              {
                     //alert("Please Try Again");
              }
       });
       return returnData;
}

function myfun1(){

	  
//	 alert("for validation of addMspFrm!!!!!!!!!!!!");
	 
	 debugger;
	  
$.validator.addMethod("valueNotEquals", function(value, element, arg){
    return arg != value;
  }, "Please select an Role");

	jQuery.validator.addMethod("lettersonly", function(value, element) {
    return this.optional(element) || /^[a-z\s]+$/i.test(value);
  }, " Please Enter Text Only"); 

	$.validator.addMethod("scriptcheck", function(value, element){
    if(value.indexOf("<") != -1){
         
             return  false;
         }
         return true;
  }, "Script and HTML Not  Allowed ");

	  debugger;
	 
	 var res1= $("#addAgendaDocs").validate({
		
			
			rules : {
					agendafile : {
						required : true
					},
					meetingdate : {
						required : true
					},
					meetingtype : {
						required : true
					},
					agendacreation : {
						required : true
					},
					AD_strcasename : {
						required : true
					},
					
					
              highlight: function(element) {
                  
                  $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
            },
            unhighlight: function(element) {
                  $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
            }
			}
				
			}).form();
	 
	// alert(res1);
		return res1; 

}
//var _validFileExtensions = [".pdf", ".jpeg", ".bmp", ".gif", ".png"];
var _validFileExtensions = [".pdf"];
function ValidateSingleInput(oInput) {
    if (oInput.type == "file") {
        var sFileName = oInput.value;
         if (sFileName.length > 0) {
            var blnValid = false;
            for (var j = 0; j < _validFileExtensions.length; j++) {
                var sCurExtension = _validFileExtensions[j];
                if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                    blnValid = true;
                    break;
                }
            }
             
            if (!blnValid) {
                //alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions);
            	swal("Please upload "+ _validFileExtensions +" extension files only");
                oInput.value = "";
                return false;
            }
        }
    }
    return true;
}
});