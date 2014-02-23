module Blogelator
  class Post < ActiveRecord::Base
    has_many :tags
    belongs_to :author, class_name: Blogelator::Config.user_class
    
    before_save :parse_markdown
    
    def active_model_serializer
      Blogelator::PostSerializer
    end
    
    def parse_markdown
      markdown = Redcarpet::Markdown.new(Blogelator::HTMLRenderer, {
        autolink: true,
        disable_indented_code_blocks: true,
        fenced_code_blocks: true,
        space_after_headers: true
      })
      self.body_html = markdown.render(self.body_markdown)
    end
  end
end
