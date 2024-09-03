function approveReject(flag){
	
//	console.log("flag=====>>>"+flag);	
	if(retailerCheck.length ==0){
//		alert("Please select Items!!!");
		$("#alert_title").html("ALERT");
		$("#alert_text").html("Please Select Items !!!");
		
		$("#rejected_order").modal("show");
	}
	else{
		
	
			if(flag == "C"){
				
				approveRecord(flag);//
				
				
			}
			else{
				
			
				if($("#rejected_comments").val() != ""){
					$.ajax({
						type:"POST",
		//			    url :"http://localhost:8080/Dairy/approveRejectOrders",
					    url :"approveRejectOrders",
//					    url :"rejectOrders",
					    data:{
							retailers		:	retailerCheck,
							flag			:	flag,
							comments		:	document.getElementById("rejected_comments").value,
					    	 random 		:	Math.random(),
					    	 _csrf 			: 	document.getElementById("csrf_token").value
					    },
					    success:function(data,req,res){
					   
					    	console.log("DATA========"+data);
					    	if(data){
					    		
					    		var orderNo = "";
					    		for(var i=0; i< retailerCheck.length; i++){
						    		$("#retailer_"+retailerCheck[i]).hide();
						    		orderNo = orderNo + retailerCheck[i]+",";
						    	}
					    		
					    		orderNo = orderNo.replace(/,\s*$/, "");
					    		retailerCheck = [];
					    		
					    		if(flag == "C"){
//					    			alert("Items Approved Successfully");
					    		}
					    		else{
//					    			alert("Items Rejected Successfully");
//					    			$("#rejected_order").modal("show");
					    			
					    			showAlert('Rejected Order', 'Order No. '+orderNo+' Rejected Successfully!!!', 'negative');	
					    			
					    			
					    		}
					    		
					    		
					    	}
					    	else{
					    		alert("Something went wrong");	
					    	}
					    	
					    	
					    	
					    },
					    error:function(oError){
					    	alert("Something went wrong");
					    }
					   });
					
				}
				else{
					document.getElementById("comments_label").style.display = "block";
//					document.getElementById("myDIV").style.display = "none";
				}
					
			}//end of else
	
	}
}

	function approveRecord(flag){
		
		
		 $("#approve_view_modal_table tbody").empty();
		 
		$.ajax({
			type:"POST",
		    url :"getApproveOrders",
		    data:{
				retailers		:	retailerCheck,
				flag			:	flag,
		    	 random 		:	Math.random(),
		    	 _csrf 			: 	document.getElementById("csrf_token").value
		    },
		    success:function(data,req,res){
		   
		    	$("#approvedViewModal").modal("show");
		    	console.log("JSON Stringify===>>>"+JSON.stringify(data));
		    	
		    	for(var i = 0 ; i < data.length; i++){
		    		
		    	
		    		var view_modal_table = 
					  "<tr>"
						  +"<td>"+data[i].maktx+"</td>"
						  +"<input type='hidden' name='items["+i+"].MAKTX' value='"+data[i].maktx+"'/>"
						  +"<input type='hidden' name='items["+i+"].MATNR' value='"+data[i].matnr+"'/>"
						  +"<input type='hidden' name='items["+i+"].NETPR' value='"+data[i].netpr+"'/>"
						  +"<input type='hidden' name='items["+i+"].NETWR_ITEM' value='"+data[i].netwr_ITEM+"'/>"
						  +"<input type='hidden' name='items["+i+"].SPART' value='"+data[i].spart+"'/>"
						  +"<input type='hidden' name='items["+i+"].ZIEME' value='"+data[i].zieme+"'/>"
//						  +"<input type='hidden' name='items["+i+"].Header_ID' value='"+0+"'/>"
						  +"<input type='hidden' name='items["+i+"].Header_ID' value='"+data[i].header_ID+"'/>"
						  +"<input type='hidden' name='items["+i+"].ZMENG' value='"+data[i].zmeng+"'/>"
//						  +"<td><input type='Number' name='items["+i+"].ZMENG' class='new_Value form-control' value='"+data[i].zmeng+"'/></td>"
						  +"<td>"+data[i].productType+"</td>"
						  +"<td>"+data[i].zmeng+"</td>"
						  +"<td><input type='text' class='new_Value form-control' disabled='disabled' value='"+formatDate()+"'/></td>"
						  +"<td>"+data[i].netwr_ITEM+"</td>"
						  +"<td>"+data[i].netpr+"</td>"
//						  +"<td><button type='button' class='btn-del' onclick='deleteViewOrder(this)' "
//						  		+"id = 'delete_"+count+"' data-uuid = '"+value.uuid+"'>"
//								+"<span class='glyphicon glyphicon-remove'></span></button></td>"
					  +"</tr>";

				  
				  
				  // appending table body data to view records
				  $("#approve_view_modal_table tbody").append(view_modal_table);
				
		    	}
				 
		    	
		    },
		    error:function(oError){
		    	showAlert('ERROR', 'Something went wrong !!!', 'negative');
		    }
		   });
		
		
	}
	
	
	function submitApprovedRecords(){
		
		/*{
			retailers		:	retailerCheck,
	    	 random 		:	Math.random(),
	    	 _csrf 			: 	document.getElementById("csrf_token").value,
	    	 itemtableDto	: 	$("#createApprovedOrders").serialize()
	    }*/
		
//		console.log("====>>>>."+$("#createApprovedOrders").serialize());
		
		$.ajax({
			type:"POST",
//		    url :"createApprovedOrders",
		    url :"approveOrders",
		    data: $("#createApprovedOrders").serialize(),
		    success:function(data,req,res){
		   
		    	console.log("DATA=====>>>"+data);
		    	var referenceNo = "";
				 if(data != '0'){
					 $("#positiveAlert").modal("show");
					 $("#approvedViewModal").modal("hide");
//					 showAlert('Approved Order', 'Order No '+data+ ' Approved Successfully !!!', 'positive');
					 showAlert('Approved Order', 'Order Approved Successfully !!!', 'positive');
//					 window.location.href = "inner";
					 
//					console.log("retailerCheck===>>>"+ retailerCheck);
					
					referenceNo = data;
					
//					console.log("data==XXX headerID===>>>"+ data+"===="+referenceNo);
								$.ajax({
									type:"POST",
								    url :"approveRejectOrders",
								    data:{
										retailers		:	retailerCheck,
										flag			:	'C',
//										comments		:	document.getElementById("approve_reject_comments").value,
//										comments		:	document.getElementById("approve_reject_comments").value,
//										referenceNo		:	referenceNo,
								    	 random 		:	Math.random(),
								    	 _csrf 			: 	document.getElementById("csrf_token").value
								    },
								    success:function(data,req,res){
								   
//								    	console.log("DATA========"+data);
								    	if(data){
								    		
								    		for(var i=0; i< retailerCheck.length; i++){
									    		$("#retailer_"+retailerCheck[i]).hide();
									    	}
								    		retailerCheck = [];
								    		
								    	}
								    	else{
								    		showAlert('Approval', 'Something went wrong !!!', 'negative');
								    	}
								    	
								    },
								    error:function(oError){
								    	showAlert('Approval', 'Something went wrong !!!', 'negative');
								    }
								   });
								
								 
				 }
				 else{
					 showAlert('ALERT', 'Something went wrong !!!', 'negative');
				 }
		    	
		    },
		    error:function(oError){
//		    	alert("Something wentC wrong");
		    	showAlert('ALERT', 'Something went wrong !!!', 'negative');
		    }
		   });
		
		
	}