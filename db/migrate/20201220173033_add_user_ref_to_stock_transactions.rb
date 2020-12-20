class AddUserRefToStockTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :stock_transactions, :user, null: false, foreign_key: true
  end
end
