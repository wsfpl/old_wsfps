function editOrder(headerId,isSync,SPART){
//	alert("inside editOrder==="+headerId);
	
//	console.log(headerId+"=======XXXXXXXXXXXXXX========="+isSync+"======"+SPART);
	$("#RET_SPART").val(SPART);
	$("#RET_HEADERID").val(headerId);
	
	
	$.ajax({
		type:"GET",
	    url :"getEditOrders",
	    data:{
			headerId	:	headerId,
	    	 random 	:	Math.random(),
	    	 _csrf 		: 	document.getElementById("csrf_token").value
	    },
	    success:function(data,req,res){
	
	    	$('#editOrder').modal('show');
	    	$("#edit_order_table tbody").empty();
	    	var editOrderData = "";
	    	var dataVal = JSON.stringify(data);
	    	var disabled = "";
	    	
	    	if(isSync == 'Y'){
	    		disabled = "disabled";
	    	}
	    	
// 	    	console.log("DATA============>>>"+JSON.stringify(data)+"======="+data.length);	
	    	if(data.length != 0){
	    		for(var i = 0; i < data.length; i++ ){
		    		
//		    		console.log("DATA i=========>>>>"+JSON.stringify(data[i])+"====="+data[i]);
		    		
		    		var dataN = JSON.stringify(data[i]);
		    		
		    		
		    		/*editOrderData = editOrderData + 
		    		'<tr>' +
		    		'<td>'+data[i].maktx+'</td>'+
		    		'<td><input type="Number" name="items['+i+'].ZMENG" id="quantity1" class="new_Value form-control" value="'+data[i].zmeng+'"></td>'+
		    		'<td><input disabled="true" name="items['+i+'].EDATU" type="text" id="dueDate1" class="form-control datepicker dateReq hasDatepicker" value="'+data[i].edatu+'"></td>'+
		    		'<td data-title="Action"><button type="button" class="btn-del" onclick="deleteOrders('+dataN+')"><span class="glyphicon glyphicon-remove"></span></button></td>' +
		    		'<input type="hidden" name="items['+i+'].NETPR" value="'+data[i].netpr+'">'+
		    		'<input type="hidden" name="items['+i+'].ItemNumber" value="'+data[i].itemNumber+'">'+
		    		'<input type="hidden" name="items['+i+'].itemID" value="'+data[i].itemID+'">'+
		    		'<input type="hidden" name="items['+i+'].Header_ID" value="'+data[i].header_ID+'">'+
//		    		''+
		    		'</tr>';*/
		    		var k = i+1;
		    		var row = "row_"+k;
		    		editOrderData = editOrderData + 
		    		"<tr id='"+row+"'>" +
		    		"<td>"+data[i].maktx+"</td>"+
		    		"<td><input type='text' name='items["+i+"].ZMENG' id='quantity_"+k+"' class='new_Value form-control' value='"+data[i].zmeng+"' " +
		    				" onkeyup='showHideSave(this);checkIFPositiveNumber(this.value);checkLength(this)' onfocusout ='checkIFPositiveNumber(this.value);'" +
		    				" maxlength='6' " +
		    				" onkeypress='return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57' " +
		    				" onfocus ='checkIFPositiveNumber(this.value);' data-save-id = 'save_changes' "+disabled+"></td>"+
		    		"<td><input disabled='true' name='items["+i+"].EDATU' type='text' id='dueDate1' class='form-control datepicker dateReq hasDatepicker' value='"+data[i].edatu+"'></td>"+
		    		"<td data-title='Action'><button type='button' class='btn btn-primary' onclick='deleteOrders("+dataN+","+data.length+",this)' id='"+row+"'  "+disabled+" ><span class='glyphicon glyphicon-remove'></span></button></td>" +
		    		"<input type='hidden' name='items["+i+"].NETPR' value='"+data[i].netpr+"'>"+
		    		"<input type='hidden' name='items["+i+"].ItemNumber' value='"+data[i].itemNumber+"'>"+
		    		"<input type='hidden' name='items["+i+"].itemID' value='"+data[i].itemID+"'>"+
		    		"<input type='hidden' name='items["+i+"].Header_ID' value='"+data[i].header_ID+"'>"+
		    		"</tr>";
		    			
		    	}
	    	}
	    	else{
	    		editOrderData = "<tr><td colspan='4'>No Records Found</td></tr>";
	    	}
	    	    	    	
	    	
	    	
	    	$("#edit_order_table tbody").append(editOrderData);
	   	 
	    },
	    error:function(oError){
	    	showAlert('Edit Order', 'Something went wrong !!!', 'negative');
	    }
	   });
	
	
}


	function deleteOrders(data,dataLength,fieldObj){
		
//		console.log("Object==========="+JSON.stringify(data));
//		console.log("Zaheer Chowhan==="+data.itemNumber);
//		$('#editOrder').modal('hide');
		
		console.log("dataLength====>>>"+dataLength);		
		
		
		var rowCount = $('#edit_order_table tbody tr').filter(function() {
			  return $(this).css('display') !== 'none';
			}).length;
//		alert("rowCount====>>>"+rowCount);
		
		if (window.confirm("Do you really want to delete this item?")) { 
//			  window.open("exit.html", "Thanks for Visiting!");
//			alert("inside yes");
			var id = fieldObj.id;
//			console.log("Id===="+id+"==="+data+"=========>>>");
			
			var DATAN = JSON.stringify(data);
			
//			console.log("JSON DATA===="+DATAN);
			$('#'+id).hide();
//			$("#").hide();
			$.ajax({
				type:"POST",
			    url :"deleteOrders",
			    data:{
			    	itemDto		:	JSON.stringify(data),
			    	itemNumber	:	data.itemNumber,
			    	itemID		:	data.itemID,
			    	header_ID	:	data.header_ID,
			    	MATNR		:	data.matnr,
			    	 random 	:	Math.random(),
			    	 _csrf 		: 	document.getElementById("csrf_token").value
			    },
//			    data : JSON.stringify(data),
			    success:function(data,req,res){
			   
			    	
			    	if(data){
//			    		alert("Order Successfully Deleted !!!");	
			    		showAlert('ALERT', 'Order Successfully Deleted !!!', 'positive');
			    		
			    	}
			    	else{
			    		showAlert('ALERT', 'Something went wrong !!!', 'negative');
			    	}
			   
			    	
			    },
			    error:function(oError){
			    	showAlert('ALERT', 'Something went wrong !!!', 'negative');
			    }
			   });
			
			
			if(rowCount == 1){
				setTimeout(function(){ 
					
					window.location.reload();
						
				}, 1000);
			}
				
		}
		/*else{
			alert("inside No");
		}*/

	}
	
	function showHideSave(Object){
		
		var saveId = $(Object).attr('data-save-id');
//		console.log("DATA SAVE ID==="+saveId);
		
//		console.log("===========>>>"+($('#save_changes').css('display') == 'none'));
		
		if($('#'+saveId).css('display') == 'none')
		{
//			$('#save_changes').css('display') == 'block';
			document.getElementById(saveId).style.display = "inline";
		}
	}