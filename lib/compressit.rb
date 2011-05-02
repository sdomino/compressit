require 'compressit/base'
require 'compressit/railtie' if defined?(Rails)

module Compressit
  class Compressit < Rails::Railtie
    
    # initializer "my_railtie.configure_rails_initialization" do |app|
    #   # some initialization behavior
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
end
