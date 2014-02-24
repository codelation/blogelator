require_dependency "blogelator/application_controller"

module Blogelator
  class PostsController < ApplicationController
    before_action :set_post, only: [:show]
    
    # GET /
    def index
      @posts = Blogelator::Post.published
    end
    
    # GET /post-title
    def show
      @title = @post.title
    end
    
  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Blogelator::Post.find_by_slug(params[:id])
    end
  end
end
