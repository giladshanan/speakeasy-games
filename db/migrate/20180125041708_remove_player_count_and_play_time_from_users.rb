class RemovePlayerCountAndPlayTimeFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :player_min
    remove_column :users, :player_max
    remove_column :users, :play_time
    remove_column :users, :prep_time
  end
end
