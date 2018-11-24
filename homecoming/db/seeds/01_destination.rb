require 'faker'
require 'csv' 

Destination.destroy_all

CSV.foreach(File.join(Rails.root, 'db', 'seeds', 'convertcsv.csv'), :headers => true,:encoding => 'utf-8',skip_blanks: true) do |row|  
  destination= Destination.create!(name: row[0],
                      address: row[1],
                      speciality: Faker::Food.dish,
                      picture_path: row[2],
                      state: true)
  if(row[3]!=nil)
    row[3].split('-').each do |category|
      DestinationCategory.create!(destination_id: destination.id,
                                category_id: category)
    end
  else 
    DestinationCategory.create!(destination_id: destination.id,
                                category_id: 5)
  end
end
p "Created #{Destination.count} movies"

