class AddStateToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :state, :boolean
  end
end
