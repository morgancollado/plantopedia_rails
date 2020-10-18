class PlantLog < ApplicationRecord
    belongs_to :owned_plant
    belongs_to :user
end
