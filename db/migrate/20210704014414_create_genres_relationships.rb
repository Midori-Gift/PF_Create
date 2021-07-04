class CreateGenresRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :genres_relationships do |t|
      t.integer :grateman_id, null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
