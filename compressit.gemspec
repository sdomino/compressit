# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "compressit/version"

Gem::Specification.new do |s|
  s.name        = "compressit"
  s.version     = Compressit::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["sdomino"]
  s.email       = ["sdomino@pagodabox.com"]
  s.homepage    = "http://wwww.pagodabox.com"
  s.summary     = "%q{Compressit is a simple gem that will compress all of your .css and .js files into single compressed files respectively.}"
  s.description = "%q{Compressit uses the yuicompressor-2.4.2.jar java file created by Yahoo to compress all of your .css and .js files into single compressed files respectively. This not only reduces the size of your files (turning them into one), but also results in less http requests at load time resulting in an overall faster site, and a higher grade from Yahoo's 'Yslow' firefox plugin.}"
  
  s.rubyforge_project = "compressit"
  
  s.add_development_dependency "rspec"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = [".", "lib"]
end
