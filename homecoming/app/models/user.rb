class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :reviews, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :groups, inverse_of: :owner, dependent: :destroy
    has_and_belongs_to_many :joining_groups, class_name: :Group, foreign_key: :user_id, association_foreign_key: :group_id
    has_many :messages, dependent: :destroy

    validates :email, presence: true, uniqueness: true
    # validates :nickname, presence: true
    # validates :password, presence: true
end
