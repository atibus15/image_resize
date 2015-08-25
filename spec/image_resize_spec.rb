require 'spec_helper'
describe ImageResize do
  it 'has a version number' do
    expect(ImageResize::VERSION).not_to be nil
  end

  it 'Resize image' do
	@image = ImageResize.new('/var/www/logo.png')
	@image.resize({:width=> 50, :height=> 50})
  end

  it "Resize should proceed without width and height" do 
  	@image = ImageResize.new('/var/www/logo.png')
	@image.resize
  end

  it "Resize should fail" do 
  	@image = ImageResize.new('/var/www/logo.test')
	expect(@image.resize({:width=> 50, :height=> 50})).to be false
  end
end
