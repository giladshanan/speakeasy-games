class Character < ApplicationRecord
  belongs_to :game
  has_many :orders
  has_many :users, through: :orders

  has_attached_file :player_packet, default_url: "nil"
  validates_attachment :player_packet, :content_type => { :content_type => "application/pdf" }

  #attr_accessor :user
end
