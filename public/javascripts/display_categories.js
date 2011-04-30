$(function(){

    $('#how_to_new_category, #question_new_category').live('focus', function(event){
            $('div#instructions').hide();
            $('div#categories').fadeIn();
   });

    $('#how_to_new_category, #question_new_category').live('blur', function(event){
            $('div#categories').hide();
            $('div#instructions').fadeIn();
   });
})
