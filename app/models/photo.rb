class Photo < ApplicationRecord
  belongs_to :game
  has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"#, adapter_options: { hash_digest: Digest::SHA256 }
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
end

