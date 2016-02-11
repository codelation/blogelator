module Blogelator
  class PostsController < ApplicationController
    layout "blog"
    before_action :set_tag, :set_posts, only: [:index]
    before_action :set_post, only: [:show]
    PER_PAGE = 5

    def index
    end

    def show
      @title = @post.title
    end

  private

    def all_posts
      Blogelator::Post.page(params[:page]).per(PER_PAGE)
    end

    def posts
      try(:current_admin_user) ? all_posts : published_posts
    end

    def published_posts
      Blogelator::Post.published.page(params[:page]).per(PER_PAGE)
    end

    def posts_with_tag
      if try(:current_admin_user)
        all_posts.joins(:tags).where("blogelator_tags.id = ?", @tag.id)
      else
        published_posts.joins(:tags).where("blogelator_tags.id = ?", @tag.id)
      end
    end

    def set_post
      if try(:current_admin_user)
        @post = Blogelator::Post.includes(:author).find_by(slug: params[:id])
      else
        @post = Blogelator::Post.includes(:author).published.find_by(slug: params[:id])
      end
      fail ActionController::RoutingError.new("Not Found") unless @post
    end

    def set_posts
      @posts = params[:tag_id] ? posts_with_tag : posts
    end

    def set_tag
      return unless params[:tag_id]
      @tag = Blogelator::Tag.find_by(slug: params[:tag_id])
      fail ActionController::RoutingError.new("Not Found") unless @tag
    end
  end
end
