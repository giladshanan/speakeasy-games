class Order < ApplicationRecord
  belongs_to :user
  has_many :purchased_games
  has_many :games, through: :purchased_games

  def total
    purchased_games.sum(:subtotal)
  end

  def total_quantity
    purchased_games.sum(:quantity)
  end

  def total_games
    total_quantity.to_s + " " + "game".pluralize(total_quantity)
  end
end
