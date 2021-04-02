class Organization < ApplicationRecord
    has_many :organization_users
    has_many :users, through: :organization_users
    validates_uniqueness_of :name
    validates :role, inclusion: { in: %w(personal, company), message: "%{value} is not a valid role" }
    after_validation :set_slug, only: [:create, :update]

    def to_param
        "#{id}-#{slug}"
    end
    
    private
    def set_slug
        self.slug = name.to_s.parameterize
    end

    
end
