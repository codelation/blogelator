module Blogelator
  class Tag < ActiveRecord::Base
    # Assocations
    has_and_belongs_to_many :posts

    # Validations
    validates :name, presence: true
    validates :slug, presence: true, uniqueness: true

    # Uses the slug as the :id parameter in URLs
    # @return [String]
    def to_param
      slug
    end

    # The URL for the blog post.
    # @return [String]
    def url(request = nil)
      @url ||= begin
        if request.try(:ssl?)
          "https://#{ENV.fetch('HOST')}/blog/tags/#{slug}"
        else
          "http://#{ENV.fetch('HOST')}/blog/tags/#{slug}"
        end
      end
    end
  end
end
