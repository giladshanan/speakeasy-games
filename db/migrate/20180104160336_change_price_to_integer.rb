class ChangePriceToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :games, :price, :integer
  end
end
