class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product, required: false

end
