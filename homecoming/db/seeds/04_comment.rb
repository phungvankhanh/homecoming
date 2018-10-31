require 'faker'

Comment.destroy_all 
Review.all.each do |review|  
    Comment.create!(review_id: review.id,
                    user_id: User.all.sample.id,
                    parent_id:0,
                    content: Faker::Lorem.paragraph)

end
100.times do 
    id = Review.all.sample.id
    Comment.create!(review_id: id ,
                    user_id: User.all.sample.id,
                    parent_id: Review.find(id).comments.all.sample.id,
                    content: Faker::Lorem.paragraph)

end

p "Created #{Comment.count} comment"

