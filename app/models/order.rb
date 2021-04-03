class Order < ApplicationRecord
    has_many :order_items
    has_many :products, through: :order_items
    belongs_to :customer
    belongs_to :organization
    accepts_nested_attributes_for :order_items 
    validates_presence_of :sales_order_id
    validates_uniqueness_of :sales_order_id, scope: :organization_id
    validates_uniqueness_of :purchase_order_id, scope: :customer_id

    def self.for(organization)
        self.where('organization_id = ?', organization.id)
    end

    def customer_name=(name)
        cust = Customer.find_or_create_by name: name
        self.customer = cust if cust
    end

    def customer_name 
        self.customer.name if self.customer
    end


end
