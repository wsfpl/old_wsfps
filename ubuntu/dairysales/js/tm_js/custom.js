$(document).ready(function(){
		
	   $(".card-header").each(function(){
		   
	        var $this=$(this);
	        var myTag = $this.find('.card-header-h4').text();
	        if (myTag.length > 77) {
	          var truncated = myTag.trim().substring(0, 70).split(" ").slice(0, -1).join(" ") + "...";
	          $this.find('.card-header-h4').text(truncated);
	        }
	    })
	
	
    $(".burger-menu").click(function(){
        $(".main-container").toggleClass('open-menu');
    })
    $(".dropdown-xs").click(function(){
        $(".dropdown-menu-xs").toggleClass('dropdown-open-menu');
    })
    /*----view details modal popup----*/
   /* $(".view-statusbilling-btn").click(function(){
    	$("#viewdetail-modal").modal('show');
    });*/
    
    /* mobile responsive orderdetails and orderandbillingstatus*/
    
    //$(".o-display-wrapper").click(function(){
    $(document).on("click",".o-display-wrapper",function() {     
    	 var $this = $(this);
        var headerId = $this.find(".class-order-ref-s").text();
        var orderDate = $this.find(".class-order-date-s").text();
        var totalQty = $this.find(".totalQty-s").val();
        var totalAmt = $this.find(".totalAmt-s").val();
       // alert("totalQty"+totalQty);
            $.ajax({
	  	    type: "GET",
	  	    url: 'getitemsbyorderid',
	  	    data: {headerId: headerId},
	  	    success: function(data) { 
	  	    	/*var totalNetPrice =0.0;
	  	    	var totalQty = 0;*/
	  	    	 var innerHtml='';
	  	    	 var innerHtmlDtlPart ='';
	  	    	var	innerHtmlHdrPart = '<div class="o-all-details-header"><div class="open-details"><div class="o-menubar"></div><div class="o-menubar"></div><div class="o-menubar"></div></div><h5 class="">'+headerId+'</h5><h5 class="pull-right h5-date-right"><button type="button" class="btn i-btn i-but-hdr" value="'+headerId+'" ><i class="fa fa-info-circle"></i></button></h5></div><div class="o-all-detail-body"><div class="o-product-title">';
	  	    	for (var key in data) {
	  	    		if(data[key].flag=="C1" || data[key].flag=="C2" || data[key].flag=="C21" || data[key].flag=="C")
	  	    			innerHtmlDtlPart = innerHtmlDtlPart	+'<div class="o-product-panel approve-status-bar">';
	  	    		else if(data[key].flag=="B1" || data[key].flag=="B2" || data[key].flag=="B21" || data[key].flag=="B")
	  	    			innerHtmlDtlPart = innerHtmlDtlPart+'<div class="o-product-panel partialapprove-status-bar">';
	  	    		else if(data[key].flag=="R1" || data[key].flag=="R2" || data[key].flag=="R21" || data[key].flag=="R")
	  	    			innerHtmlDtlPart = innerHtmlDtlPart+'<div class="o-product-panel reject-status-bar">';
	  	    		else
	  	    			innerHtmlDtlPart = innerHtmlDtlPart+'<div class="o-product-panel ">';
	  	    			
	  	    		var innerHtmlDtlPart = innerHtmlDtlPart +'<div class="status-bar"><div class="col-xs-12"><div class="o-product-filtering"><div class="col-xs-10">'
                    +'<p class="o-product-name">'+data[key].prdNm+'</p></div><div class="col-xs-2 p-0"><div class="o-product-info">'
                    +'<button type="button" class="btn i-btn i-btn-item " value="'+data[key].itemId+'" ><i class="fa fa-info-circle"></i></button>'
                    +'</div></div></div></div><div class="col-xs-10 col-xs-offset-1 "><form class="form-inline orderandbilling-forminline"><div class="form-group q-form-group">'
                    +'<label for="">Quantity:</label><p class="form-control">'
                    +'<span class="all-appr-span appr-span">'+data[key].qty+'</span><span class="div-bar">/</span>'
                    +'<span class="all-appr-span tmappr-span">'+data[key].tmApprQty+'</span><span class="div-bar">/</span>'
                    +'<span class="all-appr-span rmappr-span">'+data[key].rmApprQty+'</span></p></div><div class="form-group q-form-group">'
                    +'<label for="">Rupees:</label>'
                    +'<p class="form-control"><i class="fa fa-inr"></i>'+data[key].netPrice+'</p></div></form></div><div class="clearfix"></div></div><div class="clearfix"></div></div>';
	  	    		//totalNetPrice = totalNetPrice + parseFloat(data[key].netPrice);
	  	    		//totalQty = totalQty +parseInt(data[key].tmApprQty);
	  	    	}
	           
	  	    	innerHtml	= innerHtmlHdrPart + innerHtmlDtlPart + '</div></div><div class="o-all-details-header o-footer"><div class="col-sm-12 p-0"><div class="o-footertot-panel"><div class="col-xs-6 "><p class="">'
                    +'<span class="o-span-footer-txt">Total Quantity:</span>'
                    +'<span class="o-span-footer-val">'+totalQty+'</span></p></div><div class="col-xs-6 "><p class="">'
                    +'<span class="o-span-footer-txt">Total Amount:</span>'
                    +'<span class="o-span-footer-val"><i class="fa fa-inr"></i>'+totalAmt+'</span></p></div><div class="clearfix"></div></div></div></div>';
	            $this.parents(".o-details-card").find(".o-all-details").empty();
		        $this.parents(".o-details-card").find(".o-all-details").html(innerHtml);
		        
		        $(".o-all-details").slideUp();
		        $(".o-display-wrapper").slideDown();
		        $this.slideUp();
		        $this.parents(".o-details-card").find(".o-all-details").slideDown();
	  	    }
        })
    });
    
   //$(".open-details").click(function(){
	   $(document).on("click",".open-details",function() {
        var $this =$(this);
        $this.parents('.o-all-details').slideUp();
        $this.parents(".o-details-card").find(".o-display-wrapper").slideDown();
    })
    
    $(document).on("click",".i-but-hdr",function() {
    	 var $this = $(this);
		 var orderId = $(this).val();
		
		 $.ajax({
		  	    type: "GET",
		  	    url: 'getheadrinfo',
		  	    data: {orderId: orderId},
		  	    success: function(data) { 
        
		  	 var innerHtml = '<div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h4 class="modal-title">'+orderId+'</h4></div><div class="modal-body"><div class="modal-body-border"><div class="order-description"><p class="allorderdetail"><span class="title-information">Order Date:</span><span class="fieldvalue-information">'+data.headerDt+'</span></p><p class="allorderdetail"><span class="title-information">Comments:</span><span class="fieldvalue-information">'+data.cmt+'</span></p></div></div></div> </div>';
		     $('.i-btn-cnt-hdr').empty();
			 $('.i-btn-cnt-hdr').append(innerHtml);
    			 $('#orderbillingmodal').modal('show');  	    
		  	    }
		  	})
        });
        
     // $(document).on("click",".i-btn",function() {i-btn-item
    	  $(document).on("click",".i-btn-item",function() {  
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
	 
	   
     /*--billing-detail-list*/
     var counter = 1;
    $(".table-wrapper").on('click','.view-detailbtn',function(){
    	
        var $this = $(this);
        var currval = $this.parents('.orderdesc-card-panel').find('.tablecard-title .srno-count').text();
        $this.text('Hide Detail');
        $(this).removeClass('view-detailbtn').addClass('hide-detailbtn');
		$this.parents('.parent-sec').after("<div class='billing-hide-panel'><div class='col-md-4 col-sm-6 col-xs-6'><div class='orderdesc-card-panel billingdetail-box mb-15'><div class='tableentry-title'><p class='tablecard-title'>Sr No: "+currval+'.'+counter+"</p></div><div class='otherorder-detail'><div class='entry-details'><div class='icon-sec'><i class='fa fa-list-alt'></i></div><div class='field-desc-sec'><div class='field-desc-sec'><p class='field-text'>Header Id:<span class='field-val'>30025482</span></p></div></div><div class='entry-details'><div class='icon-sec'><i class='fa fa-user-o'></i></div><div class='field-desc-sec'><p class='field-text'>Name:<span class='field-val'>Yogendra Shekhar Mehra</span></p></div></div><div class='entry-details'><div class='icon-sec'><i class='fa fa-th-large'></i></div><div class='field-desc-sec'><p class='field-text'>Quantity:<span class='field-val'>17</span></p></div></div><div class='entry-details'><div class='icon-sec'><i class='fa fa-inr'></i></div><div class='field-desc-sec'><p class='field-text'>Total:<span class='field-val'>710.00</span></p></div></div><div class='view-box'><div class='text-center'><div>Pending</div></div></div></div></div></div></div></div>")
		 counter++;
})
    $(".table-wrapper").on('click','.hide-detailbtn',function(){
    	var $this=$(this);
    	$this.text('View Detail');
        $(this).addClass('view-detailbtn').removeClass('hide-detailbtn');
        $this.parents('.parent-sec').next('.billing-hide-panel').remove();
        counter--;
    })
    
    //$("#orderstatus-table").on('click','.vieworders',function(){
     $("#orderstatus-table").on('click','.view-statusbilling-btn',function(){
    		//$(document).on("click",".vieworders",function() {
    	//debugger;
    	var $this = $(this);
    	var ordrId = $this.closest('tr').children('td:eq(3)').text();
    	var loginId = $('#loginId').val();
        var dlrCode = $this.closest('tr').children('td:eq(2)').text();
        var status = $this.closest('tr').children('td:eq(5)').text();
        var totalQty =0;
        if(status =='pending')
            totalQty = $this.closest('tr').children('td:eq(6)').text();
        else if(status =='PartialProcessed By TM' || status =='Approved By TM' || status =='Rejected By TM')
        	totalQty = $this.closest('tr').children('td:eq(7)').text();
        else if(status =='PartialProcessed By RM' || status =='Approved By RM' || status =='Rejected By RM' || status =='Confirmed' || status =='Rejected')
        	totalQty = $this.closest('tr').children('td:eq(8)').text();
        else
        	totalQty = $this.closest('tr').children('td:eq(6)').text();
        
        var totalAmnt = $this.closest('tr').children('td:eq(9)').text();
        $.ajax({
    	    type: "GET",
    	    url: 'getproductdtls',
    	    data: {ordrId: ordrId,loginId: loginId},
    	    success: function(data) { 
    	    	//addProductToModal(data);
    	    	var dlrCmt ="";
    	    	console.log(data);
    	    	var innerHtml = '<div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h4 class="modal-title">Shree Traders</h4><div class="v-other-details">'
    	    	     +'  	<p class="v-title pull-left">Dealer Code:<span class="v-spanvalue">'+dlrCode+'</span></p>'
    	    	     +'   	<p class="v-title pull-right">Order No:<span class="v-spanvalue">'+ordrId+'</span></p>'
    	    	     +'   	<div class="clearfix"></div></div><div class="v-other-details">'
    	    	     +'   	<p class="v-title pull-left">Total Amount:<span class="v-spanvalue">'+totalAmnt+'</span></p>'
    	    	     +'  	<p class="v-title pull-right">Total Quantity:<span class="v-spanvalue">'+totalQty+'</span></p>'
    	    	     +'   	<div class="clearfix"></div></div></div><div class="modal-body"><div class="xs-w-50 modal-body-panel"><div class="view-detail-box"><div class="view-detail-header"><div class="col-sm-12 p-0"><div class=""><div class="table-responsive table-responsive-code"><table id="viewdeatil-orderstatustable" class="display table-style" style="width: 100%"><thead><tr><th rowspan="2" class="text-center">Product Name</th><th colspan="3" class="text-center">Quantity</th><th colspan="2" class="text-center">Price</th><th rowspan="2" class="text-center">Status</th></tr><tr><th>Dealer</th><th>Rm. Appr</th><th>Tm. Appr</th><th>Item Price</th><th>Net Price</th></tr></thead><tbody>';
    	    		for(var key in data){
    	    		  innerHtml = innerHtml +'<tr>'
    	    	     +'<td class="text-center">'+data[key].prdNm+'</td>'
    	    	     +'<td class="text-center" data-title="Dealer Qty:">'+data[key].dlrQty+'</td>'
    	    	     +'<td class="text-center"  data-title="tm appr Qty:">'+data[key].tmQty+'</td>'
    	    	     +'<td class="text-center"  data-title="rm appr Qty:">'+data[key].rmQty+'</td>'
    	    	     +'<td class="text-center"  data-title="Price:">'+data[key].itmPrice+'</td>'
    	    	     +'<td class="text-center"  data-title="Net Price:">'+data[key].netPrice+'</td>'
    	    	     +'<td class="text-center"  data-title="Staus:">'+data[key].status+'</td>'
    	    	     +'</tr>';
    	    		  dlrCmt = data[key].cmt;
    	    		}
    	    	    innerHtml = innerHtml +'</tbody></table></div></div></div></div><div class="clearfix"></div><p>Dealer Comments: '+dlrCmt+'</p></div></div></div>';
    	    	    $('#modalOrderDtlsInnerId').empty();
    	    	    $('#modalOrderDtlsInnerId').append(innerHtml);
    	    	    $("#viewdetail-modal").modal('show');
    	    	    
    	    	}
    	});
        //getItems(orderval);
    });
    
    
    /*--dealer list-*/
    var counter = 1;
 // $('#orderstatus-table').on('click','.view-btn',function(){
    $("#billingdetails-table").on('click','.view-btn',function(){
   
    	alert();
    	var counter = 1;
        var $this = $(this);
        var currval = $this.closest('tr').children('td:eq(0)').text();
        var headerId = $this.closest('tr').children('td:eq(1)').text();
       // $this.addClass("hide-btn").removeClass("view-btn").text('Hide Detail');
       // getItems(headerId);
        $.ajax({
    	    type: "GET",
    	    url: 'getitemsbyheader',
    	    data: {headerId: headerId},
    	    success: function(data) { 
    	    	console.log(data);
    	    	var counter=1;
    	    	var innerHtml = "";
    	    	for ( var key in data) {
    	            innerHtml = innerHtml+ "<tr class='hide_details_"+currval+"'><td class='text-center'>"+currval+'.'+counter+"</td><td class='text-center'>"+data[key].prdId+"</td><td class='text-center'>"+data[key].prdNm+"</td><td class='text-center'>"+data[key].qty+"</td><td class='text-center'>"+data[key].netPrice+"</td><td class='text-center'></td></tr>";
    	    		counter++;
    	    	  }
    	    	  $this.closest('tr').after(innerHtml);
    	    	}
    	});
        
    })
    $("#billingdetails-table").on('click','.hide-btn',function(){
        var $this = $(this);
        var currval = $this.closest('tr').children('td:eq(0)').text();
        $(".hide_details_"+currval+"").remove();
        $this.addClass("view-btn").removeClass("hide-btn").text('view Detail');
        counter--;
    })
    
    /*------one page tab navigations-------*/
    
    $(".view-page").click(function(){
        var $this  = $(this);
        $(".view-page").removeClass('active');
         $this.addClass('active');
        var activeview = $this.attr('data-tab');
         $(".content-view").removeClass('active');
        $("#"+activeview).addClass('active');
     })
   
   //$(".pendingorderviewclass").trigger('click');
    
     $('#order-table').DataTable({
         "ordering": false,
          "info":     false,
          responsive: true
     });
    $('#orderstatus-table').DataTable({
         "ordering": false,
          "info":     false,
          "destroy": true
          //responsive: true
     });
    $('#billingdetails-table').DataTable({
         "ordering": false,
          "info":     false,
          responsive: true
     });
    $('.dealerlist-datatable-cls').DataTable({
        "ordering": false,
        "info":false,
         "lengthChange": false
         //responsive: true
    });
    
    $( ".datepicker").datepicker({dateFormat: 'yy-mm-dd'})
    $("#orderstatus-table_wrapper").prepend('<div class="inline-filters"><form class="form-inline"><div class="form-group status-filter"><label class="status">Status:</label><select class="form-control statusSel-cls" id="statusSel"><option value="pending">Pending</option><option value="Approved by TM">Processed by TM</option><option value="Approved by RM">Processed by RM</option></select></div><div class="form-group status-filter"><label class="date">From Date:</label><input type="text" class="datepickerFrom form-control statusSel-cls"></input><div class="datepicker-icon"><i class="fa fa-calendar-o fa-calendar-from"></i></div></div><div class="form-group status-filter"><label class="date">To Date:</label><input type="text" class="datepickerTo form-control statusSel-cls"></input><div class="datepicker-icon"><i class="fa fa-calendar-o fa-calendar-to"></i></div></div></form></div>')
   
    //$( ".datepicker").datepicker();
   $(document).on("click",".datepicker-icon .fa-calendar-from",function() {
    var $this =$(this);
    $this.parents('.inline-filters .form-inline').find(".datepickerFrom").focus();
    });
  //  $('.datepicker-icon .fa-calendar-to').click(function() {
    $(document).on("click",".datepicker-icon .fa-calendar-to",function() {
        var $this =$(this);
        $this.parents('.inline-filters .form-inline').find(".datepickerTo").focus();
    });
    
    //$('.calender-icon .fa-calendar-from-s').click(function() {
    $(document).on("click",".calender-icon .fa-calendar-from-s",function() {
    var $this =$(this);
    $this.parents('.parent-cal').find(".datepickerFrom-s").focus();
    });
   // $('.calender-icon .fa-calendar-to-s').click(function() {
    $(document).on("click",".calender-icon .fa-calendar-to-s",function() {
    var $this =$(this);
    $this.parents('.parent-cal').find(".datepickerTo-s").focus();
    });
    
    var date = new Date();
    var currentMonth = date.getMonth();
    var prevMonth = date.getMonth() -1;
    var currentDate = date.getDate();
    var currentYear = date.getFullYear();
    
    var d = new Date();
    d.setMonth(d.getMonth() - 1);
    
	    $( ".datepickerFrom").datepicker({
	    		//minDate: new Date(currentYear, prevMonth, currentDate),
	            dateFormat: 'yy-mm-dd'
	    }).datepicker('setDate', d);
	    
	    $( ".datepickerFrom-s").datepicker({
			//minDate: new Date(currentYear, prevMonth, currentDate),
	        dateFormat: 'yy-mm-dd'
	}).datepicker('setDate', d);
	    
	date.setMonth(date.getMonth()+1);
	    
	    date.setMonth(date.getMonth()-1 );
	    $( ".datepickerTo").datepicker({
			//minDate: new Date(currentYear, currentMonth, currentDate),
	        dateFormat: 'yy-mm-dd'
	}).datepicker('setDate',  date);
	
	$( ".datepickerTo-s").datepicker({
		//minDate: new Date(currentYear, currentMonth, currentDate),
	    dateFormat: 'yy-mm-dd'
	}).datepicker('setDate', date);
    
   // $("#statusSel-s").change(function () { statusSel-s-cls
	$(".statusSel-s-cls").change(function () {	
        //var sel = //this.value;
		var sel = $("#statusSel-s").val();
        var fromDate = $(".datepickerFrom-s").val();
        var toDate = $(".datepickerTo-s").val();
        var tmId = $('#loginId').val();
        var bussId = $('#loginBussId').val();
        var OrderStatusFilterDto = {
        		    status : sel,
        		    fromDate : fromDate,
        		    toDate : toDate,
        		    tmId : tmId,
        		    bussId : bussId
        		}
        
        $('#header-dtl-s-id').empty();   
        $.ajax({
    	    type: "GET",
    	    url: 'getorderdtlsbyfilter',
    	    data: OrderStatusFilterDto,
    	    success: function(data) { 
    	    	var innerHtml = '';
    	    	for ( var key in data) {
    	    		innerHtml = innerHtml +'<div class="o-details-card"><div class="o-display-wrapper">';
    	    		if(data[key].flag=="C1" || data[key].flag=="C2" || data[key].flag=="C" || data[key].flag=="C21")
    	            	   innerHtml = innerHtml +'<div class="o-display-table approve-orders-bg">';
    	               else if(data[key].flag=="B1" || data[key].flag=="B2" || data[key].flag=="B" || data[key].flag=="B21")
    	            	   innerHtml = innerHtml +'<div class="o-display-table partialapporve-orders-bg">';
    	               else if(data[key].flag=="R1" || data[key].flag=="R2" || data[key].flag=="R" || data[key].flag=="R21")
    	            	   innerHtml = innerHtml +'<div class="o-display-table reject-orders-bg">'; 
    	               else
    	            	   innerHtml = innerHtml +'<div class="o-display-table ">';// pending for flow
    	               
    	               innerHtml = innerHtml +'<div class="o-left-detail"><h4 class="inr-h4">'+data[key].netPrice+'</h4><div class="o-inr-text">'+data[key].curr+'</div></div><div class="o-right-detail"><div class="o-order-panel"><div class="o-order-header"><div class="textleft"><p>Order Id:<span class="value-span class-order-ref-s">'+data[key].headerId+'</span></p><p>Order Date:<span class="value-span class-order-date-s">'+data[key].date+'</span></p><input type="hidden" class="totalQty-s" name="totalQty" value ="'+data[key].totalQty+'"/><input type="hidden" class="totalAmt-s" name="totalAmt" value="'+data[key].netPrice+'"/></div><div class="design-overview"><div class="upper-circle"></div><div class="vertical-bar"></div></div><div class="lower-circle"></div></div></div></div><div class="clearfix"></div></div></div> <div class="o-all-details"></div></div>';
    	    	}
    	    	
    	    	$('#header-dtl-s-id').html(innerHtml);
    	    }
        });
    });
    
   //$(document).on("change","#statusSel",function() { statusSel-cls
    $(document).on("change",".statusSel-cls",function() {
        //var sel = this.value;
    	var sel = $("#statusSel").val();
        var fromDate = $(".datepickerFrom").val();
        var toDate = $(".datepickerTo").val();
        var tmId = $('#loginId').val();
        var bussId = $('#loginBussId').val();
        var OrderStatusFilterDto = {
        		    status : sel,
        		    fromDate : fromDate,
        		    toDate : toDate,
        		    tmId : tmId,
        		    bussId : bussId
        		}
        
        $.ajax({
    	    type: "GET",
    	    url: 'getordersbyfilter',
    	    data: OrderStatusFilterDto,
    	    success: function(data) { 
    	    	var table = $('#orderstatus-table').DataTable().clear().destroy();
    	    	var dataTable = $('#orderstatus-table').dataTable({"sPaginationType": "full_numbers"});
    	    	$('#orderstatus-table').dataTable().fnClearTable();
    	    	datepickerReload(sel,fromDate,toDate);
    	    	var innerHtml = "";
    	    	var counter=1;
    	    		for ( var key in data) {
    	    			dataTable.fnAddData([
        	    		                     counter,
        	    		                     data[key].dlrNm,
        	    		                     data[key].dlrCd,
        	    		                     data[key].ordrNo,
        	    		                     data[key].ordrDate,
        	    		                     data[key].status,
        	    		                     data[key].dlrQty,
        	    		                     data[key].tmQty,
        	    		                     data[key].rmQty,
        	    		                     data[key].netAmt,
        	    		                     '<td class="text-center"><button type="button" class="btn view-btn view-statusbilling-btn"><i class="fa fa-eye vieworders" value="'+data[key].ordrNo+'"></i></button></td>'
        	    		                 ]);
    	    			counter++;
    	    		}
    	    		//$('#orderstatus-table').dataTable().fnFilter('');
        	    	//$('#orderstatus-table').DataTable().rows('.modified').invalidate().draw();
    	    	}
    	});
    });
    
    
	$(document).on("change","#pendingorders-select",function() {
		var selected = $(this).val();
		var loginId = $('#loginId').val();
		var loginBussId = $('#loginBussId').val();
		
		$.ajax({
		    type: "GET",
		    url: 'getdealerDtlsById',
		    data: {selected : selected,loginId : loginId,loginBussId : loginBussId},
		    success: function(data) { 
		    	addCrads(data);
		    	console.log(data);
		    	}
		});
		//$('#divDlrViewCardsId').empty();
	});
	
})

function addCrads(data){
	var innerHtml ='';
	for ( var key in data) {
		 innerHtml = innerHtml+'<div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">'
			+' <div class="card-box mb-15">'
			+' <div class="card-header">'
			+'  <h4 class="card-header-h4">'+data[key].dlrNm +'</h4>'
			+' </div>'
			+' <div class="card-description-box">'
			+'  <div class="details">'
			+'      <div class="dealer-p">'
			+'          <div class="dealer-title"><i class="ti-layout-grid2"></i>No of Orders:</div>'
			+'          <span class="dealer-value">'+data[key].noOfOrders+'</span>'
			+'      </div>'
			+'      <div class="dealer-p">'
			+'          <div class="dealer-title"><i class="fa fa-sitemap"></i>Dealer No:</div>'
			+'          <span class="dealer-value">'+data[key].dlrNo+'</span>'
			+'      </div>'
			+'  </div>'
			+'  <div class="view-box">'
			+'      <div class="text-center">'
			/*+'           <a  type="button" class="btn btn-view view-page" href="<spring:url value=/tmpendingordsdtls?dlrNo='+data[key].dlrNo+'/>">View</a>'*/
			/*+'           <a  type="button" class="btn btn-view view-page" href="${pageContext.request.contextPath}/tmpendingordsdtls?dlrNo='+data[key].dlrNo+'">View</a>'*/
			+'  <a  type="button" class="btn btn-view view-page" href="/Dairy/tmpendingordsdtls?dlrNo='+data[key].dlrNo+'">View</a>'
			+'      </div>'
			+'  </div>'
			+' </div>'
			+' </div>'
            +' </div>';
    	}
		    $('#divDlrViewCardsId').empty();
            $('#divDlrViewCardsId').append(innerHtml);
	
	
	}

function logoutSubmit(){
	
	document.getElementById("logoutForm").submit();
}

function getItems(headerId){
	
	$.ajax({
	    type: "GET",
	    url: 'getitemsbyheader',
	    data: {headerId: headerId},
	    success: function(data) { 
	    	addItems(data);
	    	console.log(data);
			   // $("#results").append(html);
	    	}
	});
	
}

function addItems(data){
	for ( var key in data) {
        $this.closest('tr').after("<tr class='hide_details'><td class='text-center'>"+currval+'.'+counter+"</td><td class='text-center'>AGHHB1241</td><td class='text-center'>159. TOMATO T444 PACKED SEED 10GMS</td><td class='text-center'>2.00</td><td class='text-center'>53000.00</td><td class='text-center'>Pending</td></tr>");
        counter++;
	}
}

function datepickerReload(sel,fromDate,toDate){
	
	  $( ".datepicker").datepicker({dateFormat: 'yy-mm-dd'})
	    $("#orderstatus-table_wrapper").prepend('<div class="inline-filters"><form class="form-inline"><div class="form-group status-filter"><label class="status">Status:</label><select class="form-control statusSel-cls" id="statusSel"><option value="pending">Pending</option><option value="Approved by TM">Processed by TM</option><option value="Approved by RM">Processed by RM</option></select></div><div class="form-group status-filter"><label class="date">From Date:</label><input type="text" id="fromdate-desk" class="datepickerFrom form-control statusSel-cls"></input><div class="datepicker-icon"><i class="fa fa-calendar-o fa-calendar-from"></i></div></div><div class="form-group status-filter"><label class="date">To Date:</label><input type="text"  id="todate-desk" class="datepickerTo form-control statusSel-cls"></input><div class="datepicker-icon"><i class="fa fa-calendar-o fa-calendar-to"></i></div></div></form></div>')

	    var date = new Date();
	    var currentMonth = date.getMonth();
	    var prevMonth = date.getMonth() -1;
	    var currentDate = date.getDate();
	    var currentYear = date.getFullYear();
	    
	    var d = new Date();
	    d.setMonth(d.getMonth() - 1);
	    
		    $( ".datepickerFrom").datepicker({
		            dateFormat: 'yy-mm-dd'
		    }).datepicker('setDate', d);
		    
		    $( ".datepickerFrom-s").datepicker({
		        dateFormat: 'yy-mm-dd'
		}).datepicker('setDate', d);
		    
		date.setMonth(date.getMonth()+1);
		    
		    date.setMonth(date.getMonth()-1 );
		    $( ".datepickerTo").datepicker({
		        dateFormat: 'yy-mm-dd'
		}).datepicker('setDate',  date);
		
		$( ".datepickerTo-s").datepicker({
		    dateFormat: 'yy-mm-dd'
		}).datepicker('setDate', date);
		
		   $('#fromdate-desk').val(fromDate);
		   $('#todate-desk').val(toDate);
		   $("#statusSel").val(sel);
}


function addProductToModal(data){
	
}
    