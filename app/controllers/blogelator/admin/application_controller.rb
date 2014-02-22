module Blogelator
  module Admin
    class ApplicationController < ::ApplicationController
      include Blogelator::Admin::Auth
      layout "blogelator/admin"
    end
  end
end
