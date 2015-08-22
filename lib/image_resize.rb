require "image_resize/version"
require "rmagick"

class ImageResize
	
	

  ALLOWED_EXTENSIONS = %w[jpg png gif]


  def resize(file, width, height)
		file_extension = File.extname(file.to_s).downcase
		
		unless ALLOWED_EXTENSIONS.include?(file_extension.sub('.',''))
			puts "Unknown file format #{file}"
			return
		end

  	image_file_data = Magick::Image.read(file).first
  	new_image = image_file_data.resize_to_fit(width.to_i, height.to_i)
  	new_image.write(file.to_s.gsub(file_extension, ".preview#{file_extension}"))
  end
end
