module Compressit
  module Base
    class << self

      def compressit(options)
        java, yuicompressor = '/usr/bin/java', File.expand_path(File.dirname(__FILE__) + './../yuicompressor-2.4.6.jar')

        case File.ftype(options[:data])
        when 'file'
          destination_path = Dir.open(File.dirname(options[:data]))
          files_to_compress, compressed = Array[options[:data]], "#{File.basename(options[:data], ".#{options[:ext]}")}.min.#{options[:ext]}"
        when 'directory'
          Dir.exists?("#{options[:data]}/compressed") ? true : Dir.mkdir("#{options[:data]}/compressed")
          destination_path = Dir.open("#{options[:data]}/compressed")
          files_to_compress, compressed = Dir.glob("#{options[:data]}/**/*#{options[:ext]}"), "#{options[:version]}.min.#{options[:ext]}"
        else
          puts "Oops!"
          exit
        end

        # remove compressed file if the version hasn't been updated to avoid duplicate compression
        `rm -f #{File.path(destination_path)}/#{compressed}` if File.exists?("#{File.path(destination_path)}/#{compressed}")

        puts "Compressing #{options[:ext]} file(s) into '#{File.path(destination_path)}/#{compressed}'"
        
        # compress each file in files_to_compress and save the compressed file to destination_path
        begin
          puts "----- FILES: #{files_to_compress}"
          files_to_compress.each do |file|
            puts "----- FILE: #{file}"
            unless File.path(file).include?('compressed')
              `#{java} -jar #{yuicompressor} #{file} >> #{File.path(destination_path)}/#{compressed}`
              puts "Added: #{File.basename(file)}... \n"
            end
          end
          
          # confirm compression and show destination path where file can be found
          puts "Complete! Compressed #{options[:ext]} file '#{compressed}', can be found in '#{File.dirname(destination_path)}'"
        rescue => exception
          puts "Oops! #{exception}"
        end
      end
      
    end
  end
end
