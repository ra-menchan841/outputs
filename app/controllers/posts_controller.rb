class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def new
    @post = Post.new
    @posts = Post.where(user_id: current_user.id).count if user_signed_in?
  end

  def create
    if user_signed_in?
      Post.create(post_params)
      redirect_to root_path
      flash[:noteice] = "アウトプットしてえらい！"
    else
      redirect_to root_path, alert: "ログインしてね"
    end
  end

  def show
    @posts = Post.where(user_id: current_user.id)
    @post = Post.find(params[:id])
    @title = @post.title
    @content = @post.content
  end

  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end
end
