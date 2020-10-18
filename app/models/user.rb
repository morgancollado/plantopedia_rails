class User < ApplicationRecord
    has_secure_password
    has_many :plants, through: :owned_plants
    has_many :owned_plants
    has_many :plant_logs

    validates :username, uniqueness: true
    validates :name, :username, :password, presence: true

    accepts_nested_attributes_for :owned_plants, :plant_logs
end
