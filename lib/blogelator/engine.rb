require_relative "config"
require_relative "version"
require "bourbon"
require "neat"
require "cancan"
require "deface"
require "ember-rails"
require "jquery-rails"
require "local_time"
require "pygments.rb"
require "redcarpet"

module Blogelator
  class Engine < ::Rails::Engine
    isolate_namespace Blogelator
    
    # Precompile Blogelator Assets
    initializer "blogelator.assets.precompile" do |app|
      app.config.assets.precompile += %w(blogelator/application.css blogelator/admin.css blogelator/admin.js)
    end
    
    # Add Blogelator Handlebars Templates Path
    initializer "blogelator.handlebars.config" do |app|
      unless app.config.handlebars.templates_root.is_a?(Array)
        app.config.handlebars.templates_root = [app.config.handlebars.templates_root]
      end
      if app.config.handlebars.templates_root.include?("templates")
        app.config.handlebars.templates_root << "blogelator"
      else
        app.config.handlebars.templates_root << "blogelator/templates"
      end
    end
    
    # Load Rails Generators
    generators do
      require File.join(File.expand_path("../..", __FILE__), "generators", "blogelator", "install_generator.rb")
    end
    
  end
end
