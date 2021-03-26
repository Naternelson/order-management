class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :sales_order_id
      t.string :purchase_order_id
      t.datetime :received_on 
      t.datetime :due_by 
      t.string :status 
      t.integer :priority

      t.timestamps
    end
  end
end
