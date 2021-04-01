class Bay < ApplicationRecord
    has_many :boxes
    has_many :products, through: :cases
    belongs_to :column 
end
