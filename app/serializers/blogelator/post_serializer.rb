module Blogelator
  class PostSerializer < ActiveModel::Serializer
    attributes :id, :title
  end
end
