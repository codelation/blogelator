$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blogelator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blogelator"
  s.version     = Blogelator::VERSION
  s.authors     = ["Brian Pattison", "Matthew Sullivan"]
  s.email       = ["brian@81designs.com", "matthew@81designs.com"]
  s.homepage    = "http://github.com/codelation/blogelator"
  s.summary     = "A blog in the form of a mountable Rails::Engine."
  s.description = "Blogelator is a mountable Rails::Engine for adding a blog to your Rails app."
  s.licenses    = ["MIT"]

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "aws-sdk", "~> 1.27"
  s.add_dependency "cancan", "~> 1.6"
  s.add_dependency "deface", "~> 1.0"
  s.add_dependency "ember-rails", "~> 0.14"
  s.add_dependency "jquery-rails", "~> 3.1"
  s.add_dependency "kaminari", "~> 0.15"
  s.add_dependency "local_time", "~> 0.3"
  s.add_dependency "pygments.rb", "~> 0.5"
  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "redcarpet", "~> 3.1"
  s.add_dependency "sass-rails", "~> 4.0", ">= 4.0.2"
  s.add_dependency "uglifier", "~> 2.4"

  s.add_development_dependency "awesome_print", "~> 1.2"
  s.add_development_dependency "better_errors", "~> 1.1"
  s.add_development_dependency "binding_of_caller", "~> 0.7"
  s.add_development_dependency "capybara", "~> 2.2"
  s.add_development_dependency "database_cleaner", "~> 1.2"
  s.add_development_dependency "dotenv-rails", "~> 0.10"
  s.add_development_dependency "factory_girl_rails", "~> 4.4"
  s.add_development_dependency "foreman", "~> 0.63"
  s.add_development_dependency "guard", "~> 2.5"
  s.add_development_dependency "guard-rspec", "~> 4.2"
  s.add_development_dependency "guard-teaspoon"
  s.add_development_dependency "puma", "~> 2.8"
  s.add_development_dependency "quiet_assets", "~> 1.0"
  s.add_development_dependency "rake", "~> 10.2"
  s.add_development_dependency "rb-fsevent", "~> 0.9"
  s.add_development_dependency "rspec-rails", "~> 2.14"
  s.add_development_dependency "sqlite3", "~> 1.3"
  s.add_development_dependency "teaspoon", "~> 0.7"
  s.add_development_dependency "terminal-notifier-guard", "~> 1.5"
end
