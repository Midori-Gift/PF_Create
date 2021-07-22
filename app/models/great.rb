# frozen_string_literal: true

class Great < ApplicationRecord
  belongs_to :user
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  attachment :great_image

  # 投稿時のバリデーション一覧

  with_options presence: {message: "空欄が存在します。"} do
    validates :name, uniqueness: {message: "すでに投稿のある名前です。"}, length: {maximum: 20, message: "名前は20字以内です"}
    validates :head,length: { maximum: 40, message: "見出しは40字以内です。"}
    validates :word, length: { maximum: 40, message: "名言は40字以内です。" }
    validates :topic
    validates :recommend, length: { maximum: 40, message: "おすすめは40字以内です" }
  end

  # validates :tag_id, presence: true, length: { minimum: 1, maximum: 20 }

  # 以下いいね機能・タグの保存・検索機能用の定義

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

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
  end

  def self.search(search)
    return Great.all unless search

    Great.where('name LIKE(?)', "%#{search}%")
  end
end
