$(function() {  
  $("#navigation li a").click(function(){  
    $("a.selected").removeClass("selected");
    $(this).addClass("selected");
  });  
});


