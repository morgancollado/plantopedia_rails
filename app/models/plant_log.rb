class PlantLog < ApplicationRecord
    belongs_to :owned_plant
    belongs_to :user

    validates :content, :owned_plant_id, :user_id, presence: true
end
