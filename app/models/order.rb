class Order < ApplicationRecord
  belongs_to :user
  has_many :purchased_games
  has_many :games, through: :purchased_games
end
