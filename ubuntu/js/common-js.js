//================ Date format to display Date ===
    	function formatDate() {
    	    var d = new Date(),
    	        month = '' + (d.getMonth() + 1),
    	        day = '' + d.getDate(),
    	        year = d.getFullYear();

    	    if (month.length < 2) {month = '0' + month;}
    	    if (day.length < 2)
    	    {
    	    	day = '0' + day;
    	    }
    	    return [day, month, year].join('-');
    	}
    	
    	
    	function showAlert(title, body, alertType){
    		
    		if(alertType == 'positive'){
    			
    			if($("#showAlert_text").hasClass("alert_danger")){
    				$("#showAlert_text").removeClass("alert_danger");	
    			}
    			
    			$("#showAlert_text").addClass("confirmed");
    			
    			
    		}
    		else if(alertType == 'negative'){
    			
    			if($("#showAlert_text").hasClass("confirmed")){
    				$("#showAlert_text").removeClass("confirmed");	
    			}
    			
    			$("#showAlert_text").addClass("alert_danger");
    		}
    		
    		$("#showAlert").modal("show");
    		$("#showAlert_title").text(title);
    		$("#showAlert_text").text(body);
    		
    		
    		
    	}
    	
    	
    	// Check Only Positive Number
    	function checkIFPositiveNumber(value,event){
// 			/^[+]?([1-9][0-9]*(?:[\.][0-9]*)?|0*\.0*[1-9][0-9]*)(?:[eE][+-][0-9]+)?$/
					
			var res = /^[+]?([1-9][0-9]*(?:[\.][0-9]*)?|0*\.0*[1-9][0-9]*)(?:[eE][+-][0-9]+)?$/.test(value);
//			console.log("res====>>>>"+res+"=====>>>"+value);
			if(!res){
				document.getElementById("quantity").value = "";
			}
			var productName=$( "#productcodelist option:selected" ).text();
			//alert(productName);
			/*var charC = (event.which) ? event.which : event.keyCode; 
			console.log(charC);*/
			
			var myInputs = document.querySelectorAll('#quantity');
			myInputs.forEach(function(elem) {
				  elem.addEventListener("input", function() {
				 //   var dec = elem.getAttribute('decimals');
				   // var regex = new RegExp("(\\.\\d{" + dec + "})\\d+", "g");
				    var regex;
				    regex = new RegExp("(\\.\\d{2})\\d+", "g");
				    elem.value = elem.value.replace(regex, '$1');
				    /*if(productName.includes("PACKED")){
				              regex = new RegExp("/\D/g");
				          
				            elem.value = elem.value.replace(/[^0-9\.]/g,''); 
				              //elem.value = elem.value.replace(regex, '');
				    }
				    else{
				    	    regex = new RegExp("(\\.\\d{2})\\d+", "g");
				    elem.value = elem.value.replace(regex, '$1');
				    }*/
				  });
				});
		}
    	
    	function changeTotal(value){
    	/*	//alert(value);
    	 var rate=	document.getElementById("edit-rate").value;
    	  // 
    	 var name = $("#edit-rate").attr("name");
    	 alert(name);
    	 var changePrice = (value*rate).toFixed(2);
    	   //alert(changePrice);
    	// document.getElementById("edit-value").html = changePrice;
    	 $('.edit-value').val(changePrice);*/
    		
    	}