require 'rails/generators'
require 'rails/generators/migration'

module Blogelator
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path("../../../..", __FILE__)

    def copy_controller
      posts_controller_path = "app/controllers/blogelator/posts_controller.rb"
      copy_file posts_controller_path, posts_controller_path
    end
    def copy_models
      blogelator_module = "app/models/blogelator.rb"
      blogelator_directory = "app/models/blogelator"
      copy_file blogelator_module, blogelator_module
      directory blogelator_directory, blogelator_directory
    end

    def copy_javascripts
      blog_js_path = "app/assets/javascripts/blog.js"
      copy_file blog_js_path, blog_js_path
      blog_js_dir_path = "app/assets/javascripts/blog"
      directory blog_js_dir_path, blog_js_dir_path
    end

    def copy_layout
      blog_layout_path = "app/views/layouts/blog.html.erb"
      copy_file blog_layout_path, blog_layout_path
      blog_layout_dir_path = "app/views/layouts/blog"
      directory blog_layout_dir_path, blog_layout_dir_path
    end

    def copy_stylesheets
      blog_scss_path = "app/assets/stylesheets/blog.scss"
      copy_file blog_scss_path, blog_scss_path
      blog_scss_dir_path = "app/assets/stylesheets/blog"
      directory blog_scss_dir_path, blog_scss_dir_path
    end

    def copy_views
      blogelator_views_path = "app/views/blogelator"
      directory blogelator_views_path, blogelator_views_path
    end

    def copy_files
      # Add interface for Active Admin (Pro)
      # @see http://activeadmin.info
      # @see http://github.com/codelation/activeadmin_pro
      if defined?(ActiveAdmin)
        admin_path = "app/admin/blogelator"
        directory admin_path, admin_path
      end
    end

    def self.next_migration_number(path)
      if ActiveRecord::Base.timestamped_migrations
        sleep 1 # make sure each time we get a different timestamp
        Time.new.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(path) + 1)
      end
    end

    def setup_routes
      route = '
  namespace :blogelator, path: "blog" do
    resources :posts, path: "/"
    resources :tags do
      resources :posts, path: "/"
    end
  end

'
      inject_into_file "config/routes.rb", route, :before => /^end/
    end

    # Install the database migrations required for Blogelator's posts
    def install_migrations
      migrations = [
        "create_blogelator_posts.rb",
        "create_blogelator_authors.rb",
        "create_blogelator_tags.rb",
        "create_blogelator_posts_tags.rb",
        "create_blogelator_posts_posts.rb"
      ]
      migration_path = "db/migrate"
      migrations.each do |file|
        migration_template "#{migration_path}/#{file}", "#{migration_path}/#{file}"
      end
    end
  end
end
