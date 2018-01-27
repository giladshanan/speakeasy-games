class Game < ApplicationRecord
  has_many :testimonials
  has_many :photos
  has_one  :cover_photo

  has_attached_file :packet, default_url: "nil"
  validates_attachment_content_type :packet, :content_type => ["application/zip", "application/x-zip", "application/x-zip-compressed"]

  before_post_process :skip_for_zip

  def skip_for_zip
     ! %w(application/zip application/x-zip application/x-zip-compressed).include?(packet_content_type)
  end
end