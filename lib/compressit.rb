Dir["#{File.dirname(__FILE__)}/compressit/*"].each { |file| require(file)}

require 'optparse'

module Compressit
  class << self
  
    def run(arguments, stdin)
      options = Hash.new
      
      optparser = OptionParser.new do|opts|
        
        opts.banner = "Usage: compressit [option] [FOLDER]"

        opts.on('-h', '--help', 'Display this help') do
          puts optparser
        end
        opts.on('-v', '--version', 'Display current gem version') do
          puts "Currently using version: #{VERSION}"
        end
        opts.on( '-c', '--css FOLDER VERSION', 'Compress css files from specified folder' ) do
          puts "Compressing css files from '#{arguments[0]}' into '#{arguments[0]}/compressed/compressed-#{arguments[1]}.css'"
          options[:folder], options[:version], options[:ext] = arguments[0], arguments[1], '.css'
          Compressit::Base.compressit(options)
        end
        opts.on( '-j', '--js FOLDER VERSION', 'Compress javascript files from specified folder' ) do
          puts "Compressing javascript files from '#{arguments[0]}' into '#{arguments[0]}/compressed/compressed-#{arguments[1]}.js'"
          options[:folder], options[:version], options[:ext] = arguments[0], arguments[1], '.js'
          Compressit::Base.compressit(options)
        end
      end
      
      begin optparser.parse!(arguments)
      rescue OptionParser::InvalidOption => error
        puts "Oops! #{error}, try this: "
        puts optparser
        exit 1
      end
    end
  
  end
end
