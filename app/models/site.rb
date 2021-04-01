class Site < ApplicationRecord
    has_many :zones
    has_many :products, through: :zone
end
