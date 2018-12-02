var open_edit_comment = function(tag) {
    console.log(tag.dataset.commentId);
    var id = "#comment-edit-container-" + tag.dataset.commentId;
    console.log(id);
    $(id).css("display", "block");
}