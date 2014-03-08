require_dependency "blogelator/application_controller"

module Blogelator
  class PostsController < ApplicationController
    before_action :set_post, only: [:show]
    
    # GET /
    def index
      page = params[:page] ? params[:page].to_i : 1
      per_page = Blogelator.posts_per_page
      
      @posts = Blogelator::Post.published.page(page).per(per_page)
    end
    
    # GET /post-title
    def show
      @title = @post.title
    end
    
  private
  
    def set_next_post
      @next_post = Blogelator::Post.where("published_at > ?", @post.published_at).order("published_at ASC").first
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Blogelator::Post.find_by_slug(params[:id])
      set_previous_post
      set_next_post
    end
    
    def set_previous_post
      @previous_post = Blogelator::Post.where("published_at < ?", @post.published_at).order("published_at DESC").first
    end
  end
end
