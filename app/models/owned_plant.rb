class OwnedPlant < ApplicationRecord

    belongs_to :plant
    belongs_to :user

    validates :user_id, :plant_id, :seed_date, presence: true
end
