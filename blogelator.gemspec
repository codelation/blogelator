$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blogelator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blogelator"
  s.version     = Blogelator::VERSION
  s.authors     = ["Brian Pattison", "Matthew Sullivan"]
  s.email       = ["brian@brianpattison.com", "msull92@gmail.com"]
  s.homepage    = "https://github.com/codelation/blogelator"
  s.summary     = "Simple blog for Rails apps."
  s.description = "Blogelator is an easy way to add a blog to your Rails app."
  s.licenses    = ["MIT"]

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "paperclip", ">= 4.0.0"
  s.add_dependency "pygments.rb", "~> 0.6"
  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "redcarpet", "~> 3.3"
  s.add_development_dependency "rake"
end
