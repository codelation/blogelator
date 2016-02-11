require "codelation_assets"
require "paperclip"
require "pygments"
require "rails"
require "redcarpet"
require "turbolinks"
require "blogelator/engine"
require "blogelator/version"

# Blogelator allows you to add a blog to a Rails app.
module Blogelator
  def self.table_name_prefix
    "blogelator_"
  end
end
