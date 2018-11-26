class AddOwnerIdToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :owner_id, :bigint
    add_foreign_key :groups, :users, column: :owner_id
  end
end
