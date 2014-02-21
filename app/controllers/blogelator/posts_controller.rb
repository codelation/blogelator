require_dependency "blogelator/application_controller"

module Blogelator
  class PostsController < ApplicationController
    before_action :set_post, only: [:show]
    
    # GET /
    def index
      @posts = Post.all
    end
    
    # GET /post-title
    def show
    end
    
  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
  end
end
