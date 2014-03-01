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
Blogelator::Config.site_name  = "#{@site_name}"
Blogelator::Config.user_class = "#{@user_class}"
INITIALIZER
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
    
  end
end