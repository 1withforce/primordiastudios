class Artwork < ActiveRecord::Base
	# Styles constant is used in other models. Making changes here makes the rest follow.
	STYLES = { :small => "64x", :medium => "128x", :large => "256x", :giant => "1024x" }

	# Common file extensions for images
	IMAGE_EXT = ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	# Paperclip image attachment
	has_attached_file :image, :styles => STYLES
	validates_attachment :image, :content_type => { :content_type => IMAGE_EXT}

end
