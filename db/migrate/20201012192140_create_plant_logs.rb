class CreatePlantLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :plant_logs do |t|
      t.integer :user_id
      t.integer :plant_id
      t.string :content

      t.timestamps
    end
  end
end
