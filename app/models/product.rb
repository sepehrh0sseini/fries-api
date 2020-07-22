class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :product_option_joins
  has_many :product_option, through: :product_options_joins
end
