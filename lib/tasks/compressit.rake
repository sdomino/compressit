require 'compressit/base'
include Compressit

namespace :compressit do
  
  desc ""
  task :setup do
    Base.setup
  end
  
  desc ""
  task :css => :setup do
    Base.css
  end
  
  desc ""
  task :js => :setup do
    Base.js
  end
  
end
