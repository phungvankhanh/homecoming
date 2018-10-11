class AddDestinationIdToReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :destination, index: true
  end
end
