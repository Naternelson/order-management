class Aisle < ApplicationRecord
    has_many :columns
    has_many :products, through: :columns
    belongs_to :zone
end
