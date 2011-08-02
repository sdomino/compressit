module Compressit
  module Base
    class << self

      def setup(options = nil)
        @java = '/usr/bin/java'
        @yuicompressor = File.expand_path(File.dirname(__FILE__) + './../yuicompressor-2.4.6.jar')
        
        @version = "#{options[:folder]}/compressed/VERSION.txt"
        
        puts "VERSION: #{@version}"
        unless File.exists?(@version)
          File.open(@version, 'w') do |file|
            file.puts '1.0.0'
          end
        end
      end
      
      def css(options = nil)
        
        setup
        
        @files_to_compress          = Dir.glob("#{options[:folder]}/**/*.css")
        @destination_path           = Dir.exists?("#{options[:folder]}/compressed") ? Dir.open("#{options[:folder]}/compressed") : Dir.mkdir("#{options[:folder]}/compressed")
        
        @css_version  = file.open(@version, 'rb') {|file| file.read}
        
        @ext                        = '.css'
        @compressed                 = "compressed-#{@css_version}#{@ext}"
        
        compressit
      end

      def js(options = nil)
        
        setup
        
        @files_to_compress          = Dir.glob("#{options[:folder]}/**/*.js")
        @destination_path           = Dir.new("#{options[:folder]}/compressed") || Dir.mkdir("#{options[:folder]}/compressed")
        
        @js_version = file.open(@version, 'rb') {|file| file.read}
        
        @ext                        = '.js'
        @compressed                 = "compressed-#{@js_version}.#{@ext}"
        
        compressit
      end

      def compressit
        
        # remove compressed file if the version hasn't been updated to avoid duplicate compression
        `rm -f #{File.path(@destination_path)}/#{@compressed}` if File.exists?("#{File.path(@destination_path)}/#{@compressed}")
        
        @files_to_compress.each do |file|
          unless file == "#{File.path(@destination_path)}/#{@compressed}"
            `#{@java} -jar #{@yuicompressor} #{file} >> #{File.path(@destination_path)}/#{@compressed}`
            puts "Added: #{File.basename(file)}... \n"
          end
        end
        
        # confirm compression and show destination path where file can be found
        puts "Complete! Compressed #{@ext} file '#{@compressed}', can be found in '#{File.path(@destination_path)}'"

        # compress each file in @files_to_compress and save the compressed file to @destination_path
        # begin
        #   @files_to_compress.each do |file|
        #     `#{@java} -jar #{@yuicompressor} #{file} >> #{File.path(@destination_path)}/#{@compressed}`
        #     puts "Added: #{File.basename(file)}... \n"
        #   end
        #   
        #   # confirm compression and show destination path where file can be found
        #   puts "Complete! Compressed #{@ext} file '#{@compressed}', can be found in '#{File.path(@destination_path)}'"
        # rescue
        #   puts "Hmm... looks like this foulder doesn't contain any #{@ext} files."
        # end
      end
      
      # add the ability to see css/js version. do 
      
      def show_usage
        puts %{
          --- Usage ---
          
          --- CLI ---
          -h, --help                      # show this usage
          -s, --setup                     # create initial .css and .js version files
          -v, --version                   # show the current gem version
                                         
          -c, --css                       # compress .css files with the version specified in the config file
          -cv, --cssv                     # display current compressed css file version
          
          -j, --js                        # compress .js files with the version specified in the config file
          -jv, --jsv                      # display durrent compressed javascript file version
        }
      end
      
    end
  end
end
