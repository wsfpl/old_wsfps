$(document).ready(function() {
	
	
	
	getAllOrders();
	
	
      
        
        
       // $('#updateCompanyButton').attr('disabled',true);
	var jsonDataFromServer;
function getAllOrders(){
	 var id=$("#admin_buss_id").val();//admin bussiness id
	// alert(id);
     var message = '';
     $.ajax({
         type : "GET",
         url : "getAllOrders",
         data :{JDATA:id},
         async:false,
         success : function(data)
         {
                $(".loader").hide();
              //  returnData = data;
                var tableId="orderTable";
                 jsonDataFromServer=data;
                if(jsonDataFromServer!=null && jsonDataFromServer!="")
                {
               	 jsonDataFromServer=jQuery.parseJSON(jsonDataFromServer);
               	 populateAllOrders(jsonDataFromServer,tableId);
                }	
               // $("#addUsersModel").modal('hide');
         },
         error : function(xhr, ajaxOptions, throwError)

         {
                //alert("Please Try Again");
         }
  });
     
}
$('#tofromsubmit').on('click', function(){
   /* var from=$("#start-date").val();
    var to =$("#end-date").val();
    if(from == ''|| to == ''){
    	alert();
    }*/
    //alert(from);alert(to);
	 var from=$("#from").val();//admin bussiness id
	    var to =$("#to").val();
	    var tableId="orderTable";
	  //  alert(to);
	    var jsonDataFromServer1 = sendData(from,to, "getAllOrdersToFrom");
	    if(jsonDataFromServer1!=null && jsonDataFromServer1!="")
	    {
	   	 jsonDataFromServer1=jQuery.parseJSON(jsonDataFromServer1);
	   	$('#orderTable').DataTable().destroy();
	   	 populateAllOrders(jsonDataFromServer1,tableId);
	    }	
 });

function getAllOrdersByStatus(STATUS,status,tableId){
	var id=$("#admin_buss_id").val();
	
	 var status = sendStatus(id,STATUS,status);
	    if(status!=null && status!="")
	    {
	   	 status=jQuery.parseJSON(status);
	  
	   	 populateAllOrders(status,tableId);
	    }
}

//get completed order
$("#completed").click(function(){
	var tableId="completedTable";
	var status="c";
	var STATUS="C21";
	$('#completedTable').DataTable().destroy();
	getAllOrdersByStatus(STATUS,status,tableId)
});
//get partially completed ordres
$("#partiallyCompleted").click(function(){
	var tableId="partiallyCompTable";
	var status="b";
	var STATUS="B21";
	$('#partiallyCompTable').DataTable().destroy();
	getAllOrdersByStatus(STATUS,status,tableId)
});
//pending
$("#pending").click(function(){
	var tableId="pendingTable";
	var status="";
	var STATUS="";
	$('#pendingTable').DataTable().destroy();
	getAllOrdersByStatus(STATUS,status,tableId)
});
//getrejected orders
$("#rejected").click(function(){
	var tableId="rejectedTable";
	var status="r";
	var STATUS="r";
	$('#rejectedTable').DataTable().destroy();
	getAllOrdersByStatus(STATUS,status,tableId)
});





function getAllOrdersToFrom(){
	 var from=$("#from").val();//admin bussiness id
    var to =$("#to").val();
    alert(to);
    var tableId="orderTable";
    jsonDataFromServer = sendData(from,to, "getAllOrdersToFrom");
    if(jsonDataFromServer!=null && jsonDataFromServer!="")
    {
   	 jsonDataFromServer=jQuery.parseJSON(jsonDataFromServer);
   	 populateAllOrders(jsonDataFromServer,tableId);
    }	
}

function populateAllOrders(AjendaDocs,tableId){
	
	var tr='';
		$('#'+tableId+' tbody').empty();
             
    	$.each(AjendaDocs,function (index, element) {
    		var STATUS = "";
    		var sr = 1+index;
    		if(element.flag=="" || element.status=="Pending") {
				STATUS ="Pending";
			}
			else if(element.flag=="C" || element.flag=="c" || element.flag=="C21") {
				 STATUS ="Complete";
			}
			else if(element.flag=="B" || element.flag=="b" || element.flag=="B21") {
				 STATUS ="Partially Complete";
			}
			else if(element.flag=="R" || element.flag=="r"){
				 STATUS ="Rejected";
			}
			
			if(element.bmFlag =="P"){
				 STATUS ="BM Pass";
			}else if(element.bmFlag =="F"){
				 STATUS ="BM Fail";
			}
			
    		tr = "<tr>";	
    	
    	
    	tr += "<td>" + sr + "</td>";
    	tr += "<td>" + element.userId+ "</td>";
    	tr += "<td>" + element.userName+ "</td>";
    	tr += "<td>" + element.headerId+ "</td>";
    	tr += "<td>" + element.netwr+ "</td>";
    	tr += "<td>" + element.date+ "</td>";
    	tr += "<td>" + STATUS+ "</td>";
      	tr += "</tr>";
    	
    	$('#'+tableId+' tbody').append(tr);
    	});
    	var table = $('#'+tableId).DataTable({
            responsive: true,
            paging: true,
            dom: 'Bfrtip',
            buttons: [{
                extend: 'excel',
                text: 'Download Excel',
                className: 'excel-btn',
                filename: 'OrdersDetails',
                exportOptions: { modifier: { page: 'all'} }
            }
            ]
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

$("#to").change(function(){
	var endDate = $("#to").val();
	var startDate = $("#from").val();
	
    	var ed = endDate.split("-");
    	var sd= startDate.split("-");
    	
    	var end = new Date(ed[2], parseInt(ed[1])-1, ed[0]);
    	var start = new Date(sd[2], parseInt(sd[1])-1, sd[0]);
    	
	if(end < start){
		swal('TO Date Should not be less than FROM Date','','warning')
	/*alert("Please Enter Correct End Date");*/
	$(this).val("");
	}
	/*if(endDate == startDate){
		swal('End Date and Start Date Should not be same','','warning');
		alert("End Date and Start Date Should not be same");
		$(this).val("");
	}*/
})


function sendStatus(data,STATUS,status)

{
       var returnData = null;
       $(".loader").show();
       $.ajax({
              type : "GET",
              url : "getAllOrdersByStaus",
              async:false,
              data :
              {
            	  STATUS : STATUS,
            	  status:status,
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