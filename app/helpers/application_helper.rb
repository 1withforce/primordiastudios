module ApplicationHelper
	
	# Displays image as display_size if the image's width exceeds max_width
	def display_image(image, max_width = 1024, display_size = :giant)
		width = Paperclip::Geometry.from_file(image.path).width
		if width > max_width
			image_tag(image.url(display_size))
		else
			image_tag(image.url)
		end
	end
end
