class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.integer :group_id
      t.integer :user_id
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
