class CreateGratemen < ActiveRecord::Migration[5.2]
  def change
    create_table :gratemen do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :topic, null: false
      t.string :recommend, null: false
      t.string :image_id, null: false
      t.string :head, null: false
      t.string :word, null: false

      t.timestamps
    end
  end
end
