# require 'compressit'

class Compressit < Thor
  
  desc ''
  def config do
    Compressit::Base.config
  end
	
	desc ''
  def setup do
    Compressit::Base.setup
  end

  desc ''
  method_options :version, :default => "1.0.0"
  def css do
    Compressit::Base.css
  end
  
  desc ''
  method_options :version, :default => "1.0.0"
  def js do
    Compressit::Base.js
  end

end
