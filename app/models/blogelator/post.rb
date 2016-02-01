module Blogelator
  class Post < ActiveRecord::Base
    # Assocations
    belongs_to :author

    # Paperclip attached file
    # @see https://github.com/thoughtbot/paperclip
    has_attached_file(
      :image,
      styles: {
        retina:    "242x116>",
        thumbnail: "121x58>"
      }
    )

    # Validations
    validates :title, presence: true
    validates :slug,  presence: true, uniqueness: true
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

    # Callbacks
    before_save :parse_markdown

    enum status: {
      preview:   0,
      published: 1
    }

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
          "https://#{ENV.fetch('HOST')}/blog/#{slug}"
        else
          "http://#{ENV.fetch('HOST')}/blog/#{slug}"
        end
      end
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

    # Convert the Markdown for the post body and summary to HTML.
    def parse_markdown
      self.body_html = markdown.render(body_markdown)
      self.summary_html = markdown.render(summary_markdown)
    end
  end
end
