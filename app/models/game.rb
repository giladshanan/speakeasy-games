class Game < ApplicationRecord
  has_many :testimonials
  has_many :photos
  has_one  :cover_photo
end