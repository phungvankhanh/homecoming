class Group < ApplicationRecord
    belongs_to :owner, class_name: :User, foreign_key: :owner_id
    has_and_belongs_to_many :members, class_name: :User, foreign_key: :group_id, association_foreign_key: :user_id
    belongs_to :destination
end
