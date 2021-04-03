class Order < ApplicationRecord
    has_many :order_items
    has_many :products, through: :order_items
    belongs_to :customer
    belongs_to :organization
    accepts_nested_attributes_for :order_items 
 

    def customer_name=(name)
        cust = Customer.find_or_create_by name: name
        self.customer = cust if cust
    end

    def customer_name 
        self.customer.name if self.customer
    end


end


#     t.string "sales_order_id"
#     t.string "purchase_order_id"
#     t.datetime "received_on"
#     t.datetime "due_by"
#     t.string "status"
#     t.integer "priority"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.integer "customer_id"