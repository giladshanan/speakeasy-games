class AddFingerprintToPhotos < ActiveRecord::Migration[5.1]
  def change
    def up
      add_column :photos, :img_fingerprint, :string
    end

    def down
      remove_column :photos, :img_fingerprint
    end
  end
end
