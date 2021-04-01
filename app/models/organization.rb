class Organization < ApplicationRecord
    has_many :organization_users
    has_many :users, through: :organization_users
    validates :role, inclusion: { in: %w(personal, company), message: "%{value} is not a valid role" }
end
