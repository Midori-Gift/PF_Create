class CreateTagRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_relationships do |t|
      t.references :great
      t.references :tag

      t.timestamps
    end
      add_index :tag_relationships, [:great_id, :tag_id],unique: true
  end
end
