module Blogelator
  class Author < ActiveRecord::Base
    # Assocations
    belongs_to :user, polymorphic: true
    has_many :posts
    # - 100x100 w/ 200x200 being retina
    # - 200x200 w/ 400x400 being retina
    # Paperclip attached files
    # @see https://github.com/thoughtbot/paperclip
    has_attached_file(
      :cover_photo,
      styles: {
        small:  "400x225#",
        medium: "800x450#",
        large:  "1200x675#"
      }
    )

    has_attached_file(
      :profile_photo,
      styles: {
        small:  "150x150#",
        medium: "300x300#",
        large:  "600x600#"
      }
    )

    # Validations
    validates :name, presence: true
    validates :slug, presence: true, uniqueness: true
    validates_attachment_content_type :cover_photo,   content_type: /\Aimage\/.*\Z/
    validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\Z/

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
