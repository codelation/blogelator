module Blogelator
  class HTMLRenderer < Redcarpet::Render::HTML
    include Redcarpet::Render::SmartyPants
    
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end
end
