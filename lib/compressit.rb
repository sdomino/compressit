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

    def show_usage
      puts %{
        --- Usage ---
        (--)help, -h                                        # show this usage
        (--)setup, -s                                       # create initial .css and .js version files and installs thor task(optional)
        (--)version, -v                                     # show the gem version

        (--)compress, -c                                    # compress both .css and .js files with a verion BUMP unless specified
        (--)css, -css                                       # compress .css files with a version BUMP unless specified
        (--)js, -js                                         # compress .js files with a verion BUMP unless specified

        --- Rake Tasks ---
        rake compress (version: MAJOR.MINOR.BUMP)           # compress both .css and .js files with a version BUMP unless specified
        rake css (version: MAJOR.MINOR.BUMP)                # compress .css files with a version BUMP unless specified
        rake js (version: MAJOR.MINOR.BUMP)                 # compress .js files with a version BUMP unless specified
        rake (css/js) versions                              # show file version

        --- Thor Tasks ---
        thor compress (version: MAJOR.MINOR.BUMP)           # compress both .css and .js files with a version BUMP unless specified
        thor css (version: MAJOR.MINOR.BUMP)                # compress .css files with a version BUMP unless specified
        thor js (version: MAJOR.MINOR.BUMP)                 # compress .js files with a version BUMP unless specified
        thor (css/js) version                               # show file version
      }
    end
  
  end
end
