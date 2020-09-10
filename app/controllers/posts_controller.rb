class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.where(user_id: current_user.id).count
  end

  def create
    if user_signed_in?
      Post.create(post_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end
end
