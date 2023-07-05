class PostsController < ApplicationController
    def index
     @posts = Post.all
    end
    def create
      post = Post.new(params[:post].permit(:title, :content))
      if post.save
        redirect_to posts_path
      end
    end
end