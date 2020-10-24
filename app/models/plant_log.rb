class PlantLog < ApplicationRecord
    belongs_to :owned_plant
    belongs_to :user

    validates :user_id, :owned_plant_id, :content, presence: true
end
