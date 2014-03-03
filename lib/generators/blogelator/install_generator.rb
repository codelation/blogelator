module Blogelator
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../../..", __FILE__)
    
    def ask_questions
      @site_name = ask("What is the name of your blog? [Blogelator]")
      if @site_name.blank?
        @site_name = "Blogelator"
      end
      
      @blogelator_route = ask("What route should be used to access the blog? [/blog]")
      if @blogelator_route.blank?
        @blogelator_route = "/blog"
      end
      
      @user_class = ask("What class is used for user authentication? [User]")
      if @user_class.blank?
        @user_class = "User"
      end
    end
    
    def create_initializer_file
      create_file "config/initializers/blogelator.rb", <<-INITIALIZER
Blogelator::Config.tap do |config|
  config.posts_per_page = 5
  config.site_name      = "#{@site_name}"
  config.user_class     = "#{@user_class}"
end
INITIALIZER
    end
    
    def create_stylesheets
      create_file "app/assets/stylesheets/blogelator/application.css.scss", <<-APPLICATIONCSS
/*
 *= require blogelator/application/all
 *= require_self
 */
APPLICATIONCSS

      create_file "app/assets/stylesheets/blogelator/admin.css.scss", <<-ADMINCSS
/*
 *= require blogelator/admin/all
 *= require_self
 */
ADMINCSS
    end
    
    def copy_variables_file
      puts File.expand_path("../../../..", __FILE__)
      source = "lib/assets/stylesheets/blogelator/_variables_sample.scss"
      destination = "app/assets/stylesheets/blogelator/_variables.scss"
      copy_file source, destination
    end
    
    def install_migrations
      rake "blogelator:install:migrations"
    end
    
    def mount_engine
      insert_into_file(File.join("config", "routes.rb"), :after => "Application.routes.draw do\n") do <<-MOUNTENGINE
  # This line mounts Blogelator's routes to the path '#{@blogelator_route}'.
  # This means, any requests to '#{@blogelator_route}', will go to Blogelator::PostsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Blogelator relies on it being the default of "blogelator"
  mount Blogelator::Engine, at: "#{@blogelator_route}"
        MOUNTENGINE
      end
    end
    
  end
end