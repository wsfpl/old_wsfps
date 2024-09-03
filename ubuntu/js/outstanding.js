var prodTable;
$(document).ready(function() {
	prodTable = $('#prodTable').DataTable({
		responsive: true,
	    paging: true,
        scrollY: "387px",
        dom: 'Bfrtip',
        buttons: [{
            extend: 'excel',
            text: 'Download Excel',
            className: 'excel-btn',
            filename: 'Outstanding',
            exportOptions: { columns: [0,1,2] }
        }
        ]
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
		      url: "outstamtcuddelete",
		     // data: formData,
		      success: function (status) {
		      window.location.href="outstanding"   ; 	  
		      }
		 });
		});
	});	
	
	$('#addPrdBtn').click(function(e) {
		$('#prdForm')[0].reset();
		$('#id').val('0');
		$('#MESSAGE').val('C');
		$('#prdAddUpModal').modal('show');
	});
	
	$('#prodTable').on('click', '.edtPrdBtn', function() {
		var row = $(this).closest('tr');
		$('#id').val($(this).val());
		$('#MESSAGE').val('U');
		$('#kunnr').val(row.find('.kunnr').text().trim());
		$('#outstanding').val(row.find('.outstanding').text().trim());
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
	      url: "outstamtcud",
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
	    			  		var newRow = '<tr id="' + id + '"> <td>' + (prodTable.row(':last')[0][0]+1) + '</td> <td class="kunnr">' + $('#kunnr').val() + '</td> <td class="outstanding">' + $('#outstanding').val() + '</td> <td> <div class="wid_box"> <button class="btn btn-warning actionbtn edtPrdBtn" value="' + id + '">Edit</button> <button class="btn btn-danger delete-popup delPrdBtn" value="' + id + '">Delete</button> </div> </td> </tr>';
	    			  		prodTable.row.add($(newRow)).draw(false);
	    			  		break;
	    			  	case 'U':
	    			  		var row = $('#'+id);
	    			  		row.find('.kunnr').text($('#kunnr').val());
	    			  		row.find('.outstanding').text($('#outstanding').val());
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
	   
	   $("#uploadOutBtn").click(function() { 
	
	 var form = $('#s_file').val();
		       if(form == ""){
		    	   swal("Please Choose file");
		       }
		        var data = new FormData();
		       data.append("file",s_file.files[0]);
		      
		        $.ajax({
		           type: "POST",
		           enctype: 'multipart/form-data',
		           url: "uploadOutstandingSheet",     
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
		          		swal("Excel Uploaded Sucessfully");
		          		 $('#selectFile').attr("value", "");
		          		
		          	 } 
		          	  
		           },
		           error: function (e) {
		          	// alert("error"+e);  
		        	   $('#selectFile').attr("value", "");

		           }
		       });
		       
	});
});

function logoutSubmit(){
	document.getElementById("logoutForm").submit();
}
