class Destination < ApplicationRecord
    has_many :reviews, dependent: :destroy

    validates :name, presence: true
    validates :address, presence: true
    mount_uploader :image, ImageUploader
    after_save :update_path

    def self.filter(rate)
        joins(:reviews).having('round(avg(rating)) in (?)', rate).group(:id).order('destinations.created_at DESC')
    end

    private
        def update_path
            if (self.image != nil)
                self.update_column('picture_path',self.image.url)
            end
        end
end
