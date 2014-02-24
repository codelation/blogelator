module Blogelator
  class HTMLRenderer < Redcarpet::Render::HTML
    include Redcarpet::Render::SmartyPants
    
    def block_code(code, language)
      puts code
      result = Pygments.highlight(code, lexer: language)
      puts result
      result
    end
  end
end
