class AddCommentIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :comment, index: true
  end
end
