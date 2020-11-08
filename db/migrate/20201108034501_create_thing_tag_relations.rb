class CreateThingTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :thing_tag_relations do |t|
      t.references :thing, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
