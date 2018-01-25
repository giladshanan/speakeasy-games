class AddPlayTimePrepTimePlayerMinPlayerMaxToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player_min, :integer
    add_column :games, :player_max, :integer
    add_column :games, :play_time, :integer
    add_column :games, :prep_time, :integer
  end
end
