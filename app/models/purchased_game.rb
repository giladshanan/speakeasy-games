class PurchasedGame < ApplicationRecord
  belongs_to :game
  belongs_to :order
end
