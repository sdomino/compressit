module Compressit
  module Help
    class << self
      
      def usage
        puts %{
          --- Usage ---

          (--)help, -h                 # show this usage
          (--)version, -v              # show the gem version
        
          --- Rake Tasks ---
        
        
          --- Thor Tasks ---
        }
      end
      
    end
  end
end