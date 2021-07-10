class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def active_for_authentication?
           super && (self.is_delete == false)
         end

         attachment :profile_image

        has_many :greats, dependent: :destroy
        has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
        has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

         has_many :follower_user, through: :followed, source: :follower, dependent: :destroy
         has_many :following_user, through: :follower, source: :followed, dependent: :destroy
end
