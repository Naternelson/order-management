class Batch < ApplicationRecord
    belongs_to :product 
    has_many :cases 
end
