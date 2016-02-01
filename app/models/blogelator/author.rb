module Blogelator
  class Author < ActiveRecord::Base
    # Assocations
    belongs_to :user, polymorphic: true
    has_many :posts

    # Validations
    validates :name, presence: true
    validates :slug, presence: true, uniqueness: true

    # Callbacks
    before_save :parse_markdown

    # Uses the slug as the :id parameter in URLs
    # @return [String]
    def to_param
      slug
    end

  private

    # Returns a customized Redcarpet Markdown -> HTML renderer.
    # @return [Redcarpet::Markdown]
    def markdown
      @markdown ||= Redcarpet::Markdown.new(
        Blogelator::HTMLRenderer,
        autolink:                     true,
        disable_indented_code_blocks: true,
        fenced_code_blocks:           true,
        space_after_headers:          true
      )
    end

    # Convert the Markdown for the author's bio to HTML.
    def parse_markdown
      self.bio_html = markdown.render(bio_markdown)
    end
  end
end
