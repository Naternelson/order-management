class Organization < ApplicationRecord
    has_many :organization_users
    has_many :users, through: :organization_users
    has_many :sites 
    accepts_nested_attributes_for :sites
    validates :name, presence: true, uniqueness: true
    validates :org_type, inclusion: { in: %w(Personal Business), message: "%{value} is not a valid role" }
    after_validation :set_slug, only: [:create, :update]

    def to_param
        "#{id}-#{slug}"
    end
    
    private
    def set_slug
        self.slug = name.to_s.parameterize
    end

    
end
