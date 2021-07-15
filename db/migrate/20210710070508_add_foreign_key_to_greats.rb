# frozen_string_literal: true

class AddForeignKeyToGreats < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :greats, :users
    add_foreign_key :greats, :tags
  end
end
