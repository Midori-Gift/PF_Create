# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :tag_relationships, dependent: :destroy, foreign_key: 'tag_id'
  has_many :great, through: :tag_relationships, dependent: :destroy
  # validates :name, uniqueness: true, length: {maximum: 20}
  
end
