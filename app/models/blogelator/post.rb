module Blogelator
  class Post < ActiveRecord::Base
    attr_accessor :custom_summary
    
    has_many :tags
    belongs_to :author, class_name: Blogelator.user_class
    
    before_save :parse_markdown, :set_slug, :set_summary
    
    scope :published,   -> { where("published_at IS NOT NULL").order("published_at DESC") }
    scope :unpublished, -> { where("published_at IS NULL").order("created_at DESC") }
    
    validates_presence_of :title
    
    def active_model_serializer
      Blogelator::PostSerializer
    end
    
    def published?
      !self.published_at.nil?
    end
    
    def to_param
      self.slug
    end
    
  private
  
    def markdown
      @markdown ||= Redcarpet::Markdown.new(Blogelator::HTMLRenderer, {
        autolink: true,
        disable_indented_code_blocks: true,
        fenced_code_blocks: true,
        space_after_headers: true
      })
    end
    
    def parse_markdown
      self.body_html = markdown.render(self.body_markdown)
    end
    
    def set_summary
      if @custom_summary.blank?
        summary_text = self.body_markdown.split("\n\n").first.to_s.first(300).strip
        summary_text += "..." if self.body_markdown.length > 300
        summary_text = markdown.render(summary_text).to_s
        self.summary = summary_text.gsub("<p>", "").gsub("</p>", "")
      else
        self.summary = markdown.render(@custom_summary)
      end
    end
    
    def set_slug
      if self.published_at && self.slug.nil?
        self.slug = self.title.parameterize
        existing_slug_count = self.class.where(slug: self.slug).count
        if existing_slug_count > 0
          self.slug = self.slug + "-#{existing_slug_count}"
        end
      end
    end
  end
end
