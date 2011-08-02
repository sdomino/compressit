Dir["#{File.dirname(__FILE__)}/compressit/*"].each { |file| require(file)}

require 'optparse'

module Compressit
  class << self
  
    def run(arguments, stdin)
      options = Hash.new
      
      optparser = OptionParser.new do|opts|
        
        opts.banner = "Usage: compressit [option] [FOLDER]"

        opts.on('-h', '--help', 'Display help') do
          Compressit::Base.show_usage
        end
        opts.on('-v', '--version', 'Display current gem version') do
          puts "Currently using version: #{VERSION}"
        end
        opts.on( '-c', '--css FOLDER', 'Compress css files from specified folder' ) do
          puts "Compressing css files from '#{arguments[0]}' into '#{arguments[0]}/compressed'"
          options[:folder] = arguments[0]
          Compressit::Base.css(options)
        end
        opts.on( '-j', '--js FOLDER', 'Compress javascript files from specified folder' ) do
          puts "Compressing javascript files from '#{arguments[0]}' into '#{arguments[0]}/compressed'"
          options[:folder] = arguments[0]
          Compressit::Base.js(options)
        end
      end
      
      begin optparser.parse!(arguments)
      rescue OptionParser::InvalidOption => error
        puts "Oops! #{error}, try this: "
        # Compressit::Base.show_usage
        puts optparser
        exit 1
      end
    end
  
  end
end
