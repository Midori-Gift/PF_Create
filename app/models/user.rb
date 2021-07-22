# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  has_many :greats, dependent: :destroy

  # いいねとコメントのアソシエーション

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorited_greats, through: :favorites, source: :great

  # フォロー機能のアソシエーション

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships
  
  # 退会済みユーザーではないかの判定

  def active_for_authentication?
    super && (is_delete == false)
  end
  
  # フォロー機能の定義
  
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
