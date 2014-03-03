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
        @title = @post.title
        respond_with @post
      end

      # POST /admin/posts
      def create
        @post = Blogelator::Post.new(post_params)
        
        if @post.save
          respond_with @post, status: :created
        else
          respond_with @post, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /admin/posts/1
      def update
        if @post.update(post_params)
          head :no_content
        else
          respond_with @post, status: :unprocessable_entity
        end
      end

      # DELETE /admin/posts/1
      def destroy
        @post.destroy
        head :no_content
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
