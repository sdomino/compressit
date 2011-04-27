class Compressit < Thor
  
  desc "install", "Create global version variables"
  method_options :version, :default => "1.0.0"
  def install do
    File.open("#{Rails.root}/config/initializers/compressit.rb", "w+") do |file|
      file.puts "CSS_VERSION = '#{options[:version]}'"
      file.puts "JS_VERSION = '#{options[:version]}'"
    end
  end
	
	desc "version", "Version file before compression"
	method_options :version, :default => "1.0.0"
  def version do
    invoke :install
    puts "update version of css or js to #{options[:version]}"
  end

  desc "compress", "Compress file"
  method_options :file
  def compress do
    invoke :version
    puts "compress #{options[:file]}"
  end

end