class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :product_id
      t.integer :order_id
      t.float :amount
      t.string :amount_unit_type

      t.timestamps
    end
  end
end
