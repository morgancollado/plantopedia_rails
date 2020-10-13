# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'httparty'
require 'faker'
require 'byebug'

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

20.times do
    User.create(

        name: Faker::Name.name,
        username: Faker::Games::Overwatch.unique.hero,
        password_digest: Faker::String.random
    )


end

20.times do 
    OwnedPlant.create(
        user_id: Faker::Number.between(from: 1, to: 20),
        plant_id: Faker::Number.between(from: 1, to: 20),
        seed_date: Faker::Date.backward(days: 10),
        death_date: Faker::Date.forward(days: 10),
    )
end 

20.times do 
    PlantLog.create(
        user_id:
        Faker::Number.between(from: 1, to: 20),
        plant_id: Faker::Number.between(from: 1, to: 20),
        content: Faker::Hipster.paragraph

    )

end 
