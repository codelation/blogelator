module Blogelator
  module Admin
    module Auth
      extend ActiveSupport::Concern
      
      included do
        load_and_authorize_resource
        rescue_from CanCan::AccessDenied do |exception|
          redirect_to root_url, :alert => exception.message
        end
      end
      
      def blogelator_current_user
        current_user
      end
      
      def current_ability
        @current_ability ||= Spree::Ability.new(blogelator_current_user)
      end
      
    end
  end
end
