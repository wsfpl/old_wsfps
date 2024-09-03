$(document).ready(function() {
	
	
	getAllUsers();
	
	$('#addUsersForm').trigger("reset");
	
	$("#userrole").on('blur', function () {
	    $(this).val(function (_, val) {
	        return val.toUpperCase();
	    })
	    });
	
	$("#edit_userrole").on('blur', function () {
	    $(this).val(function (_, val) {
	        return val.toUpperCase();
	    })
	    });
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
    	   			formData.append("userpass",$("#userpass").val());
    	   			var sales_org=$("#sales_org").val();
    	   			formData.append("_csrf",$("#csrf_token").val());
    	   		//	alert($("#csrf_token").val());
    	   		//	alert($("#business option:selected").text());
    	   			var massege = null;
    	   			var url = "addUser";
    	   			var jsonDataFromServer = null;
    	   		  $("#userrole").val(function(i,val) {
    	   	        return val.toUpperCase();
    	   	    });
    	   			//     jsonDataFromServer = sendData(message,jsonDataToServer, url);
    	   		//	var jsonDataToServer=formData;//admin bussiness id
    	   	     //var message = '';
    	   	     //jsonDataFromServer = sendData(message,jsonDataToServer, "addUser");
    	   	    // alert(jsonDataFromServer);
    	   			
    	   	  $.ajax({
                  type : "POST",
                  url : url,
                  data :$("#addUsersForm").serialize(),
                  processData: false,
                  success : function(data)
                  {
                         $(".loader").hide();
                       //  returnData = data;
                         $("#create-modal").modal('hide');
                         swal(data);
                        // getAllUsers();
                         //location.reload(); 
                         setTimeout(function(){// wait for 5 secs(2)
       	   		           location.reload(); // then reload the page.(3)
       	   		      }, 700);
                  },
                  error : function(xhr, ajaxOptions, throwError)

                  {
                         //alert("Please Try Again");
                  }
           });
    	   			/*$.ajax({
    	   				type : "GET",  	   				
    	   				url : "addUser", 
    	   				data:{sales     :   sales_org},
      	   				async:true,
    	   			    dataType:'json',
    	   				processData:false,
    	   				contentType:false,
    	   				//contentType: "application/json; charset=utf-8",
    	   				data : {sales     :   sales_org,
    	   					       _csrf 			: 	$("#csrf_token").val()
    	   					},
    	   				success : function(data)
    	   				{
    	   					jsonDataFromServer = data;
    	   					alert(jsonDataFromServer);                                       
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
    	   			});*/


    	   			if(null != jsonDataFromServer || ''!=jsonDataFromServer)
    	   			{
    	   				jsonDataFromServer = jQuery.parseJSON(jsonDataFromServer);
                   
    	   			} else {
    	   				jsonDataFromServer = '';
    	   			//	getAllUsers();
    	   			}
    			//}	
       });
       
             	
       
        $("#updateUsersForm").submit(function(e)
     		   {
        	//var table = $('.data-userTable').DataTable.destroy();
     	   			e.preventDefault();
     	   			
     	   			var massege = null;
     	   			var url = "updateUser";
     	   			var jsonDataFromServer = null;
                           

     	   			$.ajax({
     	   				type : "POST",  	   				
     	   				url : url,
     	   			    data :$("#updateUsersForm").serialize(),
     	   				processData:false,
     	   				success : function(data)
     	   				{
     	   					jsonDataFromServer = data;
     	   				//$("#updateUser").modal('hide');
     	   			$("#editModal").modal("hide");
     	   					swal(jsonDataFromServer);                                       
     	   					//alert(jsonDataFromServer);
     	   					//$(".addAlert").modal('show');
     	   					//$(".addAlert .alert-success").show();
     	   					setTimeout(function(){$(".addAlert").modal('hide');}, 4000);
     	   				//getAllUsers();
     	   				 setTimeout(function(){// wait for 5 secs(2)
     	   		           location.reload(); // then reload the page.(3)
     	   		      }, 700); 
     	     	   		/*setTimeout(function(){
     	     	   		var table = $('.data-userTable').DataTable({
     	     	   		    responsive: true,
     	     	   		    paging: true,
     	     	   		});	
     	     	   	},5000);*/
                                         
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
     	   			//getAllUsers();
     	   			}	
     	   		/*var table = $('.data-userTable').DataTable().reload();*/
        });

      
        $('.delete-popup').click(function(){
        	var delButton=$(this).attr('id');
        	var id=delButton.split('-')[1];
        	
        	var jsonDataToServer=id;
            var message = '';
            
            swal({
            title: 'Are you sure?',
            text: "It will permanently deleted !",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
            }).then(function() {
            	jsonDataFromServer = sendData(message,jsonDataToServer, "deleteUser");
                if(jsonDataFromServer!=null && jsonDataFromServer!=""){
                swal(
                'Deleted!',
                'Your file has been deleted.',
                'success'
                );
                }
                setTimeout(function(){// wait for 5 secs(2)
  		           location.reload(); // then reload the page.(3)
  		      }, 700); 
            }).catch(swal.noop);
            
            
            })
        
        
       	var deleteButton=null;
       	$("#delAgendaDocs").on('click',function(){
       		deleteButton=$('#agenda_id').val();
       		
       	 var jsonDataToServer=deleteButton;
         var message = '';
         jsonDataFromServer = sendData(message,jsonDataToServer, "deleteAgendaDocs");
         if(jsonDataFromServer!=null && jsonDataFromServer!="")
         {
        	 //swal(jsonDataFromServer);
        	 swal({
       		  title: "Agenda Docs deleted Successfully",
       		  icon: "warning",
       		  dangerMode: true,
       		});
        	 $("#deleteagenda").modal('hide');
        	// getAllUsers();
         }	
       	})
	});

