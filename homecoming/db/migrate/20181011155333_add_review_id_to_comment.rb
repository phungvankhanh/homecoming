class AddReviewIdToComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :review, index: true
  end
end
