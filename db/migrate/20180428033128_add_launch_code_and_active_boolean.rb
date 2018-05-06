class AddLaunchCodeAndActiveBoolean < ActiveRecord::Migration[5.1]
  def change
    rename_column :countdowns, :code, :disarm_code
    add_column :countdowns, :launch_code, :string
    add_column :countdowns, :active, :boolean
    add_index :countdowns, [:active, :purchased_game_id], unique: true
  end
end
