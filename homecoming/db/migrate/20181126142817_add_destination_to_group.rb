class AddDestinationToGroup < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :destination
  end
end
