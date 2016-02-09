module Blogelator
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../../..", __FILE__)

    def copy_controller
      posts_controller_path = "app/controllers/blogelator/posts_controller.rb"
      copy_file posts_controller_path, posts_controller_path
    end

    def copy_views
      blogelator_views_path = "app/views/blogelator"
      directory blogelator_views_path, blogelator_views_path
    end

    # Install the database migrations required for Blogelator's posts
    def install_migrations
      rake "blogelator:install:migrations"
    end
  end
end
