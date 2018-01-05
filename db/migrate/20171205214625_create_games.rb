class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.text :teaser
      t.text :included
      t.text :not_included
      t.string :difficulty
      t.decimal :price
      t.string :url
      t.timestamps
    end
  end
end