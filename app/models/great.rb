class Great < ApplicationRecord
  belongs_to :user
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  attachment :great_image

  def save_tags(savegreat_tags)
    savegreat_tags.each do |new_name|
      great_tag = Tag.find_or_create_by(name: new_name)
      self.tags << great_tag
    end
  end
end
