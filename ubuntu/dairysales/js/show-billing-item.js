    function showBillingItem(vbeln){
//     	alert("vbeln=====>>>>"+vbeln);
    	
    	
    	
    	
    	 $.ajax({
    		 type:"GET",
    	    url :"getBillingItemDetails",
    	    data:{
    	    	 vbeln		:	vbeln,
    	    	 random 	:	Math.random(),
    	    },
    	    success:function(data,req,res){
    	   
    	    	$("#billing_table tbody").empty();
    	    	
//    	    	console.log("DATA============>>>"+JSON.stringify(data)+"======="+data.length+"===vbeln==="+data[0].vbeln);
    	    	var coTableData = "";
    	    	var dataVal = JSON.stringify(data);    	  
    	    	
    	    	// TO display below details on popup
    	    	document.getElementById("billing_order_id").innerHTML = " - "+data[0].vbeln;

    	    	document.getElementById("bill_ref_no").innerHTML 
    	    							= document.getElementById("bill_hdn_ref_no_"+vbeln).value;
    	    	
    	    	document.getElementById("bill_no_of_items").innerHTML 
    	    							= document.getElementById("bill_hdn_no_of_items_"+vbeln).value;
    	    	
    	    	document.getElementById("bill_prod_type").innerHTML 
    	    							= document.getElementById("bill_hdn_prod_type_"+vbeln).value;
    	    	
    	    	
    	    	if(data.length < 0){
    	    		
    	    	}
    	    	else{
    	    		
		    	    	for(var i = 0; i < data.length; i++ ){
		    	    		
		    	    		coTableData = coTableData + 
			   	    		"<tr><td>"+data[i].maktx+"</td><td>"+data[i].fkimg+"</td> "+
			   	    		"<td>"+data[i].vrkme+"</td><td>"+data[i].netwr+"</td> "+
//			   	    		"<td>"+data[i].vrkme+"</td><td>"+data[i].netpr+"</td><td>"+data[i].netwr+"</td> "+
			    	    		"</tr>";
		    	    			
		    	    	}
    	    	}
    	    	
    	    	$("#billing_table tbody").append(coTableData);
    	   	 
    	    },
    	    error:function(oError){
    	    	showAlert('Error', 'Something went wrong !!!', 'negative');
    	    }
    	   }); 
    	  
    }