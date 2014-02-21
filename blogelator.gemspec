$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blogelator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blogelator"
  s.version     = Blogelator::VERSION
  s.authors     = ["Brian Pattison", "Matthew Sullivan"]
  s.email       = ["brian@81designs.com", "matthew@81designs.com"]
  s.homepage    = "http://github.com/81designs/blogelator"
  s.summary     = "A custom built blogging engine for our company website."
  s.description = "A custom built blogging engine for our company website, made with love."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
