/* Read a file  using xmlhttprequest  */

function loadXMLDoc(dname) {
	if(window.XMLHttpRequest) {
		xhttp=new XMLHttpRequest();
	} else {
		xhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xhttp.open("GET",dname,false);
	xhttp.send();
	return xhttp.responseXML;
} 

$(document).ready(function(){
	var prevodi = loadXMLDoc("xml/translations.xml");
	var jezik = "slovenian";
	
	$(".sloTran").click(function() {
		jezik = "slovenian";
		prevedi();
	});
	
	$(".engTran").click(function() {
		jezik = "english";
		prevedi();
	});
	
	function prevedi() {
	    $(prevodi).find("translation").each(function(){
        	var id = $(this).attr("id");
            var text = $(this).find(jezik).text();
            $("#"+id).attr("value",text);
            $("#"+id).attr("placeholder",text);
            $("#"+id).text(text);
        });
        $("#searchfield").val("").focus().blur();
	}
});