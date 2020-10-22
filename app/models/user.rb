class User < ApplicationRecord
    has_secure_password
    has_many :plants, through: :owned_plants
    has_many :owned_plants
    has_many :plant_logs

    validates :username, :email, uniqueness: true
    
    
    accepts_nested_attributes_for :owned_plants, :plant_logs

    def self.find_or_create_by_omniauth(auth)
        user = User.find_by(uid: auth['uid'])

        if user.nil?
            user = User.create(email: auth['info']['email'], username: auth['info']['nickname'], password: SecureRandom.hex, uid: auth['uid'])
        elsif user.uid.nil?
            user.update(uid: auth['uid'])
        end 
        user 
    end 

end
