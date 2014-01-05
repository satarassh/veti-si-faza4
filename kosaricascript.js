$(document).ready(function(){
	$( "#accordion" ).accordion();
	$(".inbast").click(function() {
		var firstPar = $(this).parent().parent();
		var chld = $(this).closest('.basketd').children('.leftDiv');
		var str;
		chld.each(function(i, current){
            str = $(current).text();
        });
        
		var r = confirm("Želite odstraniti izdelek"+ str +"iz košarice?");
		if (r == true) {
			firstPar.animate({height: '0'}, 400, function(){
			    firstPar.hide();
			});
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