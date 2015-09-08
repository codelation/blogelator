module Blogelator
  module Admin
    class ApplicationController < ::ApplicationController
      layout "blogelator/admin"
      before_filter :set_body_class

      def blogelator_current_user
        respond_to?(:current_user) ? current_user : nil
      end

    private

      def set_body_class
        @body_class = "admin"
      end
    end
  end
end
