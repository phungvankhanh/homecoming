

var $buttons = $('.fa .fa-reply');
var Remove =function(){
}

var Reply =function(button){
    $id = jQuery(button).attr('id');
    $reply = $("#reply_".concat($id));
    $reply.removeAttr('style');
    $reply.attr('style','width:90%');
}


$(document).ready(function() {

});