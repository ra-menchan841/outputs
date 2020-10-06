class PostsController < ApplicationController
  # before_action :move_to_root, expect: [:new]
  before_action :user_post_all, only: [:index, :show, :edit]

  def index
  end

  def new
    user_post_all if user_signed_in?
    if current_user.memo.nil?
      @post = Post.new
      @memo = Memo.new
    else
      @post = Post.new
      @memo = Memo.where(user_id: current_user.id)
    end
  end

  def create
    @post = Post.create(post_params)
    comment = Comment.pluck(:name).sample(8).first
    if @post.save
      redirect_to posts_path, notice: " #{comment} "
    else
      redirect_to posts_path, notice: " 保存に失敗しちゃった、、、＞＜ "
    end
  end

  def show
    @post = Post.find(params[:id])
    @title = @post.title
    @content = @post.content
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  def move_to_root
    redirect_to root_path unless user_signed_in?
  end

  def user_post_all
    @posts = Post.where(user_id: current_user.id).order(updated_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end
end
