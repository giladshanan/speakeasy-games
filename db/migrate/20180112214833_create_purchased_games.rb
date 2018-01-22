class CreatePurchasedGames < ActiveRecord::Migration[5.1]
  def change
    create_table :purchased_games do |t|
      t.references :game, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :subtotal
      t.integer :quantity
      t.timestamps
    end
  end
end
