require 'rails'

module Compressit
  class Railtie < Rails::Railtie
    
    rake_tasks do
      # load "tasks/compressit.tasks"
      load "tasks/compressit.rake"
    end
    
  end
end