class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.text :caption
      t.string :url
      t.date :date_taken
      t.references :game, foreign_key: true
      t.attachment :img
      t.timestamps
    end
  end
end
