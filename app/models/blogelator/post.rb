module Blogelator
  class Post < ActiveRecord::Base
    has_many :tags
    belongs_to :author, class_name: Blogelator::Config.user_class
  end
end
