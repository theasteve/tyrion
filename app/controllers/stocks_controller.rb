class StocksController < ApplicationController
  def index
    stocks = Stock.all
    render json: StockSerializer.new(stocks).serializable_hash, status: 200
  end

  def show
    stock = Stock.find(params[:id])

    render json: StockSerializer.new(stock).serializable_hash, status: 200
  end

  # def create
  #   stock = Stock.new(stock_params)
  #
  #   if stock.save
  #     render json: StockSerializer.new(stock).serializable_hash, status: 201
  #   else
  #     render json: stock.errors.details
  #   end
  # end

  # def update
  #   stock = Stock.find(params[:id])
  #
  #   if stock.update(stock_params)
  #     render json: StockSerializer.new(stock).serializable_hash, status: 200
  #   else
  #     render json: stock.errors.details
  #   end
  # end

  def destroy
    stock = Stock.find(params[:id])
    stock.destroy

    head :no_content
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
