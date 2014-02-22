require_relative "config"
require_relative "version"
require "cancan"
require "ember-rails"
require "jquery-rails"

module Blogelator
  class Engine < ::Rails::Engine
    isolate_namespace Blogelator
    
    initializer "blogelator.assets.precompile" do |app|
      app.config.assets.precompile += %w(blogelator/admin.css blogelator/admin.js)
    end
  end
end
