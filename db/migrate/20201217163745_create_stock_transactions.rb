class CreateStockTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_transactions do |t|
      t.boolean :following
      t.boolean :holding
      t.boolean :buying
      t.boolean :selling
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
