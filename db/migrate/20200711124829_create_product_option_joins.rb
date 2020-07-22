class CreateProductOptionJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :product_option_joins do |t|
      t.references :products

      t.references :product_options

      t.timestamps
    end
  end
end
