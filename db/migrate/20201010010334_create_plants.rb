class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :common_name
      t.string :scientific_name

      t.timestamps
    end
  end
end
