class Box < ApplicationRecord
    belongs_to :batch
    belongs_to :bay
    deligate :product, to: :batch 
    deligate :column, :aisle, :zone, :site, :organization, to: :bay 
end
