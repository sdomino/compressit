module Compressit
  class Base
    class << self
      
      def setup
        # install thor tasks
        # `thor install lib/tasks/compressit.thor`
        puts "setup"
      end
    
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
      
      def usage
        puts %{
          --- Usage ---
          (--)help, -h                                        # show this usage
          (--)setup, -s                                       # create initial .css and .js version files and installs thor task(optional)
          (--)version, -v                                     # show the gem version

          (--)compress, -c                                    # compress both .css and .js files with a verion BUMP unless specified
          (--)css, -css                                       # compress .css files with a version BUMP unless specified
          (--)js, -js                                         # compress .js files with a verion BUMP unless specified

          --- Rake Tasks ---
          rake compress (version: MAJOR.MINOR.BUMP)           # compress both .css and .js files with a version BUMP unless specified
          rake css (version: MAJOR.MINOR.BUMP)                # compress .css files with a version BUMP unless specified
          rake js (version: MAJOR.MINOR.BUMP)                 # compress .js files with a version BUMP unless specified
          rake (css/js) versions                              # show file version

          --- Thor Tasks ---
          thor compress (version: MAJOR.MINOR.BUMP)           # compress both .css and .js files with a version BUMP unless specified
          thor css (version: MAJOR.MINOR.BUMP)                # compress .css files with a version BUMP unless specified
          thor js (version: MAJOR.MINOR.BUMP)                 # compress .js files with a version BUMP unless specified
          thor (css/js) version                               # show file version
        }
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