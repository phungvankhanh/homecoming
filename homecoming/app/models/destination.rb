class Destination < ApplicationRecord
    has_many :reviews, dependent: :destroy

    validates :name, presence: true
    validates :address, presence: true
end
