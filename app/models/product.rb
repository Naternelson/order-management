class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items

    # A product has many materials
    has_many :product_materials
    has_many :materials, through: :product_materials

    # A product as a material can belong to several products
    has_many :material_products, class_name: "ProductMaterial", foreign_key: :material_id
    has_many :products, through: :material_products

    def available_materials
        taken_ids = self.material_ids << self.id
        Product.where.not(id: taken_ids)
    end
end