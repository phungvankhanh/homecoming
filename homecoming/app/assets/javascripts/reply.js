

var $buttons = $('.fa .fa-reply');
var Remove =function(){
    console.log('remove');
}

var Reply =function(button){
    console.log(jQuery(button).parent('.comment'));
    $parent = jQuery(button).parent('.row .comment');
    $reply = $parent.children('.part_reply');
    
    $reply.removeAttr('style');
}


$(document).ready(function() {

});