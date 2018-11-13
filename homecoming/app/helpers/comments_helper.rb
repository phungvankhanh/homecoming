module CommentsHelper
  def comments_tree_for comments, post
      safe_join(comments.map do |comment, nested_comments|
                  print(comment)
                  print(nested_comments)
                  render(comment, review: post, comment_new: Comment.new) + tree(comment, nested_comments, post)
                end
      )
  end
  def tree comment, nested_comments, post
    if nested_comments.empty?
      render :partial => 'comments/replies_for', :locals => {:comment_id => comment.id }
    else
      content_tag :div, comments_tree_for(nested_comments, post), class: "replies", id: ("replies-for-" + comment.id.to_s)
    end
  end
end
