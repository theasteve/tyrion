class CreateStockTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_transactions do |t|
      t.boolean :track, default: false
      t.boolean :following, default: false
      t.boolean :holding, default: false
      t.boolean :buying, default: false
      t.boolean :selling, default: false
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
