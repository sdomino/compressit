require 'optparse'

require 'compressit/base'
require 'compressit/version'

require 'compressit/railtie' if defined?(Rails)

module Compressit
  class << self
  
    def run(arguments, stdin)
      @arguments  = arguments
      @stdin      = stdin
    
      if parsed_options? && arguments_valid?
        process_arguments
        process_command
      else
        show_usage
      end
    end
  
    def parsed_options?
      oparser = OptionParser.new
      oparser.on('-h', '--help')                    {show_usage}
      oparser.on('-s', '--setup')                   {Base.setup}
      oparser.on('-v', '--version')                 {puts "#{VERSION}"}
    
      oparser.on('-c', '--compress')                {Base.compress}
      oparser.on('-css', '--css')                   {Base.css}
      oparser.on('-js', '--js')                     {Base.js}
      
      begin
        oparser.parse!(@arguments)
        return true
      rescue
        return false
      end
    end
  
    # True if required arguments were provided
    def arguments_valid?
      # TO DO - implement your real logic here
      true
    end
  
    # Setup the arguments
    def process_arguments
      # TO DO - place in local vars, etc
    end

    def process_command
      # TO DO - do whatever this app does
    end

  end
end
