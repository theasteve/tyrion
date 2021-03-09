class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.jsonb :field_values
      t.integer :views, default: 0
      t.integer :likes, default: 0


      t.timestamps
    end
  end
end
