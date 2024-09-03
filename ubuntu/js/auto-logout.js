/*
* 
* Every valid navigation (form submit, click on links) should
* set this variable to true.
*
* If it is left to false the page will try to invalidate the
* session via an AJAX call
*/
var validNavigation = false;

//alert("validNavigation==="+validNavigation);

/*
* Invokes the servlet /endSession to invalidate the session.
* No HTML output is returned
*/
function endSession() {
//	debugger; 
//	alert("End session");
  // $.get("<whatever url will end your session>");
     $.ajax({
         type: "GET",
         async: false,
         cache: false,
         url: "./invalidateSession",   
         data: { 
        	 random : Math.random()
         },
         success: function(result) {  },
         error: function(data) {  } 
 });
	
//	logoutForm
	
//	document.getElementById("logoutForm").submit();
	
	console.log("User is logged out");
//	alert("User is logged out");
   //alert("autoLogOff event Capture1");     
}

function wireUpEvents() {
  /*
  * For a list of events that triggers onbeforeunload on IE
  * check http://msdn.microsoft.com/en-us/library/ms536907(VS.85).aspx
  */
//	debugger;
	console.log("wireUpEvents==="+validNavigation);
	$(window).unbind();
	
  window.onbeforeunload = function() {
      if (!validNavigation) {    
    	  debugger;
         endSession();
      }
  }

  // Attach the event click for all links in the page
  $("a").bind("click", function() {
	  debugger;
	  validNavigation = true;
     
//     alert("=================inside ALERT=================");
  });

  // Attach the event submit for all forms in the page
  $("form").bind("submit", function() {
	  debugger;
     validNavigation = true;
  });

}

// Wire up the events as soon as the DOM tree is ready
$(document).ready(function() {
	
	debugger;
    wireUpEvents();  
});



	function checkLength(el) {
	  if (el.value.length > 6) {
//	    alert("length must be exactly 6 characters")
	  }
	}
