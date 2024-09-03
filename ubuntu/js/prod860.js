var prodTable;
$(document).ready(function() {
	prodTable = $('#prodTable').DataTable({
	    responsive: true,
	    paging: true,
	    scrollX: true,
        scrollY: "387px",
        dom: 'Bfrtip',
        buttons: [{
            extend: 'excel',
            text: 'Download Excel',
            className: 'excel-btn',
            filename: 'Product Master',
            exportOptions: { columns: [0,1,2,3,4,5,6,7,8] }
        }
        ]
	});
	
	$('#addPrdBtn').click(function(e) {
		$('#prdForm')[0].reset();
		$('#id').val('0');
		$('#MESSAGE').val('C');
		$('#prdAddUpModal').modal('show');
	});
	
	
	$('#deleteAll').click(function(e) {
		swal({
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
		}).then((result) => {
		 $.ajax({
		      type: "GET",
		      url: "product860CUDdelete",
		     // data: formData,
		      success: function (status) {
			      window.location.href="prddlr"   ; 	  

		      }
		 });
		});
	});	
	
	$("#uploadPrdBtn").click(function() { 
	
	 var form = $('#s_file').val();
		       if(form == ""){
		    	   swal("Please Choose file");
		       }
		        var data = new FormData();
		       data.append("file",s_file.files[0]);
		      
		        $.ajax({
		           type: "POST",
		           enctype: 'multipart/form-data',
		           url: "upload860Sheet",     
		           data: data,  
		           //data: {file:file},  
	            processData: false,
	           contentType: false,
	           /*    cache: false,*/
		          // timeout: 600000,
		           success: function (data) {
		        	   
		          	 debugger;
		          	 if(data=="Error"){
		          		
		          		// alert("Success:"+data);
		              	swal(data);
		              	 $('#selectFile').attr("value", "");
		              	
		          	 }else{
		          	//	 alert("Success:"+data);
		          		swal("Excel Uploaded Sucessfully").then(function(){
    					location.reload();
						});
		          		 $('#selectFile').attr("value", "");
		          		
		          	 } 
		          	  
		           },
		           error: function (e) {
		          	// alert("error"+e);  
		        	   $('#selectFile').attr("value", "");

		           }
		       });
		       
	});
	
	$('#prodTable').on('click', '.edtPrdBtn', function() {
		var row = $(this).closest('tr');
		$('#id').val($(this).val());
		$('#MESSAGE').val('U');
		$('#maktx').val(row.find('.maktx').text().trim());
		$('#matkl').val(row.find('.matkl').text().trim());
		$('#kbetr').val(row.find('.kbetr').text().trim());
		$('#knumh').val(row.find('.knumh').text().trim());
		$('#matnr').val(row.find('.matnr').text().trim());
		$('#mtart').val(row.find('.mtart').text().trim());
		$('#kunnr').val(row.find('.kunnr').text().trim());
		$('#spart').val(row.find('.spart').text().trim());
		$('#vrkme').val(row.find('.vrkme').text().trim());
		$('#vtext').val(row.find('.vtext').text().trim());
		$('#sales_org').val(row.find('.sales_org').text().trim());
		$('#prdAddUpModal').modal('show');
	});
	
	$('#prodTable').on('click', '.delPrdBtn', function() {
		var id = $(this).val();
		swal({
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
		}).then((result) => {
			  if (result) {
				  	$('#id').val(id);
					$('#MESSAGE').val('D');
					$('#prdForm').submit();
			  }
		});
	});
	
	$('#prdForm').submit(function(e) {
		var op = $('#MESSAGE').val();
		var id = $('#id').val();
		var formData = $(this).serialize();
	    $.ajax({
	      type: "POST",
	      url: "prddlrcud",
	      data: formData,
	      success: function (status) {
	    	  if(status != '') {
	    		  swal({
	    			  title: '',
	    			  icon: 'success',
	    			  text: status.split('#')[0],
	    			  confirmButtonText: 'Ok'
	    		  })
	    		  .then((result) => {
	    			  switch(op) {
	    			  	case 'C':
	    			  		id = status.split('#')[1];
	    			  		var newRow = '<tr id="' + id + '"> <td>' + (prodTable.row(':last')[0][0]+1) + '</td> <td class="maktx">' + $('#maktx').val() + '</td> <td class="matkl">' + $('#matkl').val() + '</td> <td class="kbetr">' + $('#kbetr').val() + '</td> <td class="matnr">' + $('#matnr').val() + '</td> <td class="mtart">' + $('#mtart').val() + '</td> <td class="kunnr">' + $('#kunnr').val() + '</td> <td class="vrkme">' + $('#vrkme').val() + '</td> <td class="vtext">' + $('#vtext').val() + '</td> <td> <div class="wid_box"> <button class="btn btn-warning actionbtn edtPrdBtn" value="' + id + '">Edit</button> <button class="btn btn-danger delete-popup delPrdBtn" value="' + id + '">Delete</button> </div> </td> </tr>';
	    			  		prodTable.row.add($(newRow)).draw(false);
	    			  		break;
	    			  	case 'U':
	    			  		var row = $('#'+id);
	    			  		row.find('.maktx').text($('#maktx').val());
	    			  		row.find('.matkl').text($('#matkl').val());
	    			  		row.find('.kbetr').text($('#kbetr').val());
	    			  		//row.find('.knumh').text($('#knumh').val());
	    			  		row.find('.matnr').text($('#matnr').val());
	    			  		row.find('.mtart').text($('#mtart').val());
	    			  		row.find('.kunnr').text($('#kunnr').val());
	    			  		//row.find('.spart').text($('#spart').val());
	    			  		row.find('.vrkme').text($('#vrkme').val());
	    			  		row.find('.vtext').text($('#vtext').val());
	    			  		//row.find('.sales_org').text($('#sales_org').val());
	    			  		break;
	    			  	case 'D':
	    			  		prodTable.row($('#'+id))
	    			        .remove()
	    			        .draw(false);
	    			  		break;
	    			  }
	    			  $('#prdAddUpModal').modal('hide');
	    		  });
	    	  } else {
	    		  swal({
	    			  title: 'Fail',
	    			  icon: 'warning',
	    			  confirmButtonText: 'Ok',
	    			  text: 'Failed to perform operation'
	    		  })
	    		  .then((result) => {
	    			  $('#prdAddUpModal').modal('hide');
	    		  });
	    	  }
	      },
	       error: function(e) {
	    	   swal({
	    			  title: 'Error',
	    			  icon: 'error',
	    			  confirmButtonText: 'Ok',
	    			  text: 'Error in service call!'
	    		  })
	    		  .then((result) => {
	    			  $('#prdAddUpModal').modal('hide');
	    		  });
	    	   console.error('Error in service call, details: ', e);
	       }
	    });
		
		e.preventDefault();
		return false;
	});
});

$(window).load(function() {
	prodTable.draw(false);
});

function logoutSubmit(){
	document.getElementById("logoutForm").submit();
}