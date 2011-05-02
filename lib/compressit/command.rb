module Compressit
  module Command
    
    def css
      # @files_to_compress   = Dir.glob("#{Dir.new("#{Rails.root}/public/stylesheets")}/**/*.css")
      # @destination_path    = Dir.open("#{Rails.root}/public/stylesheets/compressed")
      # # version update somehow
      # @version             = CSS_VERSION
      # @ext                 = ".css"
      # @compressed          = "compressed-#{@version}#{@ext}"
      puts "css"
    end

    def js
      # @files_to_compress   = Dir.glob("#{Dir.new("#{Rails.root}/public/javascripts")}/**/*.js")
      # @destination_path    = Dir.open("#{Rails.root}/public/javascripts/compressed")
      # # version update somehow
      # @version             = JS_VERSION
      # @ext                 = ".js"
      # @compressed          = "compressed-#{@version}#{@ext}"
      puts "js"
    end
    
  end 
end