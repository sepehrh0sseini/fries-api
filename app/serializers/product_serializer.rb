class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :ingredients, :created_at

  has_many :categories
end
