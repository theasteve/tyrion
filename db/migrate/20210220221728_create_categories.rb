class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :stock, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.jsonb :fields
      t.integer :views, default: 0
      t.integer :likes, default: 0

      t.timestamps
    end
  end
end
