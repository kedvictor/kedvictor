$(function() {  
  
  /* Catch selected item in main navigation menu */
    
  $("#navigation li a").click(function(){  
    $("a.selected").removeClass("selected");
    $(this).addClass("selected");
  }); 
  
  /* Functionality for list menu selector on sidebar */
  
  $("#menu_selector li").each(
    function(index) {
      if ( $(this).children('ul').length > 0 ) {
        $(this).addClass('sub').addClass('plus');
        $(this).children('ul').hide();
      }
    }
  );
  
  $("#menu_selector li.sub").each(function(index) {       
    $(this).click(function(event){    
      if (this == event.target) {
        if ( $(this).is('.plus') ) {         
          $(this).children('ul').show('fast'); 
          $(this).removeClass('plus');
          $(this).addClass('minus');          
        } 
        else {          
          $(this).children('ul').hide('fast'); 
          $(this).removeClass('minus');
          $(this).addClass('plus');            
        } 
      }       
    });  
  });
   
});


