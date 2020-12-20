class CreateStockTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_transactions do |t|
      t.string :followers
      t.string :holders
      t.string :buyers
      t.string :sellers

      t.timestamps
    end
  end
end
