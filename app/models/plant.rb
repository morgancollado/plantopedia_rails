class Plant < ApplicationRecord

    has_many :users, through: :owned_plants
    has_many :owned_plants
    has_many :plant_logs

    validates :common_name, :scientific_name, uniqueness: true

    TREFLE_TOKEN = ENV["KEY"]

    def self.search(search)
        
        if search
       @plants = Plant.all.select {|p| p.common_name.include?(search) || p.scientific_name.include?(search)}
        if @plants == []
        r = HTTParty.get(
            'https://trefle.io/api/v1/plants/search',
            query: { q: search,
              "token": TREFLE_TOKEN
            }
        )
        
       @plants = r.parsed_response["data"].map do |plant_hash|
    
            Plant.create(common_name: plant_hash["common_name"], scientific_name: plant_hash["scientific_name"])
            end 
        end 
        else 
           @plants = Plant.all
            end 
        end  
        
end
