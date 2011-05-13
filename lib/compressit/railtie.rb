require 'rails'

module Compressit
  class Railtie < Rails::Railtie
    
    # initializer "compressit.configure_rails_initialization" do
    #   
    # end
    
    rake_tasks do
      # load "tasks/compressit.tasks"
      load "tasks/compressit.rake"
    end
    
  end
end