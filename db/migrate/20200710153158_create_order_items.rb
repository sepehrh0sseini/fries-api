class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :orders

      t.references :product

      t.timestamps
    end
  end
end
