require 'faker'

User.destroy_all

10.times do |row|  
  User.create!(nickname: Faker::GameOfThrones.character,
                email: Faker::Internet.email,
                      password: '123456',
                      picture_path: Faker::Avatar.image)
end
p "Created #{User.count} users"

