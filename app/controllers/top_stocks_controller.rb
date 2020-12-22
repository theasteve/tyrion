class TopStocksController < ApplicationController
  def index
    sql_top_stocks = ("
      SELECT s.id, s.name, s.ticker, COUNT(w.track) as tracked_stocks
      FROM stocks s LEFT JOIN stock_transactions w ON s.id = w.stock_id
      GROUP BY
      s.id, s.name, s.ticker
      ORDER BY tracked_stocks DESC LIMIT 10;
    ")

    db_stocks = ActiveRecord::Base.connection.execute(sql_top_stocks)
    top_stocks = []
    db_stocks.each { |record| top_stocks << Stock.find(record['id']) }

    render json: StockSerializer.new(top_stocks).serializable_hash, status: 200
  end
end
