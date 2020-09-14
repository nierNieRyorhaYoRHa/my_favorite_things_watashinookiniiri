class CreateThings < ActiveRecord::Migration[6.0]
  def change
    create_table :things do |t|
      t.string    :name,            null: false
      t.text      :explanation,     null: false
      t.integer   :price,           null: false
      t.integer   :score,           null: false
      t.date      :date,            null: false
      t.references :user,           foreign_key: true

      t.timestamps
    end
  end
end
