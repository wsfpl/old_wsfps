
$(document).ready(function(){
	$(document).on("change",".new_Value",function() {
		 $this = $(this);
		 var val = $this.closest('tr').children('td:eq(3)').text();
		 var itemRate = $this.closest('tr').children('td:eq(4)').text();
		 var orderQty = $(this).val();
		 if(orderQty<=0){
			 var qty = parseFloat(val)/ parseFloat(itemRate);
			 $(this).val(qty);
			// $this.closest('tr').children('td:eq(1)').text(qty.toFixed(2));
			 return ;
		 }
		 
		/* if(orderQty <=0){
			 alert("Please Enter Quantity more than Zero");
			 return;
		 }*/
		 $this.closest('tr').children('td:eq(3)').text(parseFloat(orderQty) * parseFloat(itemRate));
		 /*var data = $('#view_modal_table').rows().data();
		 data.each(function (value, index) {
		     console.log(`For index ${index}, data value is ${value}`);
		 });*/
		/* var totalValue1 = 0;
		 if(itemsAdded.length > 0){
				
				// Iterating Table body items
				$.each(itemsAdded, function (index, value) {
					totalValue1 =  Number(value.value);
					alert(totalValue1);
				});
		 }*/
		 var totalValue1 = 0;
		 $("#view_modal_table tr").each(function () {
             var self = $(this);
             var col_1_value = self.find("td:eq(0)").text().trim();
             var col_2_value = self.find("td:eq(1)").text().trim();
             var col_3_value = self.find("td:eq(2)").text().trim();
             var col_4_value = self.find("td:eq(3)").text().trim();
             var result = col_1_value + " - " + col_2_value + " - " + col_3_value + " - " + col_4_value;
             totalValue1 = totalValue1+ Number(col_4_value);
           //  console.log(totalValue1);
         });
		// console.log(totalValue1);
		 document.getElementById("total_value").innerHTML = totalValue1.toFixed(2);
	})
});
function viewAddedOrders(){
	
	
//	$("#viewModal").modal("show");

	$("#view_modal_table tbody").empty();
	var totalValue = 0;
	
	if(itemsAdded.length > 0){
			
		// Iterating Table body items
		$.each(itemsAdded, function (index, value) {
			  
//			console.log(index+"========"+value.value+"==="+itemsAdded.length);
			
			 totalValue = Number(totalValue) + Number(value.value);
			 if($('#userRole').text().trim() != 'retailer')
				 document.getElementById("total_value").innerHTML = totalValue.toFixed(2);
			
			var count = index + 1;
			var view_modal_table;
//			console.log("value.header_id=========>>>>>"+value.header_id);
			if($('#userRole').text().trim() != 'retailer') {
				view_modal_table = 
					  "<tr>"
						  +"<td>"+value.product_cat_text+"</td>"
						  +"<input type='hidden' name='items["+index+"].MAKTX' value='"+value.product_cat_text+"'/>"
						  +"<input type='hidden' name='items["+index+"].MATNR' value='"+value.product_cat_id+"'/>"
						  +"<input type='hidden' name='items["+index+"].NETPR' id='edit-rate'  value='"+value.rate+"'/>"
						  +"<input type='hidden' name='items["+index+"].NETWR_ITEM' class='edit-value' value='"+value.value+"'/>"
						  +"<input type='hidden' name='items["+index+"].SPART' value='"+value.product_type_id+"'/>"
						  +"<input type='hidden' name='items["+index+"].ZIEME' value='"+value.unit+"'/>"
						  +"<input type='hidden' name='items["+index+"].Header_ID' value='"+value.header_id+"'/>"
						  +"<input type='hidden' name='items["+index+"].NETWR' value='"+document.getElementById("total_value").innerHTML+"'/>"
//						  +"<td><input type='text' name='items["+index+"].ZMENG' class='new_Value form-control' value='"+value.quantity+"'/></td>"
						  +"<td><input type='text' maxlength='6' id='quantity' name='items["+index+"].ZMENG' class='new_Value form-control' value='"+value.quantity+"'" 
						  +"onkeypress='return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57'" 
						  +"	onfocusout ='checkIFPositiveNumber(this.value);'" 
						  +"onfocus ='checkIFPositiveNumber(this.value); ' onkeyup='changeTotal(this.value);'/></td>"
//						  +"<td><input type='Number' name='items["+index+"].ZMENG' class='new_Value form-control' value='"+value.quantity+"'/></td>"
//						  +"<td><input type='text' class='new_Value form-control' disabled='disabled' value='"+value.quantity+"'/></td>"
						  +"<td><input type='text' class='new_Value form-control' disabled='disabled' value='"+formatDate()+"'/></td>"
						  +"<td>"+value.value+"</td>"
						  /*+"<td><input type='text' class='edit-value form-control' disabled='disabled' value='"+value.value+"'/></td>"*/
						  +"<td>"+value.rate+"</td>"
						  +"<td><button type='button' class='btn-del' onclick='deleteViewOrder(this)' "
						  		+"id = 'delete_"+count+"' data-uuid = '"+value.uuid+"'>"
								+"<span class='glyphicon glyphicon-remove'></span></button></td>"
					  +"</tr>";
			}else {
				view_modal_table = 
					  "<tr>"
						  +"<td>"+value.product_cat_text+"</td>"
						  +"<input type='hidden' name='items["+index+"].MAKTX' value='"+value.product_cat_text+"'/>"
						  +"<input type='hidden' name='items["+index+"].MATNR' value='"+value.product_cat_id+"'/>"
						  +"<input type='hidden' name='items["+index+"].NETPR' value='"+value.rate+"'/>"
						  +"<input type='hidden' name='items["+index+"].NETWR_ITEM' value='"+value.value+"'/>"
						  +"<input type='hidden' name='items["+index+"].SPART' value='"+value.product_type_id+"'/>"
						  +"<input type='hidden' name='items["+index+"].ZIEME' value='"+value.unit+"'/>"
						  +"<input type='hidden' name='items["+index+"].Header_ID' value='"+value.header_id+"'/>"
						  +"<input type='hidden' name='items["+index+"].NETWR' value='"+document.getElementById("total_value").innerHTML+"'/>"
//						  +"<td><input type='text' name='items["+index+"].ZMENG' class='new_Value form-control' value='"+value.quantity+"'/></td>"
						  +"<td><input type='text'  id='quantity'  name='items["+index+"].ZMENG' class='new_Value form-control'  value='"+value.quantity+"'" 
						  +"onkeypress='return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57'" 
						  +"	onfocusout ='checkIFPositiveNumber(this.value);'" 
						  +"onfocus ='checkIFPositiveNumber(this.value);' onkeyup='changeTotal(this.value);' data-uuid1 = '"+value.uuid+"'/></td>"
//						  +"<td><input type='Number' name='items["+index+"].ZMENG' class='new_Value form-control' value='"+value.quantity+"'/></td>"
//						  +"<td><input type='text' class='new_Value form-control' disabled='disabled' value='"+value.quantity+"'/></td>"
						  +"<td><input type='text' class='new_Value form-control' disabled='disabled' value='"+formatDate()+"'/></td>"
						 /* +"<td>"+value.value+"</td>"
						  +"<td>"+value.rate+"</td>"*/
						  +"<td><button type='button' class='btn-del' onclick='deleteViewOrder(this)' "
						  		+"id = 'delete_"+count+"' data-uuid = '"+value.uuid+"'>"
								+"<span class='glyphicon glyphicon-remove'></span></button></td>"
					  +"</tr>";
			}
			
			  

			  
			  
			  // appending table body data to view records
			  $("#view_modal_table tbody").append(view_modal_table);
			  
			 
			   
//			  var orderValue = document.getElementById("limit").innerHTML -totalValue.toFixed(2);
//			  document.getElementById("limit").innerHTML = orderValue.toFixed(2);
			  
			  
		});
		
		$("#view_save").prop( "disabled", false );
		$("#saveClass").prop( "disabled", false );
		$("#viewClass").prop( "disabled", false );

	}
	else{
		$("#view_modal_table tbody").append('<tr><td colspan = "5">No Items Added.<td></tr>');
//		$().
		
		// Disabled View Save button when there is no items added......
				$("#view_save").prop( "disabled", true );
				$("#saveClass").prop( "disabled", true );
				$("#viewClass").prop( "disabled", true );
	}
		
}

	
// To return unique id ===================
	function guid() {
		  function s4() {
		    return Math.floor((1 + Math.random()) * 0x10000)
		      .toString(16)
		      .substring(1);
		  }
		  return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
	}

	
// Called when delete button is clicked=========
	function deleteViewOrder(object){
		
		var uuid = $(object).attr('data-uuid');
		
		for (var i = 0; i < itemsAdded.length; i++) {
		    var obj = itemsAdded[i];

		    if (itemsAdded[i].uuid && itemsAdded[i].uuid === uuid) { 
		    	
		    	var limit = document.getElementById("limit").innerHTML;
				var limitValue = Number(itemsAdded[i].value)   +  Number(limit);  
				document.getElementById("limit").innerHTML = limitValue.toFixed(2);

				
				var orderVal = document.getElementById("total_value").innerHTML; 
				totalOrderValue = Number(orderVal) - Number(itemsAdded[i].value);
				document.getElementById("total_value").innerHTML = totalOrderValue.toFixed(2);
				
				
		    	itemsAdded.splice(i, 1);// used to remove record
		    	
		    	viewAddedOrders();	//==== used to recreate table body structure ===========
		    	
		        break;
		    }
		    
		    
		}//end of for loop
		
	}// end of function
	
	
	