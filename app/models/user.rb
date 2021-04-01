class User < ApplicationRecord
    has_many :organization_users
    has_many :organizations, through: :organization_users
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    vaildates :first_name, presence: true 
    

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.first_name = auth.info.first_name
          user.last_name = auth.info.last_name 
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end
end
