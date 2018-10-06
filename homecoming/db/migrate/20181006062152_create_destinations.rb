class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :name
      t.text :address
      t.text :speciality
      t.string :picture_path

      t.timestamps
    end
  end
end
