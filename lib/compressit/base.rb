module Compressit
  module Base
    class << self

      def setup
        @java = '/usr/bin/java'
        @yuicompressor = File.expand_path(File.dirname(__FILE__) + './../yuicompressor-2.4.6.jar')
        
        if defined?(Rails)
          # install thor tasks (coming soon)
          # `thor install lib/tasks/compressit.thor`
          
          # create the rails initializer that will contain the css/js version constants
          unless File.exists?("#{Rails.root}/config/initializers/compressit.rb")
            File.open("#{Rails.root}/config/initializers/compressit.rb", 'w') do |file|
              file.puts "CSS_VERSION = '1.0.0'"
              file.puts "JS_VERSION = '1.0.0'"
            end
          end
          
          # create the folder where the compressed .css files will be saved
          File.directory?("#{Rails.root}/public/stylesheets/compressed") ? true : Dir.mkdir("#{Rails.root}/public/stylesheets/compressed")
          
          # create the folder where the compressed .js files will be saved
          File.directory?("#{Rails.root}/public/javascripts/compressed") ? true : Dir.mkdir("#{Rails.root}/public/javascripts/compressed")
          
          # after the initializer has been created it needs to be required because it cannot be accessed through rake tasks
          require "#{Rails.root}/config/initializers/compressit.rb"
          
          # set css/js instance variables from css/js constants
          @css_version  = CSS_VERSION
          @js_version   = JS_VERSION
        else
          # coming soon
        end
      end
      
      def css
        if defined?(Rails)
          @files_to_compress         = Dir.glob("#{Rails.root}/public/stylesheets/**/*.css")
          @destination_path          = Dir.open("#{Rails.root}/public/stylesheets/compressed")
        else
          # coming soon
        end
        
        @ext                         = '.css'
        @compressed                  = "compressed-#{@css_version}#{@ext}"
        
        compressit
      end

      def js
        if defined?(Rails)
          @files_to_compress         = Dir.glob("#{Rails.root}/public/javascripts/**/*.js")
          @destination_path          = Dir.open("#{Rails.root}/public/javascripts/compressed")
        else
          # coming soon
        end
        
        @ext                         = '.js'
        @compressed                  = "compressed-#{@js_version}.#{@ext}"
        
        compressit
      end

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
      
      # add the ability to see css/js version. do 
      
      def show_usage
        puts %{
          --- Usage ---
          (--)help, -h                   # show this usage
          (--)setup, -s                  # create initial .css and .js version files
          (--)version, -v                # show the current gem version
                                         
          (--)css, -css                  # compress .css files with the version specified in the config file (coming soon)
          (--)js, -js                    # compress .js files with the version specified in the config file (coming soon)
                                         
          --- Rake Tasks ---             
          rake css                       # compress .css files with the version specified in the config file
          rake js                        # compress .js files with the version specified in the config file
                                         
          --- Thor Tasks ---             
          thor css                       # compress .css files with the version specified in the config file (coming soon)
          thor js                        # compress .js files with the version specified in the config file (coming soon)
        }
      end
      
    end
  end
end
