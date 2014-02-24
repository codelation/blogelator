require_dependency "blogelator/admin/application_controller"

module Blogelator
  module Admin
    class PostsController < ApplicationController
      before_action :authorize_user
      before_action :set_post, only: [:show, :edit, :update, :destroy]
      respond_to :json
      respond_to :html, only: [:index]

      # GET /admin/posts
      def index
        @posts = Blogelator::Post.all
        respond_with @posts
      end

      # GET /admin/posts/1
      def show
        respond_with @post
      end

      # GET /admin/posts/new
      def new
        @post = Blogelator::Post.new
      end

      # GET /admin/posts/1/edit
      def edit
      end

      # POST /admin/posts
      def create
        @post = Blogelator::Post.new(post_params)

        if @post.save
          redirect_to admin_post_url(@post), notice: 'Post was successfully created.'
        else
          render action: 'new'
        end
      end

      # PATCH/PUT /admin/posts/1
      def update
        if @post.update(post_params)
          redirect_to admin_post_url(@post), notice: 'Post was successfully updated.'
        else
          render action: 'edit'
        end
      end

      # DELETE /admin/posts/1
      def destroy
        @post.destroy
        redirect_to admin_posts_url, notice: 'Post was successfully destroyed.'
      end

    private
    
    def authorize_user
      authorize! :manage, Blogelator::Post
    end
    
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Blogelator::Post.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:title, :body_markdown)
      end
    end
  end
end
