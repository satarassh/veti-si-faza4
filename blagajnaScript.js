$(document).ready(function(){
	$("#strdiv").hide();
	$("#posdiv").hide();
	$("#coudiv").hide();
	$("#cardiv").hide();
	$("#yeadiv").hide();
	$("#mondiv").hide();
	$( "#accordion" ).accordion();
	$("#checkaddress").click(function() {
		if( !$(this).is(':checked') ) {
			/*$(this).after("<div class=\"line\"><label for=\"country\">Dr&#382;ava: </label><input class=\"inputStilr\" type=\"text\" id=\"country\"/></div>");
			$(this).after("<div class=\"line\"><label for=\"post\">Po&#353;ta: </label><input class=\"inputStilr\" type=\"text\" id=\"post\"/></div>");
	        $(this).after("<div class=\"line\"><label for=\"street\">Ulica: </label><input class=\"inputStilr\" type=\"text\" id=\"street\" /></div>");
	        */
	       	$("#strdiv").slideDown("slow", function() {});
	        $("#posdiv").slideDown("slow", function() {});
	        $("#coudiv").slideDown("slow", function() {});
		} else {
			$("#strdiv").slideUp("slow", function() {});
	        $("#posdiv").slideUp("slow", function() {});
	        $("#coudiv").slideUp("slow", function() {});
		}
	});
	
	$("#placilo").change(function(){
		if($("#placilo :selected").text() == "Kreditna kartica") {
			$("#cardiv").slideDown("slow", function() {});
	        $("#yeadiv").slideDown("slow", function() {});
	        $("#mondiv").slideDown("slow", function() {});
		} else {
			$("#cardiv").slideUp("slow", function() {});
	        $("#yeadiv").slideUp("slow", function() {});
	        $("#mondiv").slideUp("slow", function() {});
		}
	});
	
	$(".homeLogo").hover(
		function() {
			$(this).attr("src","img/logohomehover.png");
		},
		
		function() {
			$(this).attr("src","img/logohome.png");
		}
	);

	
	$('.logout').click(function() {
		$.get("logout.php");
		alert("Odjava uspešna");
		window.location.reload();
   		return false;
    });
});