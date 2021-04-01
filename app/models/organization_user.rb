class OrganizationUser < ApplicationRecord
    belongs_to :user 
    belongs_to :organization 
    validates :role, inclusion: { in: %w(admin, viewer), message: "%{value} is not a valid role" }
end
