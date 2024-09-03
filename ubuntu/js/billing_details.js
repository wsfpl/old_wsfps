$(document).ready(function() {
	
	
	getAllbillingDetails();
	
	var jsonDataFromServer;
	
	

function getAllbillingDetails(){
	 var jsonDataToServer=$("#admin_buss_id").val();//admin bussiness id
     var message = '';
     var tableId="allBillingDetailsTable";
     jsonDataFromServer = sendData(message,jsonDataToServer, "getAllBillingDetailsTotal");
     if(jsonDataFromServer!=null && jsonDataFromServer!="")
     {
    	 jsonDataFromServer=jQuery.parseJSON(jsonDataFromServer);
    	 populateAllBillingDetails(jsonDataFromServer,tableId);
     }	
}

//$(".viewBill").click(function(){
	$(document).on('click', '.viewBill', function(){
	var THIS_btn = $(this);
	var updateButton=$(this).attr('id');
	var data =$(this).parents("tr").children();
	var  rowId = data[0].innerHTML;
	//alert(rowId);
	
	var headerId=updateButton.split('-')[1];
	//alert(headerId);
	var message=headerId;
	var jsonDataToServer=$("#admin_buss_id").val();
	 jsonDataFromServer = sendData(message,jsonDataToServer, "getAllBillingDetails");
	  
	     if(jsonDataFromServer!=null && jsonDataFromServer!="")
	     {
	    	 jsonDataFromServer=jQuery.parseJSON(jsonDataFromServer);
	    	 var no=1;
	    	 $.each(jsonDataFromServer,function (index, element) {
	    		
	    		 var sr = rowId+"."+no;
	    		 
	    var html=$("<tr class='bg_row_color' id='"+element.headerId+"'><td>" + sr + "</td><td>" + element.userId+ "</td><td>" + element.MATKX+ "</td><td>" + element.order_qty+ "</td><td>" + element.NETWR_ITEM+ "</td><td>" + element.status+ "</td></tr>");
	  //  $("#allBillingDetailsTable tbody").append(html);
      	html.insertAfter(THIS_btn.closest('tr'));
	      no=parseInt(no)+1;
	    	 }); 	 
		     THIS_btn.parents("td").addClass("hide_bill");
		     
	     }	
});

	$(document).on('click', '.hideBill', function(){
		var THIS_btn = $(this);
		var trid=$(this).attr('id');
		var trid1 = trid.split('-')[1];
		$("tr[id="+trid1+"]").remove();
		THIS_btn.parents("td").removeClass("hide_bill");		
	});
	
function populateAllBillingDetails(AjendaDocs,tableId){
	
	var tr='';
		$('#'+tableId+' tbody').empty();
             
    	$.each(AjendaDocs,function (index, element) {
    		
    		 var sr = 1+index;
        
    	tr = "<tr>";	
    	tr += "<td>" + sr + "</td>";
    	tr += "<td>" + element.headerId+ "</td>";
    	tr += "<td>" + element.userName+ "</td>";
    	tr += "<td>" + element.total+ "</td>";
    	tr += "<td>" + element.NETWR+ "</td>";
    	tr += '<td><button class="btn btn-default btn-sm viewBill" id="billing-'+element.headerId+'">View Detail</button> <button class="btn btn-default btn-sm hideBill" id="billing-'+element.headerId+'">Hide Detail</button></td>';
      	tr += "</tr>";
    	
    	$('#'+tableId+' tbody').append(tr);
    	});
    	 
    	var table = $('#'+tableId+'').DataTable({
        	responsive: true,
            scrollX: false,
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
