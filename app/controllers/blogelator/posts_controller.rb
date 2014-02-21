require_dependency "blogelator/application_controller"

module Blogelator
  class PostsController < ApplicationController
    def index
      @posts = Post.all
    end
  end
end
