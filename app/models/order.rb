class Order < ApplicationRecord
  belongs_to :user
  has_many :purchased_games
  has_many :games, through: :purchased_games

  def total
    purchased_games.sum(:subtotal)
  end
end
