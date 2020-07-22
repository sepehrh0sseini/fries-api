class ProductsController < ApplicationController
  def index
    render json: Product.includes(:categories).all
  end
end
