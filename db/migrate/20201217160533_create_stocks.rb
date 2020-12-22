class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.integer :following, default: 0
      t.integer :holding, default: 0
      t.integer :buying, default: 0
      t.integer :selling, default: 0

      t.timestamps
    end
  end
end
