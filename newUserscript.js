$(document).ready(function(){
	$( "#accordion" ).accordion();
	var formInputs = [];
	$(function() {
    	$( "#datepicker" ).datepicker({ 
    		dateFormat: "dd.mm.yy", 
    		changeYear: true, 
    		changeMonth: true, 
    		yearRange: "1900:2013",
    		monthNamesShort: [ "Jan", "Feb", "Mar", "Apr", "Maj", "Jun", "Jul", "Avg", "Sep", "Okt", "Nov", "Dec" ],
    		dayNamesMin: [ "pon", "tor", "sre", "čet", "pet", "sob", "ned" ]  
    	});
  	});
  	
  	$(function() {
    	$( "#tel" ).tooltip();
  	});
  	
  	$(function() {
    	$( "#addr" ).tooltip();
  	});
  	
  	$(function() {
    	$( "#post" ).tooltip();
  	});
  	
  	$(".regSubmit").submit(function(){
  		var passAlert1 = "- Geslo mora biti dolgo najmanj 8 znakov\n";
		var passAlert2 = "- Gesli se ne ujemata\n";
		var postAlert = "- Pošta mora biti v obliki: \"(številka) (kraj)\" -> \"1000 Ljubljana\"\n";
		var telAlert = "- Telefon mora biti številka, brez uporabe črk ali drugih znakov\n";
		var userAlert = "- Uporabniško ime je lahko dolgo največ 20 znakov\n";
		
		if($("#names").val().length == 0 ) {
	    	alert("Polja z oznako * so obvezna!");
	    	return;
	  	} else if($("#surname").val().length == 0 ) {
	    	alert("Polja z oznako * so obvezna!");
	    	return;
	  	} else if($("#email").val().length == 0 ) {
	    	alert("Polja z oznako * so obvezna!");
	    	return;
	  	} else if($("#username").val().length == 0 ) {
	    	alert("Polja z oznako * so obvezna!");
	    	return;
	  	} else if($("#pwd").val().length == 0 ) {
	    	alert("Polja z oznako * so obvezna!");
	    	return;
	  	} else if($("#pwdcon").val().length == 0 ) {
	    	alert("Polja z oznako * so obvezna!");
	    	return;
	  	}
	  	
	  	var alertme = "Opozorila o vnosu\n\n";
	  	
	  	var telregex = /^\d*$/;
	  	var telnum = $("#tel").val();
	  	if(!telregex.test(telnum)) {
	  		alertme = alertme.concat(telAlert);
	  	}
	  	
	  	var postregex = /^\d{3,}\s+\D+$/;
	  	var posta = $("#post").val();
	  	if(posta.length > 0 && !postregex.test(posta)) {
	  		alertme = alertme.concat(postAlert);
	  	}
	  	
	  	var userlength = $("#username").val().length;
	  	if(userlength > 20) {
	  		alertme = alertme.concat(userAlert);
	  	}
	  	
	  	var passlength = $("#pwd").val().length;
	  	if(passlength < 8) {
	  		alertme = alertme.concat(passAlert1);
	  	}
	  	
	  	if($("#pwd").val() != $("#pwdcon").val()) {
	  		alertme = alertme.concat(passAlert2);
	  	}
	  	
	  	if(alertme.length > 20) alert(alertme);
  	});
  	
  	function saveInputs() {
		formInputs.push($("#tel").val());
		formInputs.push($("#post").val());
	}
	
	function restoreInputs() {
		$("#tel").text(formInputs[0]);
		// ...
	}
  	
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