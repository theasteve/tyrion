class StockTransactionsController < ApplicationController
  def index
    stock_transactions = StockTransaction.all
    render json: StockTransactionSerializer.new(stock_transactions).serializable_hash, status: 200
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

end
