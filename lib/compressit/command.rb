require 'optparse'
require 'ostruct'
require 'compressit/base'
require 'compressit/version'

module Compressit
  module Command
    class << self
      
      def run(arguments, stdin)
        @arguments = arguments
        @stdin = stdin
        
        # @options = OpenStruct.new
        # @options.verbose = false
        # @options.quiet = false
        
        if parsed_options? && arguments_valid?
          process_arguments
          process_command
        else
          puts "help"
        end
        
        #command = ARGV.shift.split
        #run_command(command)
      end
      
      def parsed_options?
        optpars = OptionParser.new
        optpars.on('-h', '--help', 'help')           {puts "help"}
        optpars.on('-s', '--setup', 'setup')         {puts "setup"}
        optpars.on('-v', '--version', 'version')     {puts "version"}
        
        optpars.on('-c', '--compress', 'compress')   {puts "comrpess"}
        optpars.on('-css', '--css', 'css')           {puts "css"}
        optpars.on('-js', '--js', 'js')              {puts "js"}
        
        optpars.parse!(@arguments) rescue return false
        
        process_options
        true
      end
      
      def process_options
        # @options.verbose = false if @options.quiet
      end
      
      # def output_options
      #   puts "Options:"
      #   @options.marshal_dump.each do |name, val|
      #     puts "#{name} = #{val}"
      #   end
      # end
      
      # True if required arguments were provided
      def arguments_valid?
        # TO DO - implement your real logic here
        true if @arguments.length == 1 
      end

      # Setup the arguments
      def process_arguments
        # TO DO - place in local vars, etc
      end

      def output_help
        output_version
        # RDoc::usage() #exits app
      end

      # def output_usage
      #   RDoc::usage('usage') # gets usage from comments above
      # end

      def output_version
        puts "#{File.basename(__FILE__)} version #{VERSION}"
      end

      def process_command
        # TO DO - do whatever this app does

        #process_standard_input # [Optional]
      end

      def process_standard_input
        input = @stdin.read      
        # TO DO - process input

        # [Optional]
        # @stdin.each do |line| 
        #  # TO DO - process each line
        #end
      end
      
      def run_command(command)
        runner = Base.new
        begin
          runner.send(command.first.to_sym)
        rescue
          usage
        end
      end
      
      def usage
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
end