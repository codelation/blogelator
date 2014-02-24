module Blogelator

  class Config
  
    class << self
      attr_accessor :site_name, :user_class
      
      def site_name
        @site_name ||= "Blogelator"
      end
    end
    
  end
  
end