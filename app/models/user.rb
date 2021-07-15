# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (is_delete == false)
  end

  attachment :profile_image
  has_many :greats, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorited_greats, through: :favorites, source: :great

  # has_many :followed, class_name: "Relationship", foreign_key: "followed_id"
  # has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  # has_many :follower_user, through: :followed, source: :follower, dependent: :destroy
  # has_many :following_user, through: :follower, source: :followed, dependent: :destroy

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships

  def following?(user)
    followings.include?(user)
  end

  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy!
  end
end
