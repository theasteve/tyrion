class StocksController < ApplicationController
  def index
    stocks = Stock.all
    render json: StockSerializer.new(stocks).serializable_hash, status: 200
  end

  def show
    stock = Stock.find(params[:id])
    render json: StockSerializer.new(stock).serializable_hash, status: 200
  end

  private

  def stock_params
    params.require(:data).require(:attributes).permit(
      :ticker,
      :name,
      :price
    )
  end
end
