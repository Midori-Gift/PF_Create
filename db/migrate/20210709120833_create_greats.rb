# frozen_string_literal: true

class CreateGreats < ActiveRecord::Migration[5.2]
  def change
    create_table :greats do |t|
      t.string :name, null: false
      t.text :topic, null: false
      t.string :recommend, null: false
      t.string :great_image_id
      t.string :head, null: false
      t.string :word, null: false
      t.boolean :is_release, default: true, null: false
      t.references :user
      t.references :tag

      t.timestamps
    end
  end
end
