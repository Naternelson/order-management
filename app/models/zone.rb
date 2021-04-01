class Zone < ApplicationRecord
    has_many :aisiles
    has_many :products, through: :aisles
    belongs_to :site
end
