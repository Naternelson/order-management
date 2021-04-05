class Site < ApplicationRecord
    has_many :zones
    has_many :products, through: :zones
    belongs_to :organization
    
end
