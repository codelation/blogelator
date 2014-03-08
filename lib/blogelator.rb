require "blogelator/engine"

module Blogelator
  mattr_accessor :posts_per_page, :site_name, :user_class
  
  def self.posts_per_page
    @@posts_per_page ||= 5
  end
  
  def self.site_name
    @@site_name ||= "Blogelator"
  end
end
