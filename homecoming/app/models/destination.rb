class Destination < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :destination_category, dependent: :destroy
    has_many :category, through: :destination_category

    validates :name, presence: true
    validates :address, presence: true
    mount_uploader :image, ImageUploader
    after_save :update_path

    def self.filter(rate,category,search)
        if(!search.blank?)
            all.where("lower(name) LIKE :search or lower(address) LIKE :search", search: "%#{@search}%").joins(:destination_category).where('category_id in (?)',category).joins(:reviews).having('round(avg(rating)) in (?)', rate).group(:id).order('destinations.created_at DESC')
        else
            joins(:destination_category).where('category_id in (?)',category).joins(:reviews).having('round(avg(rating)) in (?)', rate).group(:id).order('destinations.created_at DESC')
        end

    end

    private
        def update_path
            if (!self.image.blank?)
                self.update_column('picture_path',self.image.url)
            end
        end
end
