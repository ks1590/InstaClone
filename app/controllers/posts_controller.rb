class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_paramas)
  end
  
  def show
  end
  
  private
  def post_paramas
    params.require(:post).permit(:image, :image_cache)
  end
  
end
