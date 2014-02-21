require "blogelator/config"
require "blogelator/version"
require "cancan"

module Blogelator
  class Engine < ::Rails::Engine
    isolate_namespace Blogelator
  end
end
