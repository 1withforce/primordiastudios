class Story < ActiveRecord::Base
	has_many :pages
	has_attached_file :cover, styles: Artwork::STYLES
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
	
end
