class ProductsController < ApplicationController
  def index
		products = Product.joins(:categories).includes(:categories)

		products = products.where(categories: { id: params[:category_ids] }) if params.key?(:category_ids)

    render json: products
  end
end
