require 'compressit/base'
require 'rails'

module Compressit
  class Railtie < Rails::Railtie
    
    config.after_initialize do
      begin
        Base.new(CSS_VERSION, JS_VERSION)
      rescue
        puts "run setup"
      end
    end
    
    rake_tasks do
      # load "tasks/compressit.tasks"
      load "tasks/compressit.rake"
    end
    
  end
end