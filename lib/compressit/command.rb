require 'compressit/base'

module Compressit
  module Command
    class << self
      
      def run
        command = ARGV.shift.split rescue usage
        run_command(command)
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