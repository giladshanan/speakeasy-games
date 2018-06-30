class AddReferencesToUsersAndCharactersToOrders < ActiveRecord::Migration[5.1]
  def change

    add_column(:orders, :character_id, :integer)
    
    add_foreign_key(:orders, :characters)

  end
end
