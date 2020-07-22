class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.references :products

      t.timestamps
    end
  end
end
