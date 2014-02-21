module Blogelator
  class Tag < ActiveRecord::Base
    belongs_to :post
  end
end
