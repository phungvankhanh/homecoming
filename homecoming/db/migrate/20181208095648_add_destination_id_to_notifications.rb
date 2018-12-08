class AddDestinationIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :destination_id, :bigint
  end
end
