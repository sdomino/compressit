desc "Create global version variables"
task :install do
  # File.open("#{Rails.root}/config/initializers/compressit.rb", "w+") do |file|
  #     file.puts "CSS_VERSION = '1.0.0'"
  #     file.puts "JS_VERSION = '1.0.0'"
  #   end
  puts "do stuff"
end

desc "Version file before compression"
task :version => :install do
  puts "version bump major, minor, patch"
  puts "update version of css or js"
end

desc "Compress file"
task :compress => :version do
  puts "compress css or js"
end