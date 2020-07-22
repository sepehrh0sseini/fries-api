class CreateProductOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_options do |t|
      t.string :name
      t.string :desc

      t.integer :type

      t.references :parent, foreign_key: {to_table: :product_options}

      t.timestamps
    end
  end
end
