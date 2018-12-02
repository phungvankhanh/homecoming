class CreateGroupsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :groups_users do |t|
      t.references :group
      t.references :user
    end
  end
end
