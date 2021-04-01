class Case < ApplicationRecord
    belongs_to :batch
    belongs_to :bay 
    belongs_to :product, through: :batch
end
