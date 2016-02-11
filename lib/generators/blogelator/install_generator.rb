module Blogelator
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../../..", __FILE__)

    def copy_controller
      posts_controller_path = "app/controllers/blogelator/posts_controller.rb"
      copy_file posts_controller_path, posts_controller_path
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

    # Install the database migrations required for Blogelator's posts
    def install_migrations
      rake "blogelator:install:migrations"
    end
  end
end
