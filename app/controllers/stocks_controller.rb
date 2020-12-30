class StocksController < ApplicationController
  def index
    if params[:query].nil?
      sql_top_stocks = ("
        SELECT s.id, s.name, s.ticker, count(w.track) as tracked_stocks
        FROM stocks s LEFT JOIN stock_transactions w ON s.id = w.stock_id
        GROUP BY
        s.id, s.name, s.ticker
        ORDER BY tracked_stocks DESC LIMIT 10;
      ")

      db_stocks = ActiveRecord::Base.connection.execute(sql_top_stocks)
      stocks = db_stocks.map { |record| Stock.find(record['id']) }
    else
      stocks = Stock.search(params[:query]).limit(10)
    end
    
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
