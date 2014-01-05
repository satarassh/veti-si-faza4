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

	$('.logout').click(function() {
		$.get("logout.php");
		alert("Odjava uspešna");
		window.location.reload();
   		return false;
    });
});