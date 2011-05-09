namespace :compressit do
  
  desc "Create global version variables"
  task :setup do

    @java                = "/usr/bin/java"
    # @yuicompressor       = "#{File.dirname(__FILE__)}/yuicompressor-2.4.2.jar"
    @yuicompressor       = '/Users/Delorum3/.rvm/gems/ruby-1.9.2-p0/bin/yuicompressor-2.4.2.jar'
    
    puts File.executable?(@yuicompressor)
    puts File.executable_real?(@yuicompressor)
    puts File.file?(@yuicompressor)
    puts File.exists?(@yuicompressor)
    puts "---"
    puts File.expand_path(@yuicompressor)
    puts @yuicompressor
    puts "---"
    puts $LOAD_PATH
    puts "---"
    puts File.dirname(__FILE__)
    puts "---"
    puts Rails.root
    puts "---"
    puts $LOAD_PATH.unshift(File.dirname(__FILE__))
    puts "---"
    
    # File.open("#{Rails.root}/config/initializers/compressit.rb", "w+") do |file|
    #   file.puts "CSS_VERSION = '1.0.0'"
    #   file.puts "JS_VERSION = '1.0.0'"
    # end
  end
  
  desc "Version css file before compression"
  task :css => :setup do
    puts "version bump major, minor, patch"
    
    @files_to_compress   = Dir.glob("#{Rails.root}/public/stylesheets/**/*.css")
    @destination_path    = Dir.open("#{Rails.root}/public/stylesheets/compressed") rescue Dir.mkdir("#{Rails.root}/public/stylesheets/compressed")
    @version             = '1.0.0' #CSS_VERSION
    @ext                 = ".css"
    @compressed          = "compressed-#{@version}#{@ext}"
    
    # Compressit::Base.compress
    # compress each file in base_path and save the compressed file to destination_path
    @files_to_compress.each do |file|
      `#{@java} -jar #{@yuicompressor} #{file} >> #{File.path(@destination_path)}/#{@compressed}`
      puts "Added: #{File.basename(file)}... \n"
    end
    
    # confirm compression and show destination path where file can be found
    puts "Complete! Compressed #{@ext} file '#{@compressed}', can be found in '#{File.path(@destination_path)}'"
  end
  
  desc "Version js file before compression"
  task :js => :setup do
    puts "version bump major, minor, patch"
    
    @files_to_compress   = Dir.glob("#{Rails.root}/public/javascripts/**/*.js")
    @destination_path    = Dir.open("#{Rails.root}/public/javascripts/compressed") rescue Dir.mkdir("#{Rails.root}/public/javascripts/compressed")
    @version             = '1.0.0' #JS_VERSION
    @ext                 = ".js"
    @compressed          = "compressed-#{@version}#{@ext}"
    
    Compressit::Base.compress
  end

end