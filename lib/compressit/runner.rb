module Compressit::Runner
  
  OPTIONS = [
    ['-v, --version', 'Print version'],
    ['-h, --help', 'Print help']
  ]
  
  class << self
    
    def run(argv = ARGV)
      if command = argv.shift.strip
        run_command(command)
      else
        run_command("help")
      end
    end
    
    def run_command(command)
      puts command
    end
  
  end
end