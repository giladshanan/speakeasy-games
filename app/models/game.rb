class Game < ApplicationRecord
  has_many :testimonials, dependent: :nullify
  has_many :photos
  has_many :characters
  has_one  :cover_photo, dependent: :nullify

  accepts_nested_attributes_for :testimonials, allow_destroy: true, :reject_if => lambda { |a| a[:description].blank? } # this prevents empty testimonials from getting saved

  accepts_nested_attributes_for :characters, allow_destroy: true, reject_if: lambda { |a| a[:player_packet].blank? && a[:name].blank? } # this prevents empty characters from getting saved

  has_attached_file :packet, default_url: "nil"
  validates_attachment_content_type :packet, :content_type => ["application/zip", "application/x-zip", "application/x-zip-compressed"]

  before_post_process :skip_for_zip

  scope :active, -> { where.not(packet_file_name: nil) }
  scope :coming_soon, -> { where(packet_file_name: nil) }

  def has_packet?
     packet.url != "nil"
  end

  def countdown?
    title == "Cuban Missile Crisis: Again!"
  end

  private

  def skip_for_zip
     ! %w(application/zip application/x-zip application/x-zip-compressed).include?(packet_content_type)
  end
end