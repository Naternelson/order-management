class ProductMaterial < ApplicationRecord
    belongs_to :product 
    belongs_to :material, class_name: :product
end
