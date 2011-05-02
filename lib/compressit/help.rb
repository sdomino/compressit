module Compressit
  module Help
    puts "hi"
    
    class << self

      def usage
        display %{
          === Usage ===

          help                         # show this usage
          version                      # show the gem version
        }
      end

    end
  end
end