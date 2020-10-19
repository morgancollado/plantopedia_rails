class AddUidColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :UID, :string
  end
end
