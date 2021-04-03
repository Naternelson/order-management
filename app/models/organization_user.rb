class OrganizationUser < ApplicationRecord
    belongs_to :user 
    belongs_to :organization 
    validates :role, inclusion: { in: %w(admin viewer), message: "%{value} is not a valid role" }
    validates_uniqueness_of :user_id, scope: :organization_id
end
