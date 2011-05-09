namespace :compressit do
  desc "Create global version variables"
  task :setup do
    # File.open("#{Rails.root}/config/initializers/compressit.rb", "w+") do |file|
    #     file.puts "CSS_VERSION = '1.0.0'"
    #     file.puts "JS_VERSION = '1.0.0'"
    #   end
  end
  
  namespace :version do
    desc "Version css file before compression"
    task :css => :setup do
      puts "version bump major, minor, patch"
      puts "update version of css or js"
      
      @files_to_compress   = Dir.glob("#{Rails.root}/public/stylesheets/**/*.css")
      @destination_path    = Dir.open("#{Rails.root}/public/stylesheets/compressed") rescue Dir.mkdir("#{Rails.root}/public/stylesheets/compressed")
      @version             = '1.0.0' #CSS_VERSION
      @ext                 = ".css"
      @compressed          = "compressed-#{@version}#{@ext}"
    end
    
    desc "Version js file before compression"
    task :js => :setup do
      puts "version bump major, minor, patch"
      puts "update version of css or js"
      
      @files_to_compress   = Dir.glob("#{Rails.root}/public/javascripts/**/*.js")
      @destination_path    = Dir.open("#{Rails.root}/public/javascripts/compressed") rescue Dir.mkdir("#{Rails.root}/public/javascripts/compressed")
      @version             = '1.0.0' #CSS_VERSION
      @ext                 = ".js"
      @compressed          = "compressed-#{@version}#{@ext}"
    end
  end

  desc "Compress file"
  task :compress => :setup do
    # @java                = "/usr/bin/java"
    # @yuicompressor       = "#{File.dirname(__FILE__)}/yuicompressor-2.4.2.jar"
    # 
    # # remove current file if for some reason it already exists
    # `rm -f #{File.path(@destination_path)}/#{@compressed}` if File.exists?("#{File.path(@destination_path)}/#{@compressed}")
    # 
    # # compress each file in base_path and save the compressed file to destination_path
    # @files_to_compress.each do |file|
    #   `#{@java} -jar #{@yuicompressor} #{file} >> #{File.path(@destination_path)}/#{@compressed}`
    #   puts "Added: #{File.basename(file)}... \n"
    # end
    # 
    # # confirm compression and show destination path where file can be found
    # puts "Complete! Compressed #{@ext} file: '#{@compressed}' can be found in '#{File.path(@destination_path)}'"
  end
end