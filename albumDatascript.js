$(document).ready(function(){
	$( "#accordion" ).accordion();
	
	$(".homeLogo").hover(
		function() {
			$(this).attr("src","img/logohomehover.png");
		},
		
		function() {
			$(this).attr("src","img/logohome.png");
		}
	);
});