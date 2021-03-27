class Order < ApplicationRecord
    has_many :order_items
    has_many :products, through: :order_items


    def customer_names
        "Name " << rand(1..10).to_s
    end
end
