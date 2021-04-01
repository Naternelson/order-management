class Bay < ApplicationRecord
    has_many :boxes
    has_many :products, through: :boxes
    belongs_to :column 
    deligate :aisle, :zone, :site, :organization, to: :column
end
