
$(document).ready(function(){ 

  $("#anniversary").mousemove(function(event) {
    var relX = event.pageX - $(this).offset().left;
    var relY = event.pageY - $(this).offset().top;    
    $("p.mouse_coords").html('Mouse position: ' + relX + ' ' + relY);  
  });

  $("#anniversary").click(function(event) {
    var relX = event.pageX - $(this).offset().left;
    var relY = event.pageY - $(this).offset().top;    
    $(".contour_coords").val($(".contour_coords").val() + relX + ',' + relY + ',');  
  });



});
