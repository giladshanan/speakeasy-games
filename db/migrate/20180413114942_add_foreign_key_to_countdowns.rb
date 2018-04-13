class AddForeignKeyToCountdowns < ActiveRecord::Migration[5.1]
  def change
    add_reference :countdowns, :purchased_game, foreign_key: true
  end
end
