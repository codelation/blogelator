module Blogelator

  class Config
  
    class << self
      attr_accessor :posts_per_page, :site_name, :user_class
      
      def posts_per_page
        @posts_per_page ||= 5
      end
      
      def site_name
        @site_name ||= "Blogelator"
      end
    end
    
  end
  
end