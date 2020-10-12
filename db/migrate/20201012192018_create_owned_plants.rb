class CreateOwnedPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :owned_plants do |t|
      t.integer :user_id
      t.integer :plant_id
      t.datetime :seed_date
      t.datetime :death_date

      t.timestamps
    end
  end
end
