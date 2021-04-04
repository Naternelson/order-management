class User < ApplicationRecord
    has_many :organization_users
    has_many :organizations, through: :organization_users
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :first_name, presence: true 
    

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.first_name = auth.info.first_name
          user.last_name = auth.info.last_name 
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end

    def name 
      if self.preferred_name.nil? || self.preferred_name.empty?
        self.first_name
      else 
        self.preferred_name
      end
    end

    def full_name 
      [self.first_name, self.last_name].join(" ")
    end
end
