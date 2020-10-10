# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'httparty'

TREFLE_TOKEN = ENV["KEY"]

r = HTTParty.get(
  'https://trefle.io/api/v1/plants',
  query: {
    "token": TREFLE_TOKEN
  }
)


r.parsed_response["data"].each do |plant_hash|
    
    Plant.create(common_name: plant_hash["common_name"], scientific_name: plant_hash["scientific_name"])
end 