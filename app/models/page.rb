class Page < ActiveRecord::Base
  belongs_to :story
	has_attached_file :image, styles: Artwork::STYLES
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
