class Category < ApplicationRecord
    has_many :destination_categories, dependent: :destroy
    has_many :destination, through: :destination_category
end
