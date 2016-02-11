module Blogelator
  class Post < ActiveRecord::Base
    # Assocations
    belongs_to :author
    has_and_belongs_to_many :related_posts, class_name: "Blogelator::Post", foreign_key: :post_id, association_foreign_key: :related_post_id
    has_and_belongs_to_many :tags

    # Paperclip attached file
    # @see https://github.com/thoughtbot/paperclip
    has_attached_file(
      :image,
      styles: {
        small:  "400x225#",
        medium: "800x450#",
        large:  "1440x810#"
      }
    )

    # Validations
    validates :slug,  presence: true, uniqueness: true
    validates :title, presence: true
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

    # Callbacks
    before_save :parse_markdown
    after_save :touch_tags

    # Scopes
    default_scope { includes(:author, :tags) }

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

    # Touch the associated tags to update cache keys.
    def touch_tags
      tags.each(&:touch)
    end
  end
end
