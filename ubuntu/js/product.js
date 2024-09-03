$(document).ready(function() {
	
	getAllProducts();
$("#prod860").submit(function(e){
	
	var ToDt=$("#toDate").val();
	var FromDt=$("#fromDate").val();
	var Indicator=$("#indicator").val();
	//alert(Indicator);
	
	$.ajax({
			type : "GET",  	   				
			url : "getUpdatedProducts",
			async: false,
			data : { FromDt: FromDt, ToDt : ToDt, Indicator:Indicator} ,
			success : function(data)
			{
				//alert("Hi");
				//$("#res").append(data);
			},
			error : function(xhr, ajaxOptions, throwError)
			{
				alert("Please Try Again");
			}    	   				
		});
	
});
var jsonDataFromServer;
function getAllProducts(){
	 var jsonDataToServer=$("#admin_buss_id").val();//admin bussiness id
	//var jsonDataToServer ="2";
    var message = $("#admin_sales_org").val();
    jsonDataFromServer = sendData(message,jsonDataToServer, "getProductReport");
    var prodLen=(jsonDataFromServer).length;
   // alert(prodLen);
    if(jsonDataFromServer!=null && jsonDataFromServer!="")
    {
   	 jsonDataFromServer=jQuery.parseJSON(jsonDataFromServer);
   	 populateAllProducts(jsonDataFromServer);
    }	
    if(message == "MCPL"){
    	populateAllCropCareProducts(jsonDataFromServer);
    }
}
$(".prodDairy").click(function(){
	var trid = $(this).parents('table').attr('id');
	//alert(trid);
	//getAllProducts();
	var spart=$(this).attr('id');
	//alert(spart);
	  var tableId="dairyTable";
	  $('#dairyTable').DataTable().destroy();
	populateSeeds(jsonDataFromServer,spart,tableId);
});

$(".prodDairyProduct").click(function(){
	
	//getAllProducts();
	var spart=$(this).attr('id');
	var tableId="dairyProductTable";
	$('#dairyProductTable').DataTable().destroy();
	//alert(spart);
	populateSeeds(jsonDataFromServer,spart,tableId);
});

$(".prodCrop").click(function(){
	
	//getAllProducts();
	var spart=$(this).attr('id');
	//alert(spart);
	  var tableId="cropTable";
	  $('#cropTable').DataTable().destroy();
	  populateSeeds(jsonDataFromServer,spart,tableId);
});

$(".prodSeed").click(function(){
	
	//getAllProducts();
	var spart=$(this).attr('id');
	var tableId="dairyTable";
	$('#dairyTable').DataTable().destroy();
	populateSeeds(jsonDataFromServer,spart,tableId);
});

function populateSeeds(jsonDataFromServer,spart,tableId){
	
	var tr='';
		$('#'+tableId+' tbody').empty();
		var no = 1;
		console.log(jsonDataFromServer);
		
    	$.each(jsonDataFromServer,function (index, element) {
    		
    		
    		if(element.Spart==spart){
    			/*var sr = 1*/;
    			
    		tr = "<tr>";	
    	
    	
    		tr += "<td>" + no + "</td>";
      
        	tr += "<td>" + element.Maktx+ "</td>";
        	tr += "<td>" + element.Matnr+ "</td>";
        	tr += "<td>" + element.Vtext+ "</td>";
        
        	tr += "<td>" + element.Kbetr+ "</td>";
   
        	tr += "</tr>";
        	no=parseInt(no)+1;
    		$('#'+tableId+' tbody').append(tr);
    	}
    	
    	});
    	 var table = $('#'+tableId+'').DataTable({
             responsive: true,
             paging: true,
             dom: 'Bfrtip',
             buttons: [{
                 extend: 'excel',
                 text: 'Download Excel',
                 className: 'excel-btn',
                 filename: 'ProductDetails',
                 exportOptions: { modifier: { page: 'all'} }
             }
             ]
         });
       	
} 

function populateAllProducts(Products){
	
	var tr='';
		$('#dairyTable tbody').empty();
		var no = 1;
		var spart=$("#ProdType li.active").attr('id');
		//alert(spart);
		/*
		if(spart==''){
			spart=$(".prodCrop").click().attr('id');
			alert(spart);
		}*/
    	$.each(Products,function (index, element) {
    		
    		
    		if(element.Spart==spart){
    			/*var sr = 1*/;
    			
    		tr = "<tr>";	
    	
    	
    	tr += "<td>" + no + "</td>";
    	
    	tr += "<td>" + element.Maktx+ "</td>";
    	tr += "<td>" + element.Matnr+ "</td>";
    	tr += "<td>" + element.Vtext+ "</td>";
    	
    	tr += "<td>" + element.Kbetr+ "</td>";
     	tr += "</tr>";
     	no=parseInt(no)+1;
    	$('#dairyTable tbody').append(tr);
    	}
    		
    	
    	});
        
    	 var table = $('#dairyTable').DataTable({
             responsive: true,
             paging: true,
             dom: 'Bfrtip',
             buttons: [{
                 extend: 'excel',
                 text: 'Download Excel',
                 className: 'excel-btn',
                 filename: 'ProductDetails',
                 exportOptions: { modifier: { page: 'all'} }
             }
             ]
         });
    	/*setTimeout(function(){
    		var table = $('.data-userTable').DataTable({
    		    responsive: true,
    		    paging: true,
    		});	
    	},5000);*/
    	
}   

function populateAllCropCareProducts(Products){
	
	var tr='';
		$('#cropCareTable tbody').empty();
		var no = 1;
		
		
    	$.each(Products,function (index, element) {
    		
    		tr = "<tr>";	
    	
    	tr += "<td>" + no + "</td>";
    	tr += "<td>" + element.Knumh+ "</td>";
    	tr += "<td>" + element.Maktx+ "</td>";
    	tr += "<td>" + element.Matnr+ "</td>";
    	tr += "<td>" + element.Vtext+ "</td>";
    	tr += "<td>" + element.Spart+ "</td>";
    	tr += "<td>" + element.Kbetr+ "</td>";
     	tr += "</tr>";
     	no=parseInt(no)+1;
    	$('#cropCareTable tbody').append(tr);
    	
    	});
        
    	 var table = $('#cropCareTable').DataTable({
             responsive: true,
             paging: true,
             dom: 'Bfrtip',
             buttons: [{
                 extend: 'excel',
                 text: 'Download Excel',
                 className: 'excel-btn',
                 filename: 'ProductDetails',
                 exportOptions: { modifier: { page: 'all'} }
             }
             ]
         });
    	/*setTimeout(function(){
    		var table = $('.data-userTable').DataTable({
    		    responsive: true,
    		    paging: true,
    		});	
    	},5000);*/
    	
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