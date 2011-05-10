module Compressit
  class Base
    
    # attr_accessor :css_version, :js_version
    
    def initialize(css_version, js_version)
      @css_version = css_version
      @js_version = js_version
      puts "here"
      puts css_version
      puts @css_version
    end
    
    puts @css_version
    
    class << self
      
      def setup
        # install thor tasks
        # `thor install lib/tasks/compressit.thor`
      
        unless File.exists?("#{Rails.root}/config/initializers/compressit.rb")
          File.open("#{Rails.root}/config/initializers/compressit.rb", "w") do |file|
            file.puts "CSS_VERSION = '1.0.0'"
            file.puts "JS_VERSION = '1.0.0'"
          end
        else
          # show_usage
        end
        
        puts @css_version
        puts "test"
      end

      def css
        @files_to_compress   = Dir.glob("#{Rails.root}/public/stylesheets/**/*.css")
        @destination_path    = Dir.open("#{Rails.root}/public/stylesheets/compressed") rescue Dir.mkdir("#{Rails.root}/public/stylesheets/compressed")
        # @css_version         = '1.0.0' #CSS_VERSION
        @ext                 = ".css"
        @compressed          = "compressed-#{@css_version}#{@ext}"
        
        puts @css_version
      
        # compressit
      end

      def js
        @files_to_compress   = Dir.glob("#{Rails.root}/public/javascripts/**/*.js")
        @destination_path    = Dir.open("#{Rails.root}/public/javascripts/compressed") rescue Dir.mkdir("#{Rails.root}/public/javascripts/compressed")
        # @js_version          = '1.0.0' #CSS_VERSION
        @ext                 = ".js"
        @compressed          = "compressed-#{@js_version}#{@ext}"
    
        compressit
      end
  
      private
  
      def compressit
        @java                = "/usr/bin/java"
        @yuicompressor       = File.expand_path(File.dirname(__FILE__) + './../yuicompressor-2.4.6.jar')
    
        # remove current file if the version hasn't been updated to avoid duplicate compression
        `rm -f #{File.path(@destination_path)}/#{@compressed}` if File.exists?("#{File.path(@destination_path)}/#{@compressed}")

        # compress each file in @files_to_compress and save the compressed file to @destination_path
        @files_to_compress.each do |file|
          `#{@java} -jar #{@yuicompressor} #{file} >> #{File.path(@destination_path)}/#{@compressed}`
          puts "Added: #{File.basename(file)}... \n"
        end

        # confirm compression and show destination path where file can be found
        puts "Complete! Compressed #{@ext} file '#{@compressed}', can be found in '#{File.path(@destination_path)}'"
      end
      
      def show_usage
        puts %{
          --- Usage ---
          (--)help, -h                                        # show this usage
          (--)setup, -s                                       # create initial .css and .js version files and installs thor task(optional)
          (--)version, -v                                     # show the current gem version

          (--)compress, -c                                    # compress both .css and .js files with a verion BUMP unless otherwise specified
          (--)css, -css                                       # compress .css files with a version BUMP unless otherwise specified
          (--)js, -js                                         # compress .js files with a verion BUMP unless otherwise specified

          --- Rake Tasks ---
          rake css                                            # compress .css files with a version BUMP unless specified
          rake js                                             # compress .js files with a version BUMP unless specified
          rake (css/js) versions                              # show respecitve file version

          --- Thor Tasks ---
          thor css                                            # compress .css files with a version BUMP unless specified
          thor js                                             # compress .js files with a version BUMP unless specified
          thor (css/js) version                               # show respective file version
        }
      end
    
    end
  end
end