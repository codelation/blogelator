module Blogelator
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../../..", __FILE__)

    # Install the database migrations required for Blogelator's posts
    def install_migrations
      rake "blogelator:install:migrations"
    end
  end
end
