class CategoriesController < ApplicationController
  def index
    stock = Stock.find(params[:stock_id])
    categories = stock.categories
    render json: CategorySerializer.new(categories, include: ['items', 'user']).serializable_hash, status: 200
  end

  def show
  end

  def create
  end
end
