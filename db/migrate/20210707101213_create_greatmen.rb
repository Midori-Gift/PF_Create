class CreateGreatmen < ActiveRecord::Migration[5.2]
  def change
    create_table :greatmen do |t|
      t.integer :user_id
      t.integer :tag_id
      t.string :name
      t.text :topic
      t.string :recommend
      t.string :image_id
      t.string :head
      t.string :word

      t.timestamps
    end
  end
end
