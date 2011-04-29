$(function() {
        $( "#screenshot_thumbnail img").live("click", function(){
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
        $("a.textile_link").click(function(){
            window.open(this.href);
            return false;
        })
    });