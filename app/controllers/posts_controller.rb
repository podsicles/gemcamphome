class PostsController < ApplicationController
    def index
     @posts = Post.all
    end

    def create
      post = Post.new(params[:post].permit(:title, :content))
      if post.save
        flash[:notice] = 'Post created successfully'
        @post = Post.new(params[:post].permit(:title, :content))
        redirect_to posts_path
      else
        flash.now[:alert] = 'Post create failed'
        render :new, status: :unprocessable_entity
      end
    end

    def show
      @post = Post.find(params[:id])
    end

    def new
      @post = Post.new
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      if @post.update(params.require(:post).permit(:title, :content))
        flash[:notice] = 'Post updated successfully'
        redirect_to posts_path
      else
        flash.now[:alert] = 'Post update failed'
        render :edit, status: :unprocessable_entity
      end
    end

     def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:notice] = 'Post destroyed successfully'
        redirect_to posts_path
      end
end