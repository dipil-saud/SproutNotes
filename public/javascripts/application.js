$(function() {
        // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
        //$( "#dialog:ui-dialog" ).dialog( "destroy" );
        $( "#screenshot_thumbnail").live("click", function(){
            $( "#screenshot" ).dialog({
                modal: true,
                height: "auto",
                width: "auto",
                buttons: {
                                Close: function() {
                                    $( this ).dialog( "close" );
                                }
                            }
            });
        });
    });