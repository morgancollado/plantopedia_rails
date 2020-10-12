class CreatePlantLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :plant_logs do |t|
      t.integer :user_id
      t.integer :plant_id
      t.datetime :log_date
      t.string :content

      t.timestamps
    end
  end
end
