class PostsController < ApplicationController
    def index
     @posts = Post.all
    end

    def create
      post = Post.new(params[:post].permit(:title, :content))
      if post.save
        flash[:notice] = 'Post created successfully'
        @post = Post.new(params[:post].permit(:title, :content))
      if @post.save
        redirect_to posts_path
      else
        flash.now[:alert] = 'Post create failed'
        render :new, status: :unprocessable_entity
      end
    end

    def show
      @post = Post.find(params[:id])
    end

    def edit
      @post = Post.find(params[:id])
    end
  end
end