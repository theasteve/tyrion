class StocksController < ApplicationController
  include CurrentUserConcern

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

  def update
    return nil unless @current_user

    stock_transaction = StockTransaction.where(
      user_id: @current_user.id,
      stock_id: params[:id]
    ).last

    if stock_transaction
      update_stock_transaction(field: stock_params[:field], stock_id: params[:id], stock_transaction: stock_transaction)
    else
      create_stock_transaction(field: stock_params[:field], stock_id: params[:id])
    end

    stock = Stock.find(params[:id])
    render json: StockSerializer.new(stock).serializable_hash, status: 200
  end

  private

  def stock_params
    params.require(:data).require(:attributes).permit(
      :id, :field, :ticker, :name, :following, :holding, :selling, :buying
    )
  end

  def create_stock_transaction(field:, stock_id:)
    stock_transaction = StockTransaction.new({
      user_id: @current_user.id,
      stock_id: stock_id,
      track: true
    })
    stock_transaction[field] = true;
    stock_transaction.save

    update_stock(field: field, stock_id: stock_id, stock_transaction: stock_transaction)
  end

  def update_stock_transaction(field:, stock_id:, stock_transaction:)
    if stock_transaction[field] == true
      stock_transaction[field] = false
      update_stock(field: field, stock_id: stock_id, stock_transaction: stock_transaction)
    else
      stock_transaction[field] = true
      update_stock(field: field, stock_id: stock_id, stock_transaction: stock_transaction)
    end
    stock_transaction.save
  end

  def update_stock(field:, stock_id:, stock_transaction:)
    stock = Stock.find(stock_id)
    if stock_transaction[field] == true
      stock[field] = stock[field] += 1
    else
      stock[field] = stock[field] -= 1
    end
    stock.save
  end
end
