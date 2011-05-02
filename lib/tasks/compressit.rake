namespace :compressit do
  desc "Create global version variables"
  task :install do
    # File.open("#{Rails.root}/config/initializers/compressit.rb", "w+") do |file|
    #     file.puts "CSS_VERSION = '1.0.0'"
    #     file.puts "JS_VERSION = '1.0.0'"
    #   end
    puts Dir.glob("#{Dir.new("#{Rails.root}/public/stylesheets")}/**/*.css")
  end
  
  namespace :version do
    desc "Version css file before compression"
    task :css => :install do
      puts "version bump major, minor, patch"
      puts "update version of css or js"
    end
    
    desc "Version js file before compression"
    task :js => :install do
      puts "version bump major, minor, patch"
      puts "update version of css or js"
    end
  end

  desc "Compress file"
  task :compress => :version do
    puts "compress css or js"
  end
end