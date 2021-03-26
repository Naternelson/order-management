class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items
    has_many :product_materials
    has_many :materials, through: :product_materials
    
end
