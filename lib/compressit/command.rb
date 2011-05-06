module Compressit
  module Command
    class << self
      
      def run
        command = ARGV.shift.split rescue usage
        run_command(command)
      end
      
      def run_command(command)
        puts command
        runner = Base.new
        begin
          runner.send(command)
        rescue
          usage
        end
      end
      
    end
  end
end