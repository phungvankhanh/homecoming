class Destination < ApplicationRecord
    has_many :reviews, dependent: :destroy

    validates :name, presence: true
    validates :address, presence: true

    def self.filter(rate)
        joins(:reviews).having('round(avg(rating)) in (?)', rate).group(:id).order('destinations.created_at DESC')
    end
end
