$(document).ready(function(){
	 $("#panel").slideDown(2000);{
	  $("#flip").click(function(){
	    $("#panel").slideToggle('rolledup');
	  });
	 }
	});
$(document).ready(function(){
	  $("#flip1").click(function(){
	    $("#panel1").slideToggle('rolledup');
	  });
	});	
$(document).ready(function() {
    var cur = $('#panel'); //save the element that has been clicked for easy referal
    cur.siblings('tr').slideUp('rolledup'); //hide all the paragraphs
    cur.next('td').slideDown('rolledup'); //get the next paragraph after the clicked header and show it
});
/*
$(document).ready(function(){
	  $("tr:odd").css("background-color","#FFFFFF");
	});
$(document).ready(function(){
	  $("tr:even").css("background-color","#D1E0FF");
	});
*/