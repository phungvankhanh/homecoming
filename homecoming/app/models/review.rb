class Review < ApplicationRecord
    belongs_to :user
    belongs_to :destination
    has_many :comments, dependent: :destroy

    validates :title, presence: true
    validates :rating, presence: true
    validates :content, presence: true
    validates :user, presence: true
    validates :destination, presence: true
end
