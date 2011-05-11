module Compressit
  class Base
    class << self

      def config
        if defined?(Rails)
          # install thor tasks
          # `thor install lib/tasks/compressit.thor`
    
          unless File.exists?("#{Rails.root}/config/initializers/compressit.rb")
            File.open("#{Rails.root}/config/initializers/compressit.rb", "w") do |file|
              file.puts "CSS_VERSION = '1.0.0'"
              file.puts "JS_VERSION = '1.0.0'"
            end
          end
        else
          # set for a place to save css_version and js_version
        end
      end
      
      def setup
        if defined?(Rails)
          @java                = "/usr/bin/java"
          @yuicompressor       = File.expand_path(File.dirname(__FILE__) + './../yuicompressor-2.4.6.jar')
        
          require "#{Rails.root}/config/initializers/compressit.rb" rescue puts 'error reporting'
        else
          # specify java and yuicompressor. may need to ask for a place to save .jar
        end
      end

      def css
        if defined?(Rails)
          @files_to_compress   = Dir.glob("#{Rails.root}/public/stylesheets/**/*.css")
          @destination_path    = Dir.open("#{Rails.root}/public/stylesheets/compressed") rescue Dir.mkdir("#{Rails.root}/public/stylesheets/compressed")
          @ext                 = ".css"
          @compressed          = "compressed-#{CSS_VERSION}#{@ext}"
        else
          # ask for @files_to_compress, @destination_path, and @ext
        end
        
        compressit
      end

      def js
        if defined?(Rails)
          @files_to_compress   = Dir.glob("#{Rails.root}/public/javascripts/**/*.js")
          @destination_path    = Dir.open("#{Rails.root}/public/javascripts/compressed") rescue Dir.mkdir("#{Rails.root}/public/javascripts/compressed")
          @ext                 = ".js"
          @compressed          = "compressed-#{JS_VERSION}#{@ext}"
        else
          # ask for @files_to_compress, @destination_path, and @ext
        end
  
        compressit
      end

      private
      
      def compressit
        # remove compressed file if the version hasn't been updated to avoid duplicate compression
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
          rake (css/js) version                               # show respecitve file version

          --- Thor Tasks ---
          thor css                                            # compress .css files with a version BUMP unless specified
          thor js                                             # compress .js files with a version BUMP unless specified
          thor (css/js) version                               # show respective file version
        }
      end
      
    end
  end
end