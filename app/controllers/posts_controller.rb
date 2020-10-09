class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_paramas)
    if @post.save
      redirect_to 
    end
  end
  
  def show
  end
  
  private
  def post_paramas
    params.require(:post).permit(:image, :image_cache)
  end
  
end
