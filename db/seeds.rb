# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category
categories = [[:Pizza], [:Sandwich], [:Appetizer], [:Drink]]
category_columns = [:name]

Category.import category_columns, categories

pizza_category = Category.find_by(name: 'Pizza')


# Products
ingredients = 'Dough, Cheese, Flour, Tomato Sauce'
description = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta est nostrum veritatis velit fugit, minus aliquam illo! Deleniti, eum, ipsum. Nisi explicabo odit cupiditate et modi reprehenderit illum laudantium vero.'

product_columns = %i[name price ingredients description]

pizzas = [['Cheese Pizza', 10.50], ['Veggie Pizza', 15], ['Pepperoni Pizza', 12], ['Meat Pizza', 13], ['Margherita Pizza', 16], ['BBQ Chicken Pizza', 11], ['Hawaiian Pizza', 12], ['Buffalo Pizza', 15]].map do |pizza|
  pizza.push ingredients, description
end

Product.import product_columns, pizzas


product_category_columns = [:product_id, :category_id]

product_categories = Product.all.map do |product|
    [product.id, pizza_category.id]
end

ProductCategory.import product_category_columns, product_categories
