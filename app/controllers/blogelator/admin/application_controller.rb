module Blogelator
  module Admin
    class ApplicationController < ::ApplicationController
      include Blogelator::Admin::Auth
      layout "blogelator/admin"
      before_filter :set_body_class
      
    private
    
      def set_body_class
        @body_class = "admin"
      end
    end
  end
end
