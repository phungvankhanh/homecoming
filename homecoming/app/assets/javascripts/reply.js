

var $buttons = $('.fa .fa-reply');
var Remove =function(){
    console.log('remove');
}

var Reply =function(button){
    $id = jQuery(button).attr('id');
    $reply = $("#reply_".concat($id));
    console.log($reply);
    $reply.removeAttr('style');
}


$(document).ready(function() {

});