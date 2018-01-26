class AddPacketsToGames < ActiveRecord::Migration[5.1]
  def change
    def up
      add_attachment :games, :packet
    end

    def down
      remove_attachment :games, :packet
    end
  end
end
