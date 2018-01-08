class CreateCoverPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :cover_photos do |t|
      t.references :game, foreign_key: true
      t.attachment :img
      t.timestamps
    end
  end
end
