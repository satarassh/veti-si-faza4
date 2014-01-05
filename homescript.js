$(document).ready(function() {
	var prevodi = loadXMLDoc("xml/translations.xml");
	var jezik = "slovenian";
	$("#frontdiv").hide();

	$("#frontdiv").click(function() {
		$("#frontdiv").fadeOut("slow");
	});
	
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
	
	$(".homeLogo").hover(
		function() {
			$(this).attr("src","img/logohomehover.png");
		},
		
		function() {
			$(this).attr("src","img/logohome.png");
		}
	);

	function InitializeMap() {
	    var latlng = new google.maps.LatLng(-34.397, 150.644);
	    var myOptions = {
	        zoom: 8,
	        center: latlng,
	        mapTypeId: google.maps.MapTypeId.ROADMAP
	    };
	    var map = new google.maps.Map(document.getElementById("locdiv"), myOptions);
	}
	

	$("#showloc").click(function () {
	    InitializeMap;
	});
	
	$(".znotrajOkna").click(function() {
		var id = $(this).closest("div").attr("id");
	});
    
	$('.logout').click(function() {
	    $.ajax({
	        type: "POST",
            url: "logout()",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: true,
            cache: false,
            success: function (msg) {
                alert(msg);
            }
	    })
        return false;
    });

	$('.stolpec').click(function() {
		var id = $(this).attr("id");
		var last = id[id.length-1];
		$.get("addToBasket.php",{id:last},function(data){
		    $("#frontdiv").html(data);
		    $("#frontdiv").fadeIn("slow");
		});
   		return false;
    });
	
	$( "#accordion" ).accordion();
	
	var canvas = document.getElementById('myCanvas');
	var context = canvas.getContext('2d');
	context.font="18px Arial";
	context.fillStyle = '#00ADE9';
	context.fillText("Novi telefoni v ponudbi",10,290);
	
	var iphone = new Image();
	iphone.onload = function() {
		context.drawImage(iphone, 20, 300);
	};
	iphone.src = 'img/iphone.jpg';
	
	var y=1;
	var smer = new Boolean();
	smer = true;
	
	function animateCanvas() {
	    var imageObj = new Image();
	    imageObj.onload = function() {
	    	context.drawImage(imageObj, 10, y);
	    };
	    imageObj.src = 'img/telekom.jpg';
	    
	    if(smer) y++;
	    else y--;
	    
	    if(y==0) smer = !smer;
	    if(y==150) smer = !smer;
	}
	
	var myTimer=setInterval(animateCanvas,20);
});

/*

git add .
git branch production
git commit -m "new commit"
git push heroku production:master
 
*/