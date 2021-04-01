class Batch < ApplicationRecord
    belongs_to :product 
    has_many :boxes 
end
