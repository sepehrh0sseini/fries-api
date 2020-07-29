# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

module Seed
  # Create Categories
  def self.run
    Category.delete_all
    Product.delete_all

    categories = [[:Pizza], [:Sandwich], [:Salad], [:Steak], [:Appetizer], [:Seafood], [:Beverage], [:Coffee], [:Breakfast]]
    category_columns = [:name]

    Category.import category_columns, categories

    # Update products counts on category
    Category.find_each do |category|
      create_products(category)

      Category.reset_counters(category.id, :products)
    rescue StandardError => e
      pp '----------------------', e
    end
  end

  # Create Pizzas
  @@ingredients = 'Dough, Cheese, Flour, Tomato Sauce'
  @@description = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta est nostrum veritatis velit fugit, minus aliquam illo! Deleniti, eum, ipsum. Nisi explicabo odit cupiditate et modi reprehenderit illum laudantium vero.'

  # product_columns = %i[name price ingredients description]

  # pizzas = [['Cheese Pizza', 10.50], ['Veggie Pizza', 15], ['Pepperoni Pizza', 12], ['Meat Pizza', 13], ['Margherita Pizza', 16], ['BBQ Chicken Pizza', 11], ['Hawaiian Pizza', 12], ['Buffalo Pizza', 15]].map do |pizza|
  #   pizza = Product.new(name: pizza[0], price: pizza[1], ingredients: ingredients, description: description)
  #   pizza.product_categories << ProductCategory.find_or_create_by(category_id: pizza_category.id)
  #   pizza
  # end

  # Product.import product_columns, pizzas

  def self.create_products(category)
    count = rand(10..15)

    products = Array.new(count) do |i|
      product = Product.new(name: "Product #{i}", price: rand(10..15), ingredients: @@ingredients, description: @@description)
      product.product_categories << ProductCategory.find_or_create_by(category_id: category.id)
      product
    end

    Product.import products, recursive: true
  end
end

Seed.run
