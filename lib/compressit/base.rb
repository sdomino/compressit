require 'rails'

module Compressit
  module Base
    class << self
      
      def setup
        # install thor tasks
        # `thor install lib/tasks/compressit.thor`
        puts "setup"
      end
  
      def css
        @files_to_compress   = Dir.glob("#{Rails.root}/public/stylesheets/**/*.css")
        @destination_path    = Dir.open("#{Rails.root}/public/stylesheets/compressed") rescue Dir.mkdir("#{Rails.root}/public/stylesheets/compressed")
        @version             = '1.0.0' #CSS_VERSION
        @ext                 = ".css"
        @compressed          = "compressed-#{@version}#{@ext}"
      end

      def js
        @files_to_compress   = Dir.glob("#{Rails.root}/public/javascripts/**/*.js")
        @destination_path    = Dir.open("#{Rails.root}/public/javascripts/compressed") rescue Dir.mkdir("#{Rails.root}/public/javascripts/compressed")
        @version             = '1.0.0' #CSS_VERSION
        @ext                 = ".js"
        @compressed          = "compressed-#{@version}#{@ext}"
      end
      
    end
      
    protected
  
    def compress
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
      puts "compress"
    end
  
  end
end