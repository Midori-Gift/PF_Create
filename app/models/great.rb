class Great < ApplicationRecord
  belongs_to :user
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

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
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savegreat_tags
    new_tags = savegreat_tags - current_tags

    old_tags.each do |old_name|
     self.tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      great_tag = Tag.find_or_create_by(name: new_name)
      self.tags << great_tag
    end
  end
end

