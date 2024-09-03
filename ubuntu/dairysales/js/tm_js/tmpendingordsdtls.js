$(document).ready(function(){
	
	 $(".o-display-wrapper").click(function(){
	        var $this = $(this);
	        var headerId = $this.find(".class-order-ref").text();
	        var orderDate = $this.find(".class-order-date").text();
	        
					      $.ajax({
					  	    type: "GET",
					  	    url: 'getitemsbyorderid',
					  	    data: {headerId: headerId},
					  	    success: function(data) { 
					  	    var innerHtmlDtlPart='';
					  	    var totalQty=0;
					  	    var totalAmt=0.00;
					  	    var	innerHtmlHdrPart = '<div class="o-all-details-header"><div class="open-details header-dtls-s-divice" id="slidedown"><div class="o-menubar"></div><div class="o-menubar"></div><div class="o-menubar"></div></div><h5 class=""><input type="checkbox" id="" name="" value="'+headerId+'" class="all-check-right-space"><span class="heder-span-s-divice">'+headerId+'</span></h5><h5 class="pull-right h5-date-right">'+orderDate+'</h5></div><div class="o-all-detail-body"><div class="o-product-title">';
					  	  for (var key in data) {
					  		totalQty = totalQty + data[key].qty;
					  		totalAmt = totalAmt + parseFloat(data[key].netPrice);
		innerHtmlDtlPart = innerHtmlDtlPart +'<div class="o-product-panel"><div class=""><div class="col-xs-12"><div class="o-product-filtering"><div class="col-xs-1 p-0">'
					      +'<input type="checkbox" class="item-chk-s" id="" name="" value="'+data[key].itemId+'"></div><div class="col-xs-9">'
					      +'<p class="o-product-name">'+data[key].prdNm+'</p>'
					      +'</div><div class="col-xs-2 p-0"><div class="o-product-info"><button type="button" class="btn i-btn modal-items" value="'+data[key].itemId+'" ><i class="fa fa-info-circle"></i></button></div></div></div></div><div class="o-quantity-edit"><div class="col-xs-10 col-xs-offset-1  br-q-divide br-divide"><div class="col-xs-6 p-0"><div class="form-group qrest-form-group">'
					      +'<label for="">Quantity:</label>'
					      +'<p><i class="fa "></i><span class="span-dlr-qty">'+data[key].qty+'</span></p>'
					      +'</div></div><div class="col-xs-6 p-0"><div class="form-group qrest-form-group">'
					      +'<label for="">Amount:</label>'
					      +'<p class="classnetprice"><i class="fa fa-inr"></i><span class="span-netprice">'+data[key].netPrice+'</span></p>'
					      +'<input type="hidden" class="form-control price" value="'+data[key].price+'">'
					      +'</div></div></div><div class="col-xs-10 col-xs-offset-1 "><form class="form-inline"><div class="form-group q-form-group">'
					      +'<label for="">Quantity:</label>'
					      +'<input type="text" class="form-control" id="quantity" value="'+data[key].qty+'" placeholder="Enter Quantity">'
					      +'</div></form></div></div><div class="clearfix"></div></div><div class="clearfix"></div></div>';
  					  	     }
					  	    	
					var innerHtml	= innerHtmlHdrPart + innerHtmlDtlPart +'</div></div><div class="o-all-details-header o-footer"><div class="col-sm-12 p-0"><div class="o-footertot-panel"><div class="col-xs-6 "><p class=""><span class="o-span-footer-txt">Total Quantity:</span><span class="o-span-footer-val footer-total-qty">'+totalQty+'</span></p></div><div class="col-xs-6 "><p class=""><span class="o-span-footer-txt">Total Amount:</span><span class="o-span-footer-val footer-total-amt"><i class="fa fa-inr"></i>'+totalAmt+'</span></p></div><div class="clearfix"></div></div></div><div class="clearfix"></div><div class="text-center btn-action-panel"><button type="button" class=" enbdisbtn-s commonn-btn btn approve-btn-s-divice approve-btn "><i class="fa fa-check"></i>Approve</button><button type="button" class=" enbdisbtn-s btn commonn-btn reject-btn reject-btn-s-divice"><i class="fa fa-times"></i>Reject</button></div></div>';
			        $this.parents(".o-details-card").find(".o-all-details").html(innerHtml);
			        $(".o-all-details").slideUp();
			        $(".o-display-wrapper").slideDown();
			        $this.slideUp();
			        $this.parents(".o-details-card").find(".o-all-details").slideDown();
			        $('.enbdisbtn-s').prop('disabled', true);
			        
					  	  }
					 });	   
        	    });
	    
	$(document).on("click","#slidedown",function() {
		var $this =$(this);
        $this.parents('.o-all-details').slideUp();
        $this.parents(".o-details-card").find(".o-display-wrapper").slideDown();
        $(this).parents(".o-details-card").find(".o-all-details").empty();
		});
	 
	$(document).on("change","#quantity",function() {
		var apprQty =$(this).val();
		 var totalQty=0.00;
	     var itemAmt =0.00;
		var price = $(this).parents('.o-quantity-edit').find('.price').val();
		var dlrQty = $(this).parents('.o-quantity-edit').find('.span-dlr-qty').text();
        if(parseFloat(dlrQty) >= parseFloat(apprQty)  && parsseFloat(apprQty) >0){
        	var netPrice = parseFloat(apprQty)*parseFloat(price);
        	$(this).parents('.o-quantity-edit').find('.span-netprice').text((parseFloat(apprQty)*parseFloat(price)).toFixed(2));
        }else{
				apprQty= dlrQty;
        }
         $(this).val(apprQty);
         
        var toltmQty = 0;
 		var toltmPrice =0.0;
 		$.each($(".o-product-title input[type='checkbox']"), function(){
	 		var tmQty =parseFloat($(this).parents('.o-product-panel').find('#quantity').val());
	 		var price = $(this).parents('.o-product-panel').find('.price').val();
	 		toltmQty = parseFloat(toltmQty) + parseFloat(tmQty);
	 		toltmPrice =toltmPrice+ parseFloat(price) * parseFloat(tmQty);
 		})
	 		$(this).parents('.o-details-card').find('.footer-total-qty').text(toltmQty.toFixed(2));
	        $(this).parents('.o-details-card').find('.footer-total-amt').text(toltmPrice.toFixed(2));
		});
	
	 $(document).on("click",".i-btn",function() {
		 var $this = $(this);
		 var prdId = $(this).val();
		 $.ajax({
		  	    type: "GET",
		  	    url: 'getitemsdtlsbyprdid',
		  	    data: {prdId: prdId},
		  	    success: function(data) { 
		  	    	
		 var innerHtml = '<div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button>'
		        +'<h4 class="modal-title">'+data.prdNm+'</h4></div><div class="modal-body"> <div class="modal-body-border"><div class="order-description"><p class="allorderdetail">'
		                     /* +'<span class="title-information">ProductId:</span>'
		                      +'<span class="fieldvalue-information">'+data.itemId+'</span></p><p class="allorderdetail">'*/
		                      +'<span class="title-information">Unit:</span>'
		                      +'<span class="fieldvalue-information">'+data.unit+'</span></p><p class="allorderdetail">'
		                      +'<span class="title-information">Unit Price:</span>'
		                      +'<span class="fieldvalue-information">'+data.price+'</span></p><p class="allorderdetail">'
		                      +'<span class="title-information">Requested Date:</span>'
		                      +'<span class="fieldvalue-information">'+data.reqDate+'</span></p></div></div></div>';
		 $('.i-btn-content').empty();
		 $('.i-btn-content').html(innerHtml);
		  	         }
		  	    });
		 $('#myModal').modal('show');
	 });
	 
	  $(".burger-menu").click(function(){
	        $(".main-container").toggleClass('open-menu');
	    });
	  $(".dropdown-xs").click(function(){
	        $(".dropdown-menu-xs").toggleClass('dropdown-open-menu');
	    });
	
	//$( ".qty_class" ).on("change", function() {
	/* mobile responsive orderdetails and orderandbillingstatus*/
   
	/*--sticky nav bar-*/
     if ($(window).width() < 766) {
		var stickyTop = $('.left-content-panel').offset().top;
		$(window).on('scroll', function () {
                if ($(window).scrollTop() >= stickyTop) {
                    $(".order-top-detail").addClass("sticky");
                    
                } else {
                   $(".order-top-detail").removeClass("sticky");
                }
            });
      }
	    
	$(".search-input").on("keyup", function() {
		
	    var value = $(this).val().toLowerCase();
	    var flag=false;
	    $(".order-menu-panel-ul li").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
		
		    if($(".order-menu-panel-ul li:visible").length == 0){
		    	     $(".hideElement").show();
	    	}else{
	    		 $(".hideElement").hide();
	    	}
	   });
	
	
	var headerId = $('ul#headers').find('li.active').attr('id');
	additems(headerId);
	
	$(document).on("click",".all_headers_li",function() {
		var THIS = $(this);
	    $('.all_headers_li.active').removeClass('active');
	    $(this).addClass('active');
	    var headerId = $('ul#headers').find('li.active').attr('id');
	    additems(headerId);
	});
	
	
	$(document).on("click",".approve-btn-s-divice",function() {
		var appDtls='';
		var chkVals='';
		var orderId = $(this).parents('#prdItemsdtlsId').find('.heder-span-s-divice').text();
		var prdId='',dlrQty='',tmQty='',itemPrice='',netPrice='';
		$.each($(".o-product-title input[type='checkbox']:checked"), function(){
			//$this = $(this);
			prdId = $(this).val();
			dlrQty = $(this).parents('.o-product-panel').find('.span-dlr-qty').text();
			tmQty = $(this).parents('.o-product-panel').find('#quantity').val();
			itemPrice = $(this).parents('.o-product-panel').find('.price').val();
			netPrice = $(this).parents('.o-product-panel').find('.span-netprice').text();
			appDtls = prdId+'_'+dlrQty+'_'+tmQty+'_'+itemPrice+'_'+netPrice;
			 if(chkVals == ''){
        		 chkVals = orderId;
        	 }
        	 chkVals = chkVals + ',' + appDtls;
    		});
		
        $.ajax({
     		type:"GET",
     		 url: 'approveitems',
     		    data: {chkVals: chkVals},
     		    success: function(data) {
     		    	var innerHtml = '<div class="modal-content"><div class="modal-body"><p class="status-text" >Order Approved Succesfully</p></div><div class="modal-footer"><div class="text-center"><a type="button" class="btn btn-default ok-btn" data-dismiss="modal"  onclick="reload()">OK</a></div></div></div>';
     		    	$('#approveRejectModalId').empty();
     		    	$('#approveRejectModalId').append(innerHtml);
     		    	$("#statusapproverejectmodal").modal('show');
     		    	//location.reload();
     		    }
     	    });
	    });
	
	$(document).on("click",".approve-btn-dsk-divice",function() {
		 var chkVals = '';
		 var apprQty,actQty,ItmPrice,netPrice;
		 var OrderBillingDtlsDto = [];
		 var appDtls='';
		 var prdId='',dlrQty='',tmQty='',itmPrice='',netPrice='',orderId='';
         $.each($("#apprrej input[type='checkbox']:checked"), function(){
        	  $this = $(this);
        	  orderId = $(this).val();
        	  prdId = $this.closest('tr').children('td:eq(2)').text();
        	  dlrQty  = $this.closest('tr').children('td:eq(3)').text();
        	  itemPrice = $this.closest('tr').children('td:eq(6)').text();
        	  netPrice = $this.closest('tr').children('td:eq(7)').text();
        	 $(this).closest('tr').find("input").each(function() {
        		 tmQty = this.value;
        	    });
        	 appDtls = prdId+'_'+dlrQty+'_'+tmQty+'_'+itemPrice+'_'+netPrice;
        	 if(chkVals == ''){
        		 chkVals = orderId;
        	 }
        	 chkVals = chkVals + ',' + appDtls;
         });
         console.log(appDtls);
         $.ajax({
     		type:"GET",
     		 url: 'approveitems',
     		    data: {chkVals: chkVals},
     		    success: function(data) {
     		    	var innerHtml = '<div class="modal-content"><div class="modal-body"><p class="status-text" >Order Approved Succesfully</p></div><div class="modal-footer"><div class="text-center"><a type="button" class="btn btn-default ok-btn" data-dismiss="modal"  onclick="reload()">OK</a></div></div></div>';
     		    	$('#approveRejectModalId').empty();
     		    	$('#approveRejectModalId').append(innerHtml);
     		    	$("#statusapproverejectmodal").modal('show');
     		    	//location.reload();
     		    }
     	});
    });
	
	$(document).on("click",".reject-btn-s-divice",function() {
		
		var chkVals = '';
		var orderId = $(this).parents('#prdItemsdtlsId').find('.heder-span-s-divice').text();
		var prdId = '';
         $.each($(".o-product-title input[type='checkbox']:checked"), function(){
        	// $this = $(this);
        	 prdId = $(this).val();
        	 if(chkVals == ''){
        		 chkVals = orderId;
        	 }
        	 chkVals = chkVals + ',' + prdId;
         });
         
         $.ajax({
       		type:"GET",
       		 url: 'rejectitems',
       		    data: {chkVals: chkVals},
       		    success: function(data) {
       		    	var innerHtml = '<div class="modal-content"><div class="modal-body"><p class="status-text" >Order Rejected Succesfully</p></div><div class="modal-footer"><div class="text-center"><a type="button" class="btn btn-default ok-btn" data-dismiss="modal"  onclick="reload()">OK</a></div></div></div>';
			    	$('#approveRejectModalId').empty();
			    	$('#approveRejectModalId').append(innerHtml);
			    	$("#statusapproverejectmodal").modal('show');
      		    	//location.reload();
       		    }
       	});
         
	});
	
	$(document).on("click",".reject-btn-dsk-divice",function() {
		var chkVals = '';
		var orderId = '';
		var prdId = '';
		
         $.each($("#apprrej input[type='checkbox']:checked"), function(){
        	 $this = $(this);
        	 orderId = $(this).val();
        	// alert(orderId);
        	 prdId = $this.closest('tr').children('td:eq(2)').text();
        	 if(chkVals == ''){
        		 chkVals = orderId;
        	 }
        	 chkVals = chkVals + ',' + prdId;
         })
        /* var innerHtml = '<div class="modal-content"><div class="modal-body"><p class="status-text" >Order Rejected Succesfully</p></div><div class="modal-footer"><div class="text-center"><a type="button" class="btn btn-default ok-btn" data-dismiss="modal"  onclick="reload()">OK</a></div></div></div>';
     		    	$('#approveRejectModalId').append(innerHtml);
     		    	$("#statusapproverejectmodal").modal('show');
     		    	*/
         $.ajax({
      		type:"GET",
      		 url: 'rejectitems',
      		    data: {chkVals: chkVals},
      		    success: function(data) {
      		    	var innerHtml = '<div class="modal-content"><div class="modal-body"><p class="status-text" >Order Rejected Succesfully</p></div><div class="modal-footer"><div class="text-center"><a type="button" class="btn btn-default ok-btn" data-dismiss="modal"  onclick="reload()">OK</a></div></div></div>';
     		    	$('#approveRejectModalId').append(innerHtml);
     		    	$("#statusapproverejectmodal").modal('show');
     		    	//location.reload();
      		    }
      	})
	});
	
	$(document).on("change",".qty_class",function() {
		var qty = $(this).val();
		var gotTmQty;
		var prop = $(this).closest('tr');
		var dlrQty;
		$.each(prop , function() {
			gotTmQty = $(this).find('td:eq(6)').text(); 
			dlrQty = $(this).find('td:eq(3)').text(); 
			if(parseFloat(dlrQty) >= parseFloat(qty)  && parseFloat(qty) >0){
				var netPrice = parseFloat(gotTmQty)* parseFloat(qty);
				$(this).find('td:eq(7)').text(netPrice.toFixed(2));
			}else{
				qty= dlrQty;
			}
			});
		
		$(this).val(qty);
	});
	
	// approve reject button disable enable on inner items(desktop)
	$(document).on("click",".chkboxItem",function() {
		var status = false;
		$.each($("#apprrej input[type='checkbox']:checked"), function(){
			status = true;
		})
		if(status)
	        $('.enbdisbuttons').prop('disabled', false);
	    else
	        $('.enbdisbuttons').prop('disabled', true);
	});
	
	// on header check box inner check box checked/unchecked and enable/disable approve,reject buttons(desktop) 
	$(".chkboxAll").click(function(){
		
		var status = $(this).is(":checked") ? true : false;
	    $(".chkboxItem").prop("checked",status);
	    if(status)
	        $('.enbdisbuttons').prop('disabled', false);
	    else
	        $('.enbdisbuttons').prop('disabled', true);
	    
	   /* var toltmQty = 0;
		var toltmPrice =0.0;
		
		$.each($(".o-product-title input[type='checkbox']:checked"), function(){
		var tmQty =parseInt($(this).parents('.o-product-panel').find('#quantity').val());
		var price = $(this).parents('.o-product-panel').find('.price').val();
		toltmQty = parseInt(toltmQty) + parseInt(tmQty);
		toltmPrice =toltmPrice+ parseFloat(price) * parseFloat(tmQty);
		})
		$(this).parents('.o-details-card').find('.footer-total-qty').text(toltmQty);
        $(this).parents('.o-details-card').find('.footer-total-amt').text(toltmPrice);
        */
	});
	
	// approve reject button disable enable on inner items(small-device)
	$(document).on("change",".all-check-right-space",function() {
		$(this).parenet
		var status = $(this).is(":checked") ? true : false;
	    $(".item-chk-s").prop("checked",status);
	    if(status)
	        $('.enbdisbtn-s').prop('disabled', false);
	    else
	        $('.enbdisbtn-s').prop('disabled', true);
	    
	    var toltmQty = 0;
		var toltmPrice =0.0;
		
		$.each($(".o-product-title input[type='checkbox']"), function(){
		var tmQty =parseFloat($(this).parents('.o-product-panel').find('#quantity').val());
		var price = $(this).parents('.o-product-panel').find('.price').val();
		toltmQty = parseFloat(toltmQty) + parseFloat(tmQty);
		toltmPrice =toltmPrice+ parseFloat(price) * parseFloat(tmQty);
		})
		$(this).parents('.o-details-card').find('.footer-total-qty').text(toltmQty.toFixed(2));
        $(this).parents('.o-details-card').find('.footer-total-amt').text(toltmPrice.toFixed(2));
        
	});
	
	// on header check box inner check box checked/unchecked and enable/disable approve,reject buttons(s-device) 
	$(document).on("change",".item-chk-s",function() {
		var toltmQty = 0;
		var toltmPrice =0.0;
		
		$.each($(".o-product-title input[type='checkbox']:checked"), function(){
		var tmQty =parseFloat($(this).parents('.o-product-panel').find('#quantity').val());
		var price = $(this).parents('.o-product-panel').find('.price').val();
		toltmQty = parseFloat(toltmQty) + parseFloat(tmQty);
		toltmPrice =toltmPrice+ parseFloat(price) * parseFloat(tmQty);
		})		
		$(this).parents('.o-details-card').find('.footer-total-qty').text(toltmQty);
        $(this).parents('.o-details-card').find('.footer-total-amt').text(toltmPrice);
		
		var status = false;
		$.each($(".o-product-title input[type='checkbox']:checked"), function(){
			status = true;
		});
		if(status)
	        $('.enbdisbtn-s').prop('disabled', false);
	    else
	        $('.enbdisbtn-s').prop('disabled', true);
	});
	
	
});

	  function additems(headerId){
		 $('.classOrderId').empty();
		 if(headerId =='undefined' || headerId == undefined)
			 return;
		 else
		     $('.classOrderId').append('<h5 class="order-left-title">Order Id: '+headerId+' </h5>');
			 
		 // disable approve and reject button
		 $('.enbdisbuttons').prop('disabled', true);
	
		 $.ajax({
		    type: "GET",
		    url: 'getitemsbyheader',
		    data: {headerId: headerId},
		    success: function(data) { 
		    	var counter=1;
		    	var dlrCmt ='';
		    	var innerHtml = "";
		    	for ( var key in data) {
		    		//innerHtml = innerHtml + '<tr id="apprrej"><td class="text-center"><input type="checkbox" class="chkboxItem" name="" value="'+headerId+'"></td><td>'+data[key].prdNm+'</td><td class="text-center">'+data[key].itemId+'</td><td class="text-center">'+data[key].qty+'</td><td class="text-center"><input type="number" class="qty_class" value="'+data[key].qty+'" pattern= "[1-9]"/></td><td class="text-center">'+data[key].unit+'</td><td class="text-center">'+data[key].price+'</td><td class="text-center">'+data[key].netPrice+'</td><td class="text-center">'+data[key].reqDate+'</td></tr>';
		    		innerHtml = innerHtml + '<tr id="apprrej"><td class="text-center"><input type="checkbox" class="chkboxItem" name="" value="'+headerId+'"></td><td>'+data[key].prdNm+'</td><td class="text-center">'+data[key].itemId+'</td><td class="text-center">'+data[key].qty+'</td><td class="text-center"><input type="number" class="qty_class" value="'+data[key].qty+'" step="0.01" /></td><td class="text-center">'+data[key].unit+'</td><td class="text-center">'+data[key].price+'</td><td class="text-center">'+data[key].netPrice+'</td><td class="text-center">'+data[key].reqDate+'</td></tr>';
		    		counter++;
		    		dlrCmt = data[key].cmt;
		    	  }
		    	var commnts='<p>Dealer Comments: '+dlrCmt+'</p>';
		    	  $('#order-table tbody').empty();
		    	  $('#order-table tbody').append(innerHtml);
		    	  $('#dlrCommentsDivId').empty();
		    	  $('#dlrCommentsDivId').append(commnts);
		    	  
		    	}
		});
	  }

	$(function(){
        var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");
        $.ajaxSetup({
            headers: {
                'X-CSRF-Token': $('meta[name="_csrf"]').attr('content')
            }
        });
     });
	
	function reload(){
		 location.reload();
	}
	
	function logoutSubmit(){
		
		document.getElementById("logoutForm").submit();
	}
