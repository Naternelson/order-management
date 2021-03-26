class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.sales_order_id :string
      t.purchase_order_id :string 
      t.received_on :date 
      t.due_by :date 
      
      t.timestamps
    end
  end
end
