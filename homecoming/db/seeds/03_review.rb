require 'faker'

Review.destroy_all 
100.times do   
  Review.create!(title: Faker::Lorem.sentence,
                rating: rand(0..5),
                content: Faker::Lorem.paragraph,
                user: User.all.sample,
                destination: Destination.all.sample)
end
p "Created #{Review.count} reviews"

