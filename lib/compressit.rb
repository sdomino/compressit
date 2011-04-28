require 'rails'

module Compressit
  class Railtie < Rails::Railtie
    
    #require 'lib/compressit/railtie' if defined?(Rails)
  
    def self.css
      @files_to_compress   = Dir.glob("#{Dir.new("#{Rails.root}/public/stylesheets")}/**/*.css")
      @destination_path    = Dir.open("#{Rails.root}/public/stylesheets/compressed")
      # version update somehow
      @version             = CSS_VERSION
      @ext                 = ".css"
      @compressed          = "compressed-#{@version}#{@ext}"

      compressit
    end

    def self.js
      @files_to_compress   = Dir.glob("#{Dir.new("#{Rails.root}/public/javascripts")}/**/*.js")
      @destination_path    = Dir.open("#{Rails.root}/public/javascripts/compressed")
      # version update somehow
      @version             = JS_VERSION
      @ext                 = ".js"
      @compressed          = "compressed-#{@version}#{@ext}"

      compressit
    end

    private

    def compressit
      @java                = "/usr/bin/java"
      @yuicompressor       = "#{File.dirname(__FILE__)}/yuicompressor-2.4.2.jar"

      # remove current file if for some reason it already exists
      `rm -f #{File.path(@destination_path)}/#{@compressed}` if File.exists?("#{File.path(@destination_path)}/#{@compressed}")

      # compress each file in base_path and save the compressed file to destination_path
      @files_to_compress.each do |file|
        `#{@java} -jar #{@yuicompressor} #{file} >> #{File.path(@destination_path)}/#{@compressed}`
        puts "Added: #{File.basename(file)}... \n"
      end

      # confirm compression and show destination path where file can be found
      puts "Complete! Compressed #{@ext} file: '#{@compressed}' can be found in '#{File.path(@destination_path)}'"
    end
  
  end
end