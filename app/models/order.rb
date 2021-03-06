class Order < ApplicationRecord
    has_many :order_items
    has_many :products, through: :order_items
    belongs_to :customer
    belongs_to :organization
    accepts_nested_attributes_for :order_items 
    validates_presence_of :sales_order_id, :purchase_order_id
    validates_uniqueness_of :sales_order_id, scope: :organization_id
    validates_uniqueness_of :purchase_order_id, scope: :customer_id

    scope :for, ->(organization) {where('organization_id = ?', organization.id)}
    scope :search_sales, ->(sales_order) {where("sales_order_id LIKE ?", "%#{sales_order}%")}


    def customer_name=(name)
        self.customer = Customer.find_or_create_by name: name
    end

    def customer_name 
        self.customer.name if self.customer
    end

end
