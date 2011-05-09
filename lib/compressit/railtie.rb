require 'compressit'
require 'rails'

module Compressit
  class Railtie < Rails::Railtie
    
    initializer "compressit.configure_rails_initialization" do
      #config.add_load_path Rails.root
    end
    
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