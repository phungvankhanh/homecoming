class Destination < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :picture_path, presence: true
end
