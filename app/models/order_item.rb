class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product, required: false
    validates_uniqueness_of :product_id, scope: :order_id
end
