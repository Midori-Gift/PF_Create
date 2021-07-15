# frozen_string_literal: true

class Great < ApplicationRecord
  belongs_to :user
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :great_image

  # def save_tags(savegreat_tags)
  #   savegreat_tags.each do |new_name|
  #     great_tag = Tag.find_or_create_by(name: new_name)
  #     self.tags << great_tag
  #   end
  # end

  def save_tags(savegreat_tags)
    current_tags = tags.pluck(:name) unless tags.nil?
    old_tags = current_tags - savegreat_tags
    new_tags = savegreat_tags - current_tags

    old_tags.each do |old_name|
      tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      great_tag = Tag.find_or_create_by!(name: new_name)
      tags << great_tag
    end
  
    def self.search(search)
    return Great.all() unless search
    Great.where('name LIKE(?)', "%#{search}%")
  end  
  
  end
end
