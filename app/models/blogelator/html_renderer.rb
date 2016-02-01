module Blogelator
  # Custom Markdown to HTML Rendered that includes:
  #   - SmartyPants: Converts ASCII dashes, quotes, and ellipses to their HTML entity equivalents.
  #   - Pygments: Adds code highlighting
  class HTMLRenderer < Redcarpet::Render::HTML
    include Redcarpet::Render::SmartyPants

    def block_code(code, language)
      result = Pygments.highlight(code, lexer: language)
      result
    end
  end
end
