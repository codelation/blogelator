require "blogelator/config"
require "blogelator/version"

module Blogelator
  class Engine < ::Rails::Engine
    isolate_namespace Blogelator
  end
end
