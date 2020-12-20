class CreateStockTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_transactions do |t|
      t.boolean :following
      t.boolean :holding
      t.boolean :buying
      t.boolean :selling

      t.timestamps
    end
  end
end
