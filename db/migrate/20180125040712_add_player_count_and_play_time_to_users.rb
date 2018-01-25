class AddPlayerCountAndPlayTimeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :player_min, :integer
    add_column :users, :player_max, :integer
    add_column :users, :play_time, :integer
    add_column :users, :prep_time, :integer
  end
end
