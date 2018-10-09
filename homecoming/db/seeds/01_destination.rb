require 'faker'
require 'csv' 

Destination.destroy_all

CSV.foreach(File.join(Rails.root, 'db', 'seeds', 'convertcsv.csv'), :headers => true,:encoding => 'utf-8',skip_blanks: true) do |row|  
  Destination.create!(name: row[0],
                      address: row[1],
                      speciality: Faker::Food.dish,
                      picture_path: 'https://travel.com.vn/images/destination/Large/dg_150722_Halong-Bay-4.jpg')
end
p "Created #{Destination.count} movies"

