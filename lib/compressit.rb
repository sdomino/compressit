require 'compressit/base'
require 'compressit/railtie' if defined?(Rails)
require 'rails'

module Compressit
  class Compressit < Rails::Railtie
    
    # initialzer "setup" do
    #   
    # end
    
    # Add a to_prepare block which is executed once in production
    # and before each request in development
    # config.to_prepare do
    #   Compressit.setup!
    # end
    
    rake_tasks do
      #load "tasks/compressit.tasks"
      load "tasks/compressit.rake"
    end
    
  end
  
  def help
    Compressit::Help.usage
  end
  
end
