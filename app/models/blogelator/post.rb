module Blogelator
  class Post < ActiveRecord::Base
    belongs_to :author, class_name: Blogelator::Config.user_class
  end
end
