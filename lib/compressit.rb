Dir["#{File.dirname(__FILE__)}/compressit/**/*"].each {|file| require(file)}

require 'optparse'

module Compressit
  class << self
  
    def run(arguments)
      unless arguments.empty? || !arguments[0].include?('-')
        optparser = OptionParser.new do|opts|
          opts.banner = "Usage: compressit -command [FILE/DIR]"

          opts.on('-h', '--help', 'Display this help') do
            puts optparser
            exit
          end
          opts.on('-v', '--version', 'Display current gem version') do
            puts "Compressit-#{VERSION}"
          end
          opts.on('-f', '--file FILE', 'Compress FILE in place') do |file|
            prepare(file)
          end
          opts.on('-F', '--files DIR', 'Compress files from [DIR] into [DIR]/compressed') do |dir|
            prepare(dir)
          end
        end
        
        begin optparser.parse!(arguments)
        rescue OptionParser::ParseError => error
          puts "#{error}"
          puts optparser
          exit
        end
      else
        puts `compressit -h`
      end
    end

    def prepare(data)
      options = Hash[:data, data]

      puts "Specify a version (ex. x.x.x):"
      options[:version] = gets.strip

      puts "css/js:"
      options[:ext] = gets.strip

      Compressit::Base.compressit(options)
    end
 
  end
end
