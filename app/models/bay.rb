class Bay < ApplicationRecord
    has_many :cases 
    has_many :products, through: :cases
    belongs_to :column 
end
