class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :game
      t.timestamps
    end

    add_attachment :characters, :player_packet

  end
end
