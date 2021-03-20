class CategoriesController < ApplicationController
  def index
    stock = Stock.find(params[:stock_id])
    categories = stock.categories
    items = Item.five_per_category.where(category: categories)
    ActiveRecord::Associations::Preloader.new.preload(categories, :items, items)

    render json: CategorySerializer.new(categories).serializable_hash, status: 200
  end

  def show
  end

  def create
  end

  def delete
  end
end
