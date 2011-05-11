require 'compressit'

namespace :compressit do
  
  desc ''
  task :config do
    Compressit::Base.config
  end
  
  desc ''
  task :setup do
    Compressit::Base.setup
  end
  
  desc ''
  task :css => :setup do
    Compressit::Base.css
  end
  
  desc ''
  task :js => :setup do
    Compressit::Base.js
  end
  
end
