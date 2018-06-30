class Character < ApplicationRecord
  belongs_to :game
  has_many :invites
  has_many :orders
  has_many :users, through: :orders

  has_attached_file :player_packet, default_url: "nil"
  validates_attachment_content_type :player_packet, :content_type => ["application/zip", "application/x-zip", "application/x-zip-compressed"]
end