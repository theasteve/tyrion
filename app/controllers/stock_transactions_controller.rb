class StockTransactionsController < ApplicationController
  def index
    stock_transaction = StockTransaction.where(
      user_id: params[:user_id],
      stock_id: params[:stock_id]
    )

    if stock_transaction.empty?
      create_stock_transaction(params['stock_field'],
                               params['user_id'],
                               params['stock_id'])
      render json: StockTransactionSerializer.new(stock_transaction).serializable_hash, status: 200
    else
      update_stock_transaction_field(params['stock_field'], stock_transaction)
      update_stock(params['stock_field'], params['user_id'], stock_transaction)
      render json: StockTransactionSerializer.new(stock_transaction).serializable_hash, status: 200
    end
  end

  private

  def stock_transaction_params
    params.require(:data).require(:attributes).permit(
      :track,
      :following,
      :holding,
      :buying,
      :selling,
      :user_id,
      :stock_id
    )
  end

  def create_stock_transaction(field, user_id, stock_id)
    stock_transaction = StockTransaction.new({
      user_id: user_id,
      stock_id: stock_id
    })
    stock_transaction.track = true
    update_stock_transaction_field(field, stock_transaction)
    update_stock(field, stock_id, stock_transaction)
  end

  def update_stock_transaction_field(field, stock_transaction)
    st = stock_transaction
    st[field] = st[field] == true ?  false : true
  end

  def update_stock(field, stock_id, stock_transaction)
    stock = Stock.find(stock_id)
    if stock_transaction[field] == true
      stock[field] = stock[field] += 1
    else
      stock[field] = stock[field] -= 1
    end
    stock.save
  end
end
