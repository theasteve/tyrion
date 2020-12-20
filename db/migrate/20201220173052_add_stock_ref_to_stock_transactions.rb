class AddStockRefToStockTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :stock_transactions, :stock, null: false, foreign_key: true
  end
end
