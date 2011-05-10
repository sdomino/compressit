require 'compressit/base'

namespace :compressit do
  
  desc "Create global version variables"
  task :setup do
    File.open("#{Rails.root}/config/initializers/compressit.rb", "w+") do |file|
      file.puts "CSS_VERSION = '1.0.0'"
      file.puts "JS_VERSION = '1.0.0'"
    end
  end
  
  desc "Version css file before compression"
  task :css => :setup do
    puts "version bump major, minor, patch"
    
    @files_to_compress   = Dir.glob("#{Rails.root}/public/stylesheets/**/*.css")
    @destination_path    = Dir.open("#{Rails.root}/public/stylesheets/compressed") rescue Dir.mkdir("#{Rails.root}/public/stylesheets/compressed")
    @version             = '1.0.0' #CSS_VERSION
    @ext                 = ".css"
    @compressed          = "compressed-#{@version}#{@ext}"
    
    Compressit::Base.compress
    #compressit
  end
  
  desc "Version js file before compression"
  task :js => :setup do
    puts "version bump major, minor, patch"
    
    @files_to_compress   = Dir.glob("#{Rails.root}/public/javascripts/**/*.js")
    @destination_path    = Dir.open("#{Rails.root}/public/javascripts/compressed") rescue Dir.mkdir("#{Rails.root}/public/javascripts/compressed")
    @version             = '1.0.0' #JS_VERSION
    @ext                 = ".js"
    @compressed          = "compressed-#{@version}#{@ext}"
  end
  
  def compressit
    @java                = "/usr/bin/java"
    @yuicompressor       = File.expand_path(File.dirname(__FILE__) + '../lib/yuicompressor-2.4.6.jar')
    
    # compress each file in base_path and save the compressed file to destination_path
    @files_to_compress.each do |file|
      `#{@java} -jar #{@yuicompressor} #{file} >> #{File.path(@destination_path)}/#{@compressed}`
      puts "Added: #{File.basename(file)}... \n"
    end

    # confirm compression and show destination path where file can be found
    puts "Complete! Compressed #{@ext} file '#{@compressed}', can be found in '#{File.path(@destination_path)}'"
  end

end