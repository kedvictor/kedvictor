
$(document).ready(function(){ 

  $('body').mousemove(function(e){      
      $('#cursor').css({left:e.pageX+1,top:e.pageY+1});
  }); 

  $("#fs_mouse_area").click(function() {  
    $("#fs_mouse_area").css("background", 'rgb('+Math.floor(Math.random()*255)+','+Math.floor(Math.random()*255)+','+Math.floor(Math.random()*255)+')');
  });

});
