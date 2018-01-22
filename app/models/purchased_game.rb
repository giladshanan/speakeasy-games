class PurchasedGame < ApplicationRecord
  belongs_to :game
  belongs_to :order

  def update_quantity(increment=true)
    increment ? self.quantity += 1 : self.quantity -= 1
  end

  def update_subtotal
    self.update(subtotal: quantity * game.price)
  end
end
