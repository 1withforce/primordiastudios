class Artwork < ActiveRecord::Base
	has_attached_file :image, :styles => { :small => "64x", :medium => "128x", :large => "256x" }
	
	validates_attachment :image, :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
end
