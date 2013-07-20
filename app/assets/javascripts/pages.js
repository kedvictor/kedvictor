
$(document).ready(function(){ 

  $('#mouse_area').mousemove(function(e){ 
    var relX = e.pageX - $(this).offset().left;
    var relY = e.pageY - $(this).offset().top;    
    $('#cursor').css({ left: relX + 1, top: relY + 1 });
  }); 

  $('#mouse_area').click(function() {      
    $('#mouse_area').css('background', 'rgb('+Math.floor(Math.random()*255)+','+Math.floor(Math.random()*255)+','+Math.floor(Math.random()*255)+')');
  });

});

 function goFullscreen(id) {    
    var element = document.getElementById(id);    
    if (element.mozRequestFullScreen) {     
      element.mozRequestFullScreen();
    } else if (element.webkitRequestFullScreen) {     
      element.webkitRequestFullScreen();
   }  
  };
