class Order < ApplicationRecord
    has_many :order_items
    has_many :products, through: :order_items
    belongs_to :customer
    accepts_nested_attributes_for :customer
    accepts_nested_attributes_for :order_items 


    def customer_name=(name)
        cust = Customer.find_or_create_by name: name
        self.customer = cust if cust
    end

    def customer_name 
        self.customer.name if self.customer
    end
end
