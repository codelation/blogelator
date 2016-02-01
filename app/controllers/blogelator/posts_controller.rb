module Blogelator
  class PostsController < ApplicationController
    layout "blogelator"
    PER_PAGE = 5

    def index
      if try(:current_admin_user)
        @posts = Blogelator::Post.page(params[:page]).per(PER_PAGE)
      else
        @posts = Blogelator::Post.published.page(params[:page]).per(PER_PAGE)
      end
    end

    def show
      if try(:current_admin_user)
        @post = Blogelator::Post.find_by(slug: params[:id])
      else
        @post = Blogelator::Post.published.find_by(slug: params[:id])
      end
      fail ActionController::RoutingError.new("Not Found") unless @post
      @title = @post.title
    end
  end
end
