class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :review
    has_many :children, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy, inverse_of: 'parent'
    belongs_to :parent, class_name: 'Comment', optional: true

    validates :content, presence: true
    validates :user, presence: true
    validates :review, presence: true

    acts_as_tree order: "created_at ASC"

    after_create_commit { notify }

    private
    def notify
        review = Review.find_by(id: self.review_id)
        destination = Destination.find_by(id: review.destination_id)
        Notification.create(event: "New comment review on post (#{destination.name})", comment_id: self.id, review_id: self.review_id, destination_id: review.destination_id)
    end
end
