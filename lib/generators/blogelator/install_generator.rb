module Blogelator
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../../..", __FILE__)

    def ask_questions
      @user_class = ask("What class is used for user authentication? [User]")
      @user_class = "User" if @user_class.blank?
    end

    def create_initializer_file
      create_file "config/initializers/blogelator.rb", <<-INITIALIZER
Blogelator.user_class           = "#{@user_class}"
Blogelator.s3_access_key_id     = ENV["BLOGELATOR_S3_KEY"]
Blogelator.s3_secret_access_key = ENV["BLOGELATOR_S3_SECRET"]
Blogelator.s3_bucket            = ENV["BLOGELATOR_S3_BUCKET"]
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
  end
end
