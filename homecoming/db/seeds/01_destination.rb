require 'faker'
require 'csv' 

Destination.destroy_all

CSV.foreach(File.join(Rails.root, 'db', 'seeds', 'convertcsv.csv'), :headers => true,:encoding => 'utf-8',skip_blanks: true) do |row|  
  Destination.create!(name: row[0],
                      address: row[1],
                      speciality: Faker::Food.dish,
                      picture_path: row[2])
end
p "Created #{Destination.count} movies"

