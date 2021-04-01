class Column < ApplicationRecord
    has_many :bays
    has_many :products, through: :bays
    belongs_to :aisle
end
