module Blogelator
  class Engine < ::Rails::Engine
    # Load Rails Generators
    generators do
      require File.join(File.expand_path("../..", __FILE__), "generators", "blogelator", "install_generator.rb")
    end

    # Add interface for Active Admin (Pro)
    # @see http://activeadmin.info
    # @see http://github.com/codelation/activeadmin_pro
    if defined?(ActiveAdmin)
      initializer :blogelator do
        ActiveAdmin.application.load_paths.unshift File.join(File.expand_path("../..", __FILE__), "blogelator", "admin")
      end
    end
  end
end
