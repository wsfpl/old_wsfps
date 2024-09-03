$(document).ready(function(){
	
//	makeCorsRequest();
	if(window.location.href.indexOf("login?captchaError") > -1){
		alert("invalid captcha");
	}
	
});
// Create the XHR object.
function createCORSRequest(method, url) {
  var xhr = new XMLHttpRequest();
  if ("withCredentials" in xhr) {
    // XHR for Chrome/Firefox/Opera/Safari.
    xhr.open(method, url, true);
  } else if (typeof XDomainRequest != "undefined") {
    // XDomainRequest for IE.
    xhr = new XDomainRequest();
    xhr.open(method, url);
  } else {
    // CORS not supported.
    xhr = null;
  }
  return xhr;
}

// Helper method to parse the title tag from the response.
function getTitle(text) {
  return text.match('<title>(.*)?</title>')[1];
}

// Make the actual CORS request.
function makeCorsRequest() {

    var idn;
    idn = localStorage.getItem("idno");

	
	// All HTML5 Rocks properties support CORS.
//  var url = 'http://mahindraremembersservices.cloudapp.net/MahindraRemembersServices.svc/GalleryImages';
    var url = 'http://mahindraremembersservices.cloudapp.net/MahindraRemembersServices.svc/ValidateUser?user=HR240450&pass=mahindra';

  var xhr = createCORSRequest('GET', url);
  if (!xhr) {
    alert('CORS not supported');
    return;
  }

  // Response handlers.
  xhr.onload = function() {
	  
    var text = jQuery.parseJSON(xhr.responseText);
    console.log(text);
//    var title = getTitle(text);
//    console.log('Response from CORS request to ' + url + ': ' + text);
    
    if(text.validateUserResult=="Valid"){
    	window.location.href = "gallery.html";
    }else{
    	alert("error");
    }
    
  };

  xhr.onerror = function() {
    alert('Woops, there was an error making the request.');
  };

  xhr.send();
}