$("#edit_userID").on("blur",function(){
	var id=$("#edit_userID").val();
	if($("#edit_userID").val()==''){
	
	$("#edit_mySpan").hide();
	return false;
	}else if(id==userID){
		 $("#edit_mySpan").hide();
	}
	else{
		
	 var jsonDataToServer=$("#edit_userID").val();//admin bussiness id
     var message = '';
     jsonDataFromServer = sendData(message,jsonDataToServer, "checkIsExists");
     //alert(jsonDataFromServer);
     if(jsonDataFromServer!=null && jsonDataFromServer!="")
     {
    	// jsonDataFromServer=jQuery.parseJSON(jsonDataFromServer);
    	 if(jsonDataToServer == jsonDataFromServer ){
    		 $("#edit_mySpan").hide();
    	 }
    	 else if(jsonDataFromServer=='TRUE'){
    	// alert(jsonDataFromServer);
    		 $("#edit_mySpan").show();
    	 }
    	 else
    		 $("#edit_mySpan").hide();
     }
     else{
    	 $("#edit_mySpan").hide();
     }
	}
});

$("#userID").on("blur",function(){
	var id=$("#userID").val();
	if($("#userID").val()==''){
	
	$("#mySpan").hide();
	return false;
	}else if(id==userID){
		$("#mySpan").hide();
		$("#mySpan1").hide();
	}
	else{
		
	 var jsonDataToServer=$("#userID").val();//admin bussiness id
     var message = '';
     jsonDataFromServer = sendData(message,jsonDataToServer, "checkIsExists");
     if(jsonDataFromServer!=null && jsonDataFromServer!="")
     {
    	// jsonDataFromServer=jQuery.parseJSON(jsonDataFromServer);
    	 if(jsonDataFromServer=='TRUE'){
    	// alert(jsonDataFromServer);
    		 $("#mySpan").show();
    	 }else if(jsonDataFromServer=='TRUE1'){
    	// alert(jsonDataFromServer);
    		 $("#mySpan1").show();
    	 }
    	 else{
    		 $("#mySpan").hide();
    		 $("#mySpan1").hide();
    		 }
     }
     else{
    	 $("#mySpan").hide();
    	 $("#mySpan1").hide();
     }
	}
});

function getAllUsers(){
	 var jsonDataToServer=$("#admin_buss_id").val();//admin bussiness id
     var message = '';
     
     jsonDataFromServer = sendData(message,jsonDataToServer, "populateUsers");
     if(jsonDataFromServer!=null && jsonDataFromServer!="")
     {
    	 jsonDataFromServer=jQuery.parseJSON(jsonDataFromServer);
    	 populateAllUsers(jsonDataFromServer);
     }	
}

function populateAllUsers(AjendaDocs){
	$('.data-userTable').DataTable().destroy();
	var tr='';
		$('.data-userTable tbody').empty();
             
    	$.each(AjendaDocs,function (index, element) {
    		var sr = 1+index;
    		tr = "<tr>";	
    	
    	
    	tr += "<td>" + sr + "</td>";
    	tr += "<td>" + element.userID+ "</td>";
    	tr += "<td>" + element.userfname+ "</td>";
    	tr += "<td>" + element.userlname+ "</td>";
    	tr += "<td>" + element.userpass+ "</td>";
    	tr += "<td class='hidden' id="+element.loginID+">" + element.loginID+ "</td>";
    	tr += "<td class='hidden' id="+element.useraddress+">" + element.useraddress+ "</td>";
    	tr += "<td class='hidden' id="+element.userrole+">" + element.userrole+ "</td>";
    	tr += "<td class='hidden' id="+element.plant+">" + element.plant+ "</td>";
    	tr += "<td class='hidden' id="+element.regio+">" + element.regio+ "</td>";
    	tr += "<td class='hidden' id="+element.mobile_no+">" + element.mobile_no+ "</td>";
    	tr += "<td class='hidden' id="+element.sales_org+">" + element.sales_org+ "</td>";
    	/*tr += '<td><button type="button" id="edit-'+element.pkid+'" class="btn btn-primary btn-md actionbtn" data-toggle="modal" data-target="#updateagenda"><i class="fa fa-edit custom-icon" aria-hidden="true"></i><span class="heading-title action-title">Update</span></button><button type="button" id="delete-'+element.pkid+'" class="btn btn-primary btn-md actionbtn" data-toggle="modal" data-target="#deleteagenda"><i class="fa fa-trash-o custom-icon" aria-hidden="true"></i><span class="heading-title action-title">Delete</span></button></td>';*/
    	tr+=' <td><div class="wid_box"><button class="btn btn-warning actionbtn" id="edituser-'+element.loginID+'" data-toggle="modal" data-target="#editModal">Edit</button> <button class="btn btn-danger delete-popup" id="deluser-'+element.loginID+'">Delete</button></div></td>';
      	tr += "</tr>";
    	
    	$('.data-userTable tbody').append(tr);
    	});
    	 
    	setTimeout(function(){
    		var table = $('.data-userTable').DataTable({
    		    responsive: true,
    		    paging: true
    		});	
    	},300);
    	
}

