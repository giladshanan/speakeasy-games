class Game < ApplicationRecord
  has_many :testimonials
  has_many :photos
end