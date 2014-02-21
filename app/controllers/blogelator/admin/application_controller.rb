module Blogelator
  module Admin
    class ApplicationController < ::ApplicationController
      include Blogelator::Admin::Auth
    end
  end
end