function OnSelectionChange() {
	console.log(userrole.value)
	let user=userrole.value;
	if ((user == 'DEALER') ||(user == 'TM')) {
		 document.getElementById("manager_id").required= true;	
		 document.getElementById("mnrek").style.display= "inline-block";	
		} else{
		document.getElementById("manager_id").removeAttribute("required");
		document.getElementById("mnrek").style.display= "none";	
	    /* document.getElementById("manager_id").required = false;*/	
		}
    
}

$("#userTable").on("click",".actionbtn",function() {
	
	var data =$(this).parents("tr").children();
	var updateButton=$(this).attr('id');
	//var sectrid = data[0].innerHTML;
	var id=updateButton.split('-')[1];
	  
	 userID = data[1].innerHTML;
	var userfname = data[2].innerHTML;
	var userlname = data[3].innerHTML;
	var userpass = data[4].innerHTML;
	var useraddress=data[6].innerHTML;
	var userrole = data[7].innerHTML;
	var plant = data[8].innerHTML;
	var regio = data[9].innerHTML;
	//var business = data[8].innerHTML;
	//var userrole = data[9].innerHTML;	
	var mobile_no=data[10].innerHTML;
	var sales_org = data[11].innerHTML;	
	//alert(userID);
	
	$("#edit_loginID").val(id); 
	$("#edit_userID").val(userID);                     
	$("#edit_userfname").val(userfname);               
	$("#edit_userlname").val(userlname);   
	$("#edit_password").val(userpass);              
	$("#edit_useraddress").val(useraddress);           
	$("#edit_userrole").val(userrole);                 
	$("#edit_plant").val(plant);                       
	$("#edit_regio").val(regio);                       
//	("business",$("#business option:selected").text());
	if(mobile_no == 'undefined')
		$("#edit_mobile_no").val();        
	else 
		$("#edit_mobile_no").val(mobile_no);               
     	$("#edit_sales_org").val(sales_org);               
	               
	
	  	});

function sendData(message, data, svrUrl)

{
       var returnData = null;
       $(".loader").show();
       $.ajax({
              type : "GET",
              url : svrUrl,
              async:false,
              data :
              {
                     message : message,
                     JDATA : data
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

//upload excel
	   $('#selectFile').change(function() {
		  	 var ext = $('#selectFile').val().split('.').pop().toLowerCase();
		       if($.inArray(ext, ['xlsx','xls'])>-1) {
		           $('#uploadTemplate').prop('disabled',false);
		       }
		     });
		   
		   /** METHOD FOR UPLOAD STUDENT EXCEL SHEET **/
		   $("#uploadTemplate").click(function (event) {
		  	   
		  	//stop submit the form, we will post it manually.
		       event.preventDefault();
		       // Get form
		       var form = $('#selectFile').val();
		       if(form == ""){
		    	   swal("Please upload file");
		       }
   if(ValidateSingleInput){
				// Create an FormData object
		       var data = new FormData();
		       data.append("file",selectFile.files[0]);
		       
		       //var file=$("#selectFile").val();
		    // disabled the submit button
		      // $("#uploadTemplate").prop("disabled", true);
		       
		       $.ajax({
		           type: "POST",
		           enctype: 'multipart/form-data',
		           url: "uploadUsers",     
		           data: data,  
		           //data: {file:file},  
	            processData: false,
	           contentType: false,
	           /*    cache: false,*/
		          // timeout: 600000,
		           success: function (data) {
		        	   
		          	 debugger;
		          	 if(data=="Error"){
		          		
		          		// alert("Success:"+data);
		              	swal(data);
		              	 $('#selectFile').attr("value", "");
		              	getAllUsers();
		              	
		          	 }else{
		          	//	 alert("Success:"+data);
		          		swal("Excel Uploaded Sucessfully");
		          		 $('#selectFile').attr("value", "");
		          		getAllUsers();
		          		
		          	 } 
		          	  
		           },
		           error: function (e) {
		          	// alert("error"+e);  
		        	   $('#selectFile').attr("value", "");

		           }
		       });
		       
   }
  
		   });





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
var _validFileExtensions = [".xls",".xlsx"];

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