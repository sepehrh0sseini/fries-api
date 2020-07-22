class ProductOption < ApplicationRecord
  enum type: %i[select checkbox radio text number]

  has_many :product_option_joins
  has_many :products, through: :product_options_joins
end
