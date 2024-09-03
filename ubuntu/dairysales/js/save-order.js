function saveOrder(userRole){
	//console.log("<<<----ZAHEER CHOWHAN---->>>"+userRole);
	$("#view_save").prop( "disabled", true );
	if(userRole == "RETAILER"){
		
		
		$.ajax({
	  		 type:"POST",
//	   		 dataType : "json",
//	   	    url :"http://localhost:8080/Dairy/getProducts",
	  	    url :"createRetailerOrder",
	  	    data:$("#createOrders").serialize(),
	  	    success:function(data,req,res){
	    	    console.log("data==========>>>>"+data);
	    	    console.log("validNavigation======>>>"+validNavigation);
	    	    
	    	    
	    	    $("#view_modal_table tbody").empty();
	    	    if(data != '0'){
	    	    	showAlert('Create Order', 'Order No. '+data+ ' Created Successfully !!!', 'positive');
	    	    	
//	    	    	setTimeout(function(){ window.location.href = '/inner?tid=1' }, 2000);
	    	    	
	    	    }
	    	    else{
	    	    	showAlert('Error', 'Something went wrong!!!', 'negative');	
	    	    }
	    	    
	    	   
	    	    validNavigation = true;
	    	    setTimeout(function(){ window.location.href = 'inner?tid=1' }, 1200);
	    	    
	    	    
	    	    
	    	    
	  	   	 
	  	    },
	  	    error:function(oError){
	  	    	showAlert('Error', 'Something went wrong!!!', 'negative');	
	  	    }
	  	   });
		
	}
	else{
		
		console.log("userRole=========>>>"+userRole);
		$.ajax({
	  		 type:"POST",
//	   		 dataType : "json",
//	   	    url :"http://localhost:8080/Dairy/getProducts",
	  	    url :"createOrders",
	  	    data:$("#createOrders").serialize(),
	  	    success:function(data,req,res){
	    	    console.log("data==========>>>>"+data);
	    	    $("#view_modal_table tbody").empty();
	    	    if(data != '0'){
	    	    	showAlert('Create Order', 'Order No. '+data+ ' Created Successfully !!!', 'positive');
	    	    	
//	    	    	setTimeout(function(){ window.location.href = '/inner?tid=1' }, 2000);
	    	    	
	    	    }
	    	    else{
	    	    	showAlert('Error', 'Something went wrong!!!', 'negative');	
	    	    }
	    	    
//	    	    alert("validNavigation======>>>"+validNavigation);
	    	    validNavigation = true;
	    	    
	    	    setTimeout(function(){ window.location.href = 'inner?tid=1' }, 1200);
	    	    
	    	    
	    	    
	    	    
	  	   	 
	  	    },
	  	    error:function(oError){
	  	    	showAlert('Error', 'Something went wrong!!!', 'negative');	
	  	    }
	  	   });
		
	}
/*	$.ajax({
  		 type:"POST",
//   		 dataType : "json",
//   	    url :"http://localhost:8080/Dairy/getProducts",
  	    url :"createOrders",
  	    data:$("#createOrders").serialize(),
  	    success:function(data,req,res){
  	   
    	    console.log("data==========>>>>"+data);
    	    $("#view_modal_table tbody").empty();
    	    if(data != '0'){
    	    	showAlert('Create Order', 'Order No. '+data+ ' Created Successfully !!!', 'positive');
    	    	
//    	    	setTimeout(function(){ window.location.href = '/inner?tid=1' }, 2000);
    	    	
    	    }
    	    else{
    	    	showAlert('Error', 'Something went wrong!!!', 'negative');	
    	    }
    	    
    	    setTimeout(function(){ window.location.href = 'inner?tid=1' }, 1200);
    	    
    	    
    	    
    	    
  	   	 
  	    },
  	    error:function(oError){
  	    	showAlert('Error', 'Something went wrong!!!', 'negative');	
  	    }
  	   }); */
}