require "aws-sdk"
require "coffee_script"
require "ember-rails"
require "jquery-rails"
require "kaminari"
require "local_time"
require "pygments.rb"
require "redcarpet"
require "sass"
require "blogelator/engine"
require "blogelator/version"

module Blogelator
  mattr_accessor :posts_per_page,  :site_name,             :s3_access_key_id,
                 :s3_bucket,       :s3_secret_access_key,  :show_full_post,
                 :user_class

  def self.posts_per_page
    @@posts_per_page ||= 5
  end

  def self.site_name
    @@site_name ||= "Blogelator"
  end
end
