class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items

    # A product has many materials
    has_many :product_materials
    has_many :materials, through: :product_materials

    # A product as a material can belong to several products
    has_many :material_products, class_name: "ProductMaterial", foreign_key: :material_id
    has_many :products, through: :material_products

    scope :for, ->(organization) {where('organization_id = ?', organization.id)}
    scope :available_materials, -> (product, organization) {where}
    scope :search_products, ->(search_query) {where("name LIKE ?", "%#{search_query}%")}

    belongs_to :organization

    validates_presence_of :name
    validates_uniqueness_of :name, scope: :organization_id
    def available_materials
        taken_ids = self.material_ids << self.id
        self.class.for(self.organization).where.not(id: taken_ids)
    end

    def order_id=(o)
        self.order_items.build(order_id: o)
    end
    # def self.for(organization) 
    #     self.where('organization_id = ?', organization.id)
    # end
end