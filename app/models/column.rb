class Column < ApplicationRecord
    has_many :bays
    has_many :products, through: :bays
    belongs_to :aisle
    deligate :zone, :site, :organization, to: :aisle
end
