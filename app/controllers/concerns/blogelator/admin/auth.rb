module Blogelator
  module Admin
    module Auth
      extend ActiveSupport::Concern

      included do
        check_authorization
        rescue_from CanCan::AccessDenied do |exception|
          unauthorized(exception)
        end
      end

      def blogelator_current_user
        respond_to?(:current_user) ? current_user : nil
      end

      def current_ability
        @current_ability ||= Blogelator::Ability.new(blogelator_current_user)
      end

      def devise_resource_name
        Blogelator.user_class.underscore.gsub('/', '_')
      end

      def login_redirect_path
        # Try to use Devise's new session path or use the app's root path
        devise_new_session_path = "new_#{devise_resource_name}_session_path"
        if main_app.respond_to?(devise_new_session_path)
          main_app.send(devise_new_session_path)
        else
          main_app.root_path
        end
      end

      def redirect_back_or_default(default)
        redirect_to(session["#{devise_resource_name}_return_to"] || default)
        session["#{devise_resource_name}_return_to"] = nil
      end

      def store_location
        session["#{devise_resource_name}_return_to"] = request.fullpath.gsub('//', '/')
      end

      def unauthorized(exception)
        if blogelator_current_user
          redirect_to main_app.root_url, alert: exception.message
        else
          store_location
          redirect_to login_redirect_path, alert: exception.message
        end
      end

    end
  end
end
