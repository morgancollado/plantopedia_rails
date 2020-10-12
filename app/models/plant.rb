class Plant < ApplicationRecord

    has_many :users, through: :owned_plants
    has_many :owned_plants
    has_many :users, through: :plant_log 
    has_many :plant_logs

end
