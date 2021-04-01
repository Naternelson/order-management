class Zone < ApplicationRecord
    has_many :aisles
    has_many :products, through: :aisles
    belongs_to :site
end
