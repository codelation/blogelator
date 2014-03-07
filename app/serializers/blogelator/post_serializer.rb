module Blogelator
  class PostSerializer < ActiveModel::Serializer
    attributes :id, :body_html, :body_markdown, :created_at, 
               :published_at, :summary, :title, :updated_at
  end
end
