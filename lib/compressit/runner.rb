module Compressit::Runner
  
  OPTIONS = [
    ['-v, --version', 'Print version'],
    ['-h, --help', 'Print help']
  ]
  
  class << self
    
    def run(argv = ARGV)
      puts argv.shirt.strip
    end
  
  end
end