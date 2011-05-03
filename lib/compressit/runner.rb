module Compressit::Runner
  
  OPTIONS = [
    ['-v, --version', 'Print version'],
    ['-h, --help', 'Print help']
  ]
  
  class << self
    
    def run(argv = ARGV)
      if argv == nil
        run_command("help")
      else
        run_command(argv.shift.strip)
      end
    end
    
    def run_command(command)
      puts command
    end
  
  end
end