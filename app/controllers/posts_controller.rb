class PostsController < ApplicationController
  before_action :move_to_signin, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :get_post, except: [:index, :new, :create]
  before_action :user_post_all, only: [:index, :show, :edit]

  # 記事タイトル一覧表示
  def index
  end

  # 新規投稿ページ
  def new
    user_post_all if user_signed_in?
    @post = Post.new
    @btn = "保存"
  end

  # 新規投稿機能
  def create
    @post = Post.create(post_params)
    comment = Comment.pluck(:name).sample(8).first
    redirect_to posts_path, notice: " #{comment} "
  end

  # 記事タイトル一覧表示、および詳細表示
  def show
  end

  # 記事編集画面
  def edit
    @btn = "更新"
  end

  # 記事更新機能
  def update
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  # 記事削除機能
  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private

  # ログインされていなければログインページへ遷移
  def move_to_signin
    redirect_to new_user_session_path unless user_signed_in?
  end

  # 特定の記事情報を取得
  def get_post
    @post = Post.find(params[:id])
  end

  # ユーザーの記事情報を取得
  def user_post_all
    @posts = Post.where(user_id: current_user.id).order(updated_at: :desc)
  end

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end
end
