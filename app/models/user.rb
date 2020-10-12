class User < ApplicationRecord
    has_secure_password
    has_many :plants, through: :owned_plants
    has_many :owned_plants
    has_many :plant_logs
    has_many :plants, :through :plant_logs
end
