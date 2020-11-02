class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.datetime :date
    end
  end
end
