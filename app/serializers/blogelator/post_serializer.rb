module Blogelator
  class PostSerializer < ActiveModel::Serializer
    attributes :id, :body_html, :body_markdown, :title
  end
end
