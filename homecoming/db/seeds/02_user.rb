require 'faker'

User.destroy_all

10.times do |row|
  User.create!(nickname: Faker::GameOfThrones.character,
                email: Faker::Internet.email,
                      password: '123456',
                      picture_path: Faker::Avatar.image,
                      admin: false)
end
p "Created #{User.count} users"

User.create!(nickname: Faker::GameOfThrones.character,
                email: "admin@homecoming.com",
                      password: '123456',
                      picture_path: Faker::Avatar.image,
                      admin: true)
p "Created admin with email: admin@homecoming.com, pass: 123456"
