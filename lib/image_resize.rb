require "image_resize/version"
require "rmagick"

class ImageResize
	
  ALLOWED_EXTENSIONS = %w[jpg png gif]

  attr_accessor :width, :height, :file

  def initialize(file)
  	@file = file
  end

  def validate_file
  	return false unless ALLOWED_EXTENSIONS.include?(file_extension)
  end

  def file_extension
  	@file_extension ||= File.extname(@file.to_s).downcase.sub('.','')
  end

  def is_file_exists?
  	File.exists?(@file)
  end

  def resized_image_path
  	@resized_image_path ||= @file.to_s.gsub(file_extension, "preview.#{file_extension}")
  end

  def resize(opts = {})
  	@width = opts[:width] || 50
  	@height = opts[:height] || 50
		
  	puts "File extension not allowed." and return unless validate_file

		if is_file_exists?
	  	
	  	image_data = Magick::Image.read(@file).first

	  	resized_image_data = image_data.resize_to_fit(@width.to_i, @height.to_i)
	  	
	  	resized_image_data.write(resized_image_path)

	  	puts "New resized image is save at #{resized_image_path}"
  	else
  		puts "File not found." 
  		return false
  	end
  end
end
