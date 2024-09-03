function setUserName() {
    $(".loader").show();
    var username = window.localStorage.getItem("userName");
    document.getElementById("userNm").innerHTML = "";
    document.getElementById("userNm").innerHTML = username.replace(/['"]+/g, '');

}


var responseData = "";
var salesItems = new Array();
var itemCount = 0;
var getPendingLimit = 0;

$(document).ready(function() {

    salesItems = window.localStorage.getItem("salesItems", salesItems);
    if (salesItems && salesItems.length > 0) {
        salesItems = $.parseJSON(salesItems);
        $(".view").attr("disabled", false);
    } else {
        $(".view").attr("disabled", true);
        salesItems = new Array();
    }



    var saveData = {};
    $(".add").click(function() {
        if ($("#quantity").val() == null || $("#quantity").val() == "") {
            alert("Please Enter Quantity");
        } else {
            $(".view").attr("disabled", false);
            $(".save").attr("disabled", false);
            $("#productlist").attr("disabled", true);
            addRecords();
        }

    });


    $(".bckbtn").click(function() {
//        window.history.back();
    });



    $(".save").click(function() {
        $(".loader").show();
        saveRecords(salesItems);
        $("#productlist").attr("disabled", false);
    });
    $(".view").click(function() {

        $('.addItemDiv').slideUp('hide');
        $('.viewOrderDiv').slideDown('show');
        viewRecords();
    });

    $("#close").click(function() {

        window.location.href = "inner.html";
    });

    $("#backitem").click(function() {

        $('.viewOrderDiv').slideUp('hide');
        $('.addItemDiv').slideDown('show');
    });
});

function pendingData() {
    var finalAmount = 0;
    $(".pendingUpdate table tbody").html('');
    debugger;
    for (var i = 0; i < salesItems.length; i++) {
        $(".pendingUpdate table tbody").append("<tr>");
        $(".pendingUpdate table tbody").append("<td data-title='Material'>" + salesItems[i].maktx + "</td>");
        $(".pendingUpdate table tbody").append("<td data-title='Quantity'><input type='text' id='quantity" + salesItems[i].posnr + "' class='new_Value form-control' value=" + salesItems[i].zmeng + "></td>");
        var fdate = salesItems[i].edatu;
        finalAmount += salesItems[i].netwrItem - 0;
        $(".pendingUpdate table tbody").append("<td data-title='Due Date'><input type='text' id='dueDate" + salesItems[i].posnr + "' class='form-control datepicker dateReq' value='" + fdate + "'></td>");
        $(".pendingUpdate table tbody").append("<td data-title='Material'>" + salesItems[i].netwrItem + "</td>");
        $(".pendingUpdate table tbody").append("<td data-title='Material'>" + salesItems[i].netpr + "</td>");
        $(".pendingUpdate table tbody").append('<td data-title="Action"><button type="button" class="btn-del" onClick="deleteRecord(this)"  data-posnr=' + salesItems[i].posnr + '><span class="glyphicon glyphicon-remove"></span></button></td>');
    }
    $("#limit_view").html(finalAmount);
    $(".datepicker").datepicker();
}


function deleteRecord(datas) {
    var posnr = datas.dataset.posnr;
    for (var i = 0; i < salesItems.length; i++) {
        if (salesItems[i].posnr == posnr) {
            salesItems.splice(i, 1);
            pendingData();
            break;
        }
    }
}

function updateRecord(datas) {
    updateDeleteRecord(datas, "UPDATE");
}

function updateDeleteRecord() {
    //		saveRecords(salesItems);
    var salesItems1 = new Array();
    for (var i = 0; i < salesItems.length; i++) {
        var itemNumber = salesItems[i].posnr;
        var qunatity = $("#quantity" + itemNumber).val();
        var edatu = $("#dueDate" + itemNumber).val();
        var amountItem = qunatity * salesItems[i].netpr;
        var oData = {
            "posnr": salesItems[i].posnr,
            "matnr": salesItems[i].matnr,
            "maktx": salesItems[i].maktx,
            "werks": "",
            "lgort": "",
            "zmeng": qunatity,
            "ameng": "",
            "zieme": salesItems[i].zieme,
            "netpr": salesItems[i].netpr,
            "netwrItem": amountItem,
            "edatu": edatu,
        };
        salesItems1.push(oData);
    }


    saveRecords(salesItems1);

}



function viewRecords() {
    //	$(".pendingOrderModal").modal('show');
    //	$(".pendingOrderModal table tbody").html('');
    //	for(var i=0;i<salesItems.length;i++){
    ////		var arr = salesItems[i].matnr.split(":");
    //		      $(".pendingOrderModal table tbody").append("<tr>");
    //			  $(".pendingOrderModal table tbody").append("<td>"+salesItems[i].maktx+"</td>");
    //			  $(".pendingOrderModal table tbody").append("<td>"+salesItems[i].zmeng+"</td>");
    //			  $(".pendingOrderModal table tbody").append("<td>"+salesItems[i].zieme+"</td>");
    //		      $(".pendingOrderModal table tbody").append("</tr>");
    //	}

    /*window.location.href="createorderview.html";
    salesItems = JSON.stringify(salesItems);
    window.localStorage.setItem("salesItems",salesItems);*/

    pendingData();
}

function saveRecords(salesItems) {
    var finalData = new Array();
    var finalAmount = 0;
    for (var i = 0; i < salesItems.length; i++) {
        finalAmount += parseFloat(salesItems[i].netwrItem);
    }
    var kunnr = window.localStorage.getItem("userId");
    finalData.push({
        "kunnr": kunnr,
        "vkorg": "",
        "vtweg": "",
        "spart": $("#productlistCode").val(),
        "vkgrp": "",
        "vkbur": "",
        "netwrHeader": finalAmount,
        "creditLimit": "",
        "flag": " ",
        "status": " ",
        "items": salesItems
    });

    //	 makeCorsRequest(finalData);
    console.log(finalData);
    var finalData = JSON.stringify(finalData);
    $.ajax({
        type: "POST",
        url: "http://mapps.mahindra.com:8580/dairy/DataController",
        data: {
            userOpr: 'INSERT',
            jdata: finalData
        },
        success: function(data, req, res) {
            $(".loader").hide();
            $('.alertModal').modal('show');
            $('.alertModal .alert').removeClass('alert-danger').addClass('alert-success');
            var result = data.substring(data.indexOf(":") + 2, data.lastIndexOf("}") - 1);
            $('.alertModal .alert').html(result);
        },
        error: function(oError) {
            $(".loader").hide();
            $('.alertModal').modal('show');
            $('.alertModal .alert').removeClass('alert-success').addClass('alert-danger');
            $('.alertModal .alert').html(oError);
        }
    });
    salesItems = [];
    itemCount = 0;
    reset();
}


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
function makeCorsRequest(finalData) {

    // All HTML5 Rocks properties support CORS.
    //  var url = 'http://mahindraremembersservices.cloudapp.net/MahindraRemembersServices.svc/GalleryImages';
    var url = 'http://mapps.mahindra.com:8580/dairy/DataController';
    var xhr = createCORSRequest('POST', url);
    if (!xhr) {
        alert('CORS not supported');
        return;
    }
    xhr.onload = function() {
        var text = jQuery.parseJSON(xhr.responseText);
    };
    xhr.onerror = function() {
        alert('Woops, there was an error making the request.');
    };
    xhr.send('userOpr=INSERT&jdata=' + finalData);
}

function addRecords() {
    itemCount += 10;
    /*salesItems = window.localStorage.getItem("salesItems",salesItems);
    if(salesItems &&  salesItems.length>0){
    	salesItems = $.parseJSON(salesItems);
    }else{
    	salesItems = new Array();
    }*/
    var productPrice = $("#productPrice1").text();
    productPrice = productPrice.substring(0, productPrice.indexOf("["));
    var amountItem = parseFloat($("#quantity").val()) * productPrice;
    var limitamt = parseFloat($("#limit").text()) - amountItem;
    var matnr =  $("#productcodelist option:selected").val().split(":")[3];
    var oData = {
        "posnr": itemCount,
        "matnr": matnr,
        "maktx": $("#productdes").text(),
        "werks": "",
        "lgort": "",
        "zmeng": $("#quantity").val(),
        "ameng": "",
        "zieme": $("#productunit").text(),
        "netpr": productPrice,
        "netwrItem": amountItem,
        "edatu": $("#delDate").val()
    };

    $("#limit").text(limitamt);
    reset();
    salesItems.push(oData);
    //	$('.addalertModal').modal('show');
    //	$('.addalertModal .alert').addClass('alert-danger').removeClass('alert-success');
    //	$('.addalertModal .alert').text('warning');
    //	//	 $('.alertModal').modal('show');
    //	 $('.alertModal .alert').removeClass('alert-danger').addClass('alert-success');
    //	 $('.alertModal .alert').html("Prices will be applicable as per the Deliver  Day!!");

    //	salesItems = JSON.stringify(salesItems);
    //	window.localStorage.setItem("salesItems",salesItems);
}

function reset() {

    $("#productcodelist").val("");
    //$("#productlist").val("");
    $("#productdes").text("");
    $("#quantity").val("");
    $("#productunit").text("");
    $("#productPrice1").text("");
    //	$("#limit").text("");

}


function getProduct() {
    $("#productcodelist").html('');
    $("#productdes").val(null);
    $("#productunit").val(null);
    $("#productlist").html('');
    var mySelect = $('#productlist');
    for (var i = 0; i < responseData.results.length; i++) {
        mySelect.append(
            $('<option></option>').val(responseData.results[i].Spart).html(responseData.results[i].Vtext)
        );
    }
    $(".loader").hide();
}

function getProductCode() {
    $("#productdes").val(null);
    $("#productunit").val(null);
    $("#productcodelist").html('');
    $("#productcodelist").attr("disabled", false);
    for (var i = 0; i < responseData.results.length; i++) {
//        $("#productcodelist").append(new Option(responseData.results[i].Matnr + "  " + , responseData.results[i].Maktx + ":" + responseData.results[i].Vrkme + ":" + responseData.results[i].Kbetr));
    	
    	$("#productcodelist").append(new Option(responseData.results[i].Maktx , responseData.results[i].Maktx + ":" + responseData.results[i].Vrkme + ":" + responseData.results[i].Kbetr+ ":" + responseData.results[i].Matnr));
        $("#productPrice").val(responseData.results[i].Kbetr - 0);
    }
    $(".loader").hide();
}


function readServices(cback, url) {
    var oHeaders = {};
//    oHeaders['Authorization'] = "Basic " + btoa("203442:welcome@3");
    oHeaders['Authorization'] = "Basic " + btoa("web_mobility:welcome@2");
    var request = {
        headers: oHeaders,
        requestUri: url,
        method: "GET",
    };
    OData.request(request, function(data) {
        // alert("success"+data);
        responseData = data;
        eval(cback);
    }, function(data) {
//        alert("fail" + data.MESSAGE);
    	 $(".loader").hide();
        $('.alertModal').modal('show');
        $('.alertModal .alert').removeClass('alert-success').addClass('alert-danger');
        $('.alertModal .alert').html("Error In  Network!! ");
    });

}

function confirmOrders() {
    $("#confirmOrder").html('');
    for (var i = 0; i < responseData.results.length; i++) {
        var stageNo = responseData.results[i].StageNo;
        var erdat = changeDate(responseData.results[i].Erdat);
        $("#confirmOrder").append('<li onClick="displayDetailData(this)" data-StageNo=' + stageNo + '><a><div class="col-xs-6"><span class="num">' + stageNo + '</span><span class="num">No of Items:' + responseData.results[i].NavStaging.results.length + '</span></div><div class="col-xs-6 text-right"><span class="qty">' + responseData.results[i].Netwr + '</span><span class="mat">' + erdat + '</span></div><div class="clearfix"></div></a></li>');
    }
    $(".loader").hide();
}


function rejectOrders() {
    $("#rejectOrder").html('');
    for (var i = 0; i < responseData.results.length; i++) {
        var stageNo = responseData.results[i].StageNo;
        var erdat = changeDate(responseData.results[i].Erdat);
        $("#rejectOrder").append('<li onClick="displayDetailData(this)" data-StageNo=' + stageNo + '><a><div class="col-xs-6"><span class="num">' + stageNo + '</span><span class="num">No of Items:' + responseData.results[i].NavStaging.results.length + '</span></div><div class="col-xs-6 text-right"><span class="qty">' + responseData.results[i].Netwr + '</span><span class="mat">' + erdat + '</span></div><div class="clearfix"></div></a></li>');
    }
    $(".loader").hide();
}

function changeDate(erdat) {
    var date = new Date(erdat.substring(erdat.indexOf("(") + 1, erdat.indexOf(')')) - 0);
    var month = date.getMonth() + 1;
    month = (month.toString().length < 2) ? "0" + month.toString() : month.toString();

    var day = date.getDate();

    day = (day.toString().length < 2) ? "0" + day.toString() : day.toString();


    return day + "/" + month + "/" + date.getFullYear();

}




function displayDetailData(datas) {
    //	alert("JHi");

    var stageNo = datas.dataset.stageno;
    $(".pendingOrderModal").modal('show');
    $(".pendingOrderModal table tbody").html('');

    var oHeaders = {};
    oHeaders['Authorization'] = "Basic " + btoa("web_mobility:welcome@2");
    var request = {
        headers: oHeaders,
        requestUri: url,
        method: "GET",
    };
    OData.request(request, function(data) {
        // alert("success"+data);
        responseData = data;
        eval(cback);
    }, function(data) {
//        alert("fail" + data.MESSAGE);
    	
    	$('.alertModal').modal('show');
        $('.alertModal .alert').removeClass('alert-success').addClass('alert-danger');
        $('.alertModal .alert').html("Error In  Network ");
        
    });
    for (var i = 0; i < responseData.results.length; i++) {
        $("#comments").html();
        if (responseData.results[i].StageNo == stageNo) {

            for (var j = 0; j < responseData.results[i].NavStaging.results.length; j++) {
                $(".pendingOrderModal table tbody").append("<tr>");
                $(".pendingOrderModal table tbody").append("<td>" + responseData.results[i].NavStaging.results[j].Matnr + "</td>");
                $(".pendingOrderModal table tbody").append("<td>" + responseData.results[i].NavStaging.results[j].Zmeng + "</td>");
                $(".pendingOrderModal table tbody").append("<td>" + responseData.results[i].NavStaging.results[j].AMENG + "</td>");
                $(".pendingOrderModal table tbody").append("<td>" + responseData.results[i].NavStaging.results[j].Zieme + "</td>");
                $(".pendingOrderModal table tbody").append("<td>" + responseData.results[i].NavStaging.results[j].NETPR + "</td>");
                $(".pendingOrderModal table tbody").append("<td>" + responseData.results[i].NavStaging.results[j].Netwr + "</td>");
                $(".pendingOrderModal table tbody").append("</tr>");
            }
            if (responseData.results[i].Status.length > 0) {
                $("#comments").html("<b> Comments : " + responseData.results[i].Status);
            }
        }
    }

}

function billingPage() {
    $("#billing").html('');
    for (var i = 0; i < responseData.results.length; i++) {
        var erdat = changeDate(responseData.results[i].Fkdat);
        $("#billing").append('<li onClick="billingSubPage(this)" data-vbeln=' + responseData.results[i].Vbeln + '><a><div class="col-xs-6"><span class="num">' + responseData.results[i].Vbeln + '</span><span class="num">PO No.' + responseData.results[i].BstnkVf + '</span></div><div class="col-xs-6 text-right"><span class="qty">' + responseData.results[i].Netwr + '</span><span class="mat">' + erdat + '</span></div><div class="clearfix"></div></a></li>');
    }
    $(".loader").hide();
}

function billingSubPage(datas) {
    var vbeln = datas.dataset.vbeln;
    $(".pendingOrderModal").modal('show');
    $(".pendingOrderModal table tbody").html('');
   
//    var urll = "http://qaapps.mahindra.com/sap/opu/odata/sap/ZGW_DAIRY_SRV/es_billing_head(Vbeln='" + vbeln + "')/billHeadItem_nav"
    	 var urll = " http://mcvladsf1.corp.mahindra.com:8000/sap/opu/odata/sap/ZGW_DAIRY_SRV/es_billing_head(Vbeln='" + vbeln + "')/billHeadItem_nav"
    	var oHeaders = {};
    oHeaders['Authorization'] = "Basic " + btoa("web_mobility:welcome@2");
    var request = {
        headers: oHeaders,
        requestUri: urll,
        method: "GET",
    };
    OData.request(request, function(data) {
        for (var i = 0; i < data.results.length; i++) {
            $(".pendingOrderModal table tbody").append("<tr>");
            $(".pendingOrderModal table tbody").append("<td>" + data.results[i].Matnr + "</td>");
            $(".pendingOrderModal table tbody").append("<td>" + data.results[i].Fkimg + "</td>");
            $(".pendingOrderModal table tbody").append("<td>" + data.results[i].Vrkme + "</td>");
            $(".pendingOrderModal table tbody").append("<td>" + data.results[i].Netwr + "</td>");
            $(".pendingOrderModal table tbody").append("</tr>");
        }
    }, function(data) {
//        alert("fail" + data.MESSAGE);
    	$('.alertModal').modal('show');
        $('.alertModal .alert').removeClass('alert-success').addClass('alert-danger');
        $('.alertModal .alert').html("Error In  Network ");
    });
}

function creditDetail() {
    $("#credit_id").html('');
    var Creditlimit = responseData.Creditlimit;
    $("#credit_id").html(Creditlimit);
    $("#pending_id").html(getPendingLimit);
    $("#pending_available_id").html(Creditlimit - getPendingLimit);
    $(".loader").hide();
}

function getPendingCreditLimit() {

    $.ajax({
        type: "GET",
        url: "http://mapps.mahindra.com:8580/dairy/DataController",
        data: {
            userOpr: 'PENDINGAMOUNT',
        },
        success: function(data, req, res) {
            getPendingLimit = data.substring(data.indexOf(":'") + 2, data.lastIndexOf("'}")) - 0;
        },
        error: function(oError) {}
    });

}

function creditDetail1() {
    var Creditlimit = responseData.Creditlimit - getPendingLimit; 
    Creditlimit = (Creditlimit<0)?(-1*Creditlimit):Creditlimit;
    console.log(">>" + responseData.Creditlimit + ">" + getPendingLimit);
    $("#limit").text(Creditlimit);
}