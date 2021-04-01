class User < ApplicationRecord
    has_many :organization_users
    has_many :organizations, through: :organization_users
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    vaildates :first_name, presence: true 
    
end
