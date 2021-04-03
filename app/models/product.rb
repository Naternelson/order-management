class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items

    # A product has many materials
    has_many :product_materials
    has_many :materials, through: :product_materials

    # A product as a material can belong to several products
    has_many :material_products, class_name: "ProductMaterial", foreign_key: :material_id
    has_many :products, through: :material_products

    belongs_to :organization

    def available_materials
        taken_ids = self.material_ids << self.id
        binding.pry
        self.class.for(self.organization).where.not(id: taken_ids)
    end

    def self.for(organization) 
        self.where('organization_id = ?', organization.id)
    end
end