class CreateProductOptionSelects < ActiveRecord::Migration[6.0]
  def change
    create_table :product_option_selects do |t|
      t.string :selected_text

      t.integer :selected_id

      t.references :product_option, foreign_key: true
      t.references :origin

      t.timestamps
    end
  end
end
