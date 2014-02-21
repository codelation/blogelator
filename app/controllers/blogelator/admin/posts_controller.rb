require_dependency "blogelator/admin/application_controller"

module Blogelator
  module Admin
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :edit, :update, :destroy]

      # GET /admin/posts
      def index
        @posts = Blogelator::Post.all
        authorize! :read, @posts
      end

      # GET /admin/posts/1
      def show
        authorize! :read, @post
      end

      # GET /admin/posts/new
      def new
        @post = Blogelator::Post.new
        authorize! :create, Blogelator::Post
      end

      # GET /admin/posts/1/edit
      def edit
        authorize! :update, @post
      end

      # POST /admin/posts
      def create
        @post = Blogelator::Post.new(post_params)
        authorize! :create, @post

        if @post.save
          redirect_to admin_post_url(@post), notice: 'Post was successfully created.'
        else
          render action: 'new'
        end
      end

      # PATCH/PUT /admin/posts/1
      def update
        authorize! :update, @post
        if @post.update(post_params)
          redirect_to admin_post_url(@post), notice: 'Post was successfully updated.'
        else
          render action: 'edit'
        end
      end

      # DELETE /admin/posts/1
      def destroy
        authorize! :destroy, @post
        @post.destroy
        redirect_to admin_posts_url, notice: 'Post was successfully destroyed.'
      end

    private
    
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
