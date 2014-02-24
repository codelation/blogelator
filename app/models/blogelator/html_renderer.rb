module Blogelator
  class HTMLRenderer < Redcarpet::Render::HTML
    include Redcarpet::Render::SmartyPants
    
    def block_code(code, language)
      result = Pygments.highlight(code, lexer: language)
      result
    end
  end
end
