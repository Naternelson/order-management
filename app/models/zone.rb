class Zone < ApplicationRecord
    has_many :aisles
    has_many :products, through: :aisles
    belongs_to :site
    deligate :organization, to: :site
end
