# frozen_string_literal: true

class TagRelationship < ApplicationRecord
  belongs_to :great
  belongs_to :tag

  validates :great, presence: true
  validates :tag, presence: true
end
