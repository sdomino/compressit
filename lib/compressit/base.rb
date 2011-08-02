module Compressit
  module Base
    class << self

      def compressit(options)
        
        @version, @ext, @folder  = options[:version], options[:ext], options[:folder]
        
        @java, @yuicompressor             = '/usr/bin/java', File.expand_path(File.dirname(__FILE__) + './../yuicompressor-2.4.6.jar')
        @destination_path                 = Dir.exists?("#{@folder}/compressed") ? Dir.open("#{@folder}/compressed") : Dir.mkdir("#{@folder}/compressed")
        @files_to_compress, @compressed   = Dir.glob("#{@folder}/**/*#{@ext}"), "compressed-#{@version}#{@ext}"
        
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
        #   puts "Hmm... looks like this folder doesn't contain any #{@ext} files."
        # end
      end
      
    end
  end
end
