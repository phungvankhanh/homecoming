class AddReviewIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :review_id, :bigint
  end
end
