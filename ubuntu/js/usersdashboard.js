$(document).ready(function() {
	
	
	getAllUsers();
	
var jsonDataFromServer;
function getAllUsers(){
	 var jsonDataToServer=$("#admin_buss_id").val();//admin bussiness id
     var message = '';
     var tableId="userDetailsTable";
     jsonDataFromServer = sendData(message,jsonDataToServer, "populateUsers");
     if(jsonDataFromServer!=null && jsonDataFromServer!="")
     {
    	 jsonDataFromServer=jQuery.parseJSON(jsonDataFromServer);
    	 populateAllUsers(jsonDataFromServer,tableId);
     }	
}

$(document).on('click', '.btn-activate',  function(){
	  var delButton=$(this).attr('id');
  	var id=delButton.split('-')[1];
  //	alert(id);
  	var jsonDataToServer=id;
      var message = '';
      
      swal({
      title: 'Are you sure?',
      text: "Activate the User !",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, activate it!'
      }).then(function() {
      	jsonDataFromServer = sendData(message,jsonDataToServer, "activateUser");
          if(jsonDataFromServer!=null && jsonDataFromServer!=""){
          swal(
          'Activated!',
          'Your user has been activated.',
          'success'
          );
          }
          setTimeout(function(){// wait for 5 secs(2)
	           location.reload(); // then reload the page.(3)
	      }, 700);
      }).catch(swal.noop);
      $('#deactivedUserTable').DataTable().destroy();
      getAllDeactivatedUsers();
      
	});


$("#deactivateUser").click(function(){
//	alert();
	$('#deactivedUserTable').DataTable().destroy();
	getAllDeactivatedUsers();
});
function getAllDeactivatedUsers(){
	 var jsonDataToServer=$("#admin_buss_id").val();//admin bussiness id
    var message = '';
    var tableId="deactivedUserTable";
    jsonDataFromServer1 = sendData(message,jsonDataToServer, "deactivatedUsers");
    if(jsonDataFromServer1!=null && jsonDataFromServer1!="")
    {
   	 jsonDataFromServer1=jQuery.parseJSON(jsonDataFromServer1);
   	populateDeactiveUsers(jsonDataFromServer1,tableId);
    }	
}

//get Dealers
$("#dealers").click(function(){
	var tableId="dealersTable";
	var Role="DEALER";
	var data=jsonDataFromServer;
	$('#dealersTable').DataTable().destroy();
	populateDealersAndRetailer(data,tableId,Role);
	//$('#dealersTable').DataTable({});
	 
});
//get Retailers
$("#retailers").click(function(){
	var tableId="retailersTable";
	var Role="RETAILER";
	var data=jsonDataFromServer;
	$('#retailersTable').DataTable().destroy();
	populateDealersAndRetailer(data,tableId,Role);
	//$('#retailersTable').DataTable({});
	  
});


function populateDealersAndRetailer(jsonDataFromServer,TableId,Role){
	var tableId=TableId;
	var tr='';
	$('#'+tableId+' tbody').empty();
	var no = 1;
	$.each(jsonDataFromServer,function (index, element) {
		
		var accountLock;
		
		if(element.userrole==Role){
	if(element.accountNonLocked==0){
		accountLock="Yes";
	}
	else{
		accountLock="No";
	}
	tr = "<tr>";	
	tr += "<td>" + no + "</td>";
	tr += "<td>" + element.userID+ "</td>";
	tr += "<td>" + element.userpass+ "</td>";
	tr += "<td>" + element.userfname+ "</td>";
	tr += "<td>" + element.userlname+ "</td>";
	tr += "<td>" + element.useraddress+ "</td>";
	tr += "<td>" + element.userrole+ "</td>";
	tr += "<td>" + element.plant+ "</td>";
	tr += "<td>" + element.regio+ "</td>";
	tr += "<td>" + element.mobile_no+ "</td>";
	tr += "<td>" + element.sales_org+ "</td>";
	tr += "<td>" + accountLock+ "</td>";
  	tr += "</tr>";
	no=parseInt(no)+1;
	$('#'+tableId+' tbody').append(tr);
		}
	
	
	});
	
//	$('#'+tableId+'').DataTable({});
	
	 var table = $('#'+tableId+'').DataTable({
     	responsive: true,
         paging: true,
         dom: 'Bfrtip',
         buttons: [{
             extend: 'excel',
             text: 'Download Excel',
             className: 'excel-btn',
             filename: 'UserDetails',
             exportOptions: { modifier: { page: 'all'} }
         }
         ]
         
     });
	
}


function populateAllUsers(AjendaDocs,tableId){
	
	var tr='';
		$('#'+tableId+' tbody').empty();
             
    	$.each(AjendaDocs,function (index, element) {
    		var sr = 1+index;
    		var accountLock;
    		tr = "<tr>";	
    	if(element.accountNonLocked==0){
    		accountLock="Yes";
    	}
    	else{
    		accountLock="No";
    	}
    	
    	tr += "<td>" + sr + "</td>";
    	tr += "<td>" + element.userID+ "</td>";
    	tr += "<td>" + element.userpass+ "</td>";
    	tr += "<td>" + element.userfname+ "</td>";
    	tr += "<td>" + element.userlname+ "</td>";
    	tr += "<td>" + element.useraddress+ "</td>";
    	tr += "<td>" + element.userrole+ "</td>";
    	tr += "<td>" + element.plant+ "</td>";
    	tr += "<td>" + element.regio+ "</td>";
    	tr += "<td>" + element.mobile_no+ "</td>";
    	tr += "<td>" + element.sales_org+ "</td>";
    	tr += "<td>" + accountLock+ "</td>";
      	tr += "</tr>";
    	
    	$('#'+tableId+' tbody').append(tr);
    	});
    	 
    	var table = $('#'+tableId+'').DataTable({
        	responsive: true,
            scrollX: true,
            paging: true,
            dom: 'Bfrtip',
            buttons: [{
                extend: 'excel',
                text: 'Download Excel',
                className: 'excel-btn',
                filename: 'UserDetails',
                exportOptions: { modifier: { page: 'all'} }
            }
            ]
            
        });
    	
}   

function populateDeactiveUsers(AjendaDocs,tableId){
	
	var tr='';
		$('#deactivedUserTable tbody').empty();
             
    	$.each(AjendaDocs,function (index, element) {
    		var sr = 1+index;
    		var accountLock;
    		tr = "<tr>";	
    	if(element.accountNonLocked==0){
    		accountLock="Yes";
    	}
    	else{
    		accountLock="No";
    	}
    	
    	tr += "<td>" + sr + "</td>";
    	tr += "<td>" + element.userID+ "</td>";
    	tr += "<td>" + element.userpass+ "</td>";
    	tr += "<td>" + element.userfname+ "</td>";
    	tr += "<td>" + element.userlname+ "</td>";
    	tr += "<td>" + element.useraddress+ "</td>";
    	tr += "<td>" + element.userrole+ "</td>";
    	tr += "<td>" + element.plant+ "</td>";
    	tr += "<td>" + element.regio+ "</td>";
    	tr += "<td>" + element.mobile_no+ "</td>";
    	tr += "<td>" + element.sales_org+ "</td>";
    	tr += "<td>" + accountLock+ "</td>";
    	tr+=  '<td><button type="button" class="btn btn-primary btn-activate buttons-html5" id="actuser-'+element.loginID+'">Activate</button></td>';
      	tr += "</tr>";
    	
    	$('#deactivedUserTable tbody').append(tr);
    	});
    	 
    	var table = $('#deactivedUserTable').DataTable({
        	responsive: true,
            paging: true,
            dom: 'Bfrtip',
            buttons: [{
                extend: 'excel',
                text: 'Download Excel',
                className: 'excel-btn',
                filename: 'UserDetails',
                exportOptions: { modifier: { page: 'all'} }
            }
            ]
            
        });
    	
} 



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
});
