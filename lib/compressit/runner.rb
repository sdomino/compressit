module Compressit::Runner
  
  OPTIONS = [
    ['-v, --version', 'Print version'],
    ['-h, --help', 'Print help']
  ]
  
  class << self
    
    def run(argv = ARGV)
      run_command(argv.shift.strip) rescue run_command("help")
    end
    
    def run_command(command)
      puts command
    end
  
  end
end