require_relative "config"
require_relative "version"
require "cancan"

module Blogelator
  class Engine < ::Rails::Engine
    isolate_namespace Blogelator
  end
end
