module Compressit
  class Help < Base
    
    def index
      display %{
        === Usage ===

        help                         # show this usage
        version                      # show the gem version
      }
    end
    
  end
end