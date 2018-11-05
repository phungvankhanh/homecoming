require 'faker'
require 'csv' 

Destination.destroy_all

CSV.foreach(File.join(Rails.root, 'db', 'seeds', 'convertcsv.csv'), :headers => true,:encoding => 'utf-8',skip_blanks: true) do |row|  
  Destination.create!(name: row[0],
                      address: row[1],
                      speciality: Faker::Food.dish,
                      picture_path: 'https://media.gadventures.com/media-server/cache/fc/49/fc4918f6280bdf785e1011a488e195ce.jpg',
                      state: true)
end
p "Created #{Destination.count} movies"

