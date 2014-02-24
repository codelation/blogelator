module Blogelator
  module PostsHelper
    include LocalTimeHelper
    
    def body_class
      @body_class ||= "default"
      body_class = "blogelator"
      body_class += " " + controller.controller_name
      body_class += " " + controller.action_name
      body_class += " " + @body_class
      body_class
    end
    
    def page_title
      page = @title
      if page
        "#{page} • #{site_title}"
      else
        site_title
      end
    end
    
    def site_title
      Blogelator::Config.site_name || "Blogelator"
    end
    
  end
end
