require 'optparse'
require 'ostruct'
require 'compressit/base'
require 'compressit/version'

module Compressit
  module Command
    class << self
      
      def run(arguments, stdin)
        @arguments  = arguments
        @stdin      = stdin
        
        puts "opts: #{parsed_options?}"
        puts "args: #{arguments_valid?}"
        
        if parsed_options? && arguments_valid?
          process_arguments
          process_command
        else
          puts "usage"
        end
        
        # @options = OpenStruct.new
        # @options.verbose = false
        # @options.quiet = false
        
      end
      
      def parsed_options?
        optpars = OptionParser.new
        optpars.on('-h', '--help')           {show_usage}
        optpars.on('-s', '--setup')         {Compressit::Base.setup}
        optpars.on('-v', '--version')     {output_version}
        
        optpars.on('-c', '--compress')   {Compressit::Base.compress}
        optpars.on('-css', '--css')           {Compressit::Base.css}
        optpars.on('-js', '--js')              {Compressit::Base.js}
        
        optpars.parse!(@arguments) rescue return false
        # process_options
        true
      end
      
      # True if required arguments were provided
      def arguments_valid?
        # TO DO - implement your real logic here
        true
      end
      
      # Setup the arguments
      def process_arguments
        # TO DO - place in local vars, etc
        puts "process args"
      end

      def process_command
        # TO DO - do whatever this app does

        #process_standard_input # [Optional]
        puts "process command"
      end

      def process_standard_input
        input = @stdin.read      
        # TO DO - process input

        # [Optional]
        # @stdin.each do |line| 
        #  # TO DO - process each line
        #end
      end
      
      # def process_options
      #   # @options.verbose = false if @options.quiet
      # end
      
      # def output_options
      #   puts "Options:"
      #   @options.marshal_dump.each do |name, val|
      #     puts "#{name} = #{val}"
      #   end
      # end
      
      # def output_usage
      #   RDoc::usage('usage') # gets usage from comments above
      # end

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
      
      def output_version
        puts "#{VERSION}"
      end
      
    end
  end
end