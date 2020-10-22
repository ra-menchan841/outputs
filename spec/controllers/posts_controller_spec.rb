require 'rails_helper'

describe PostsController, type: :controller do

  describe '#index' do
    context "ログインしている場合" do
      let(:user) { create(:user) }

      before do
        login user
      end

      it "index.html.hamlに遷移すること" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "ログインしていない場合" do

      it "ログイン画面に遷移すること" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'new' do
    context "ログインしている場合" do
      let(:user) { create(:user) }

      before do
        login user
      end

      it "@postに期待した値が入っていること" do
        get :new
        expect(assigns(:post)).to be_a_new(Post)
      end
    end

    context "ログインしていない場合" do

      it "ログイン画面に遷移すること" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#create' do

    let(:user) { create(:user) }
    let(:params) { {post: attributes_for(:post)} }

    context "ログインしている場合" do

      before do
        login user
      end

      subject {
        post :create,
        params: params
      }
      
      it 'postを保存すること' do
        expect{ subject }.to change(Post, :count).by(1)
      end

      it '記事一覧へリダイレクトすること' do
        subject
        expect(response).to redirect_to(posts_path)
      end
    end

    context "ログインしていない場合" do
      it "ログイン画面に遷移すること" do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#show' do

    let(:user) { create(:user) }
    let(:post) { create(:post) }

    context "ログインしている場合" do

      before do
        login user
      end

      it "@postに期待した値が入っていること" do
        get :show, params: { id: post }
        expect(assigns(:post)).to eq post
      end

      it "show.html.hamlに遷移すること" do
        get :show, params: { id: post }
        expect(response).to render_template :show
      end
    end

    context "ログインしていない場合" do
      it "ログイン画面に遷移すること" do
        get :show, params: { id: post }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#edit' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    context "ログインしている場合" do

      before do
        login user
      end

      it "@postに期待した値が入っていること" do
        get :edit, params: { id: post }
        expect(assigns(:post)).to eq post
      end

      it "edit.html.hamlに遷移すること" do
        get :edit, params: { id: post }
        expect(response).to render_template :edit
      end
    end

    context "ログインしていない場合" do
      it "ログイン画面に遷移すること" do
        get :edit, params: { id: post }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#update' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    context "ログインしている場合" do

      before do
        login user
      end

      it 'postを更新すること' do
        new_params = { title: "新しいタイトル", content: "新しい記事" }
        patch :update, params: { id: post, post: new_params }
        expect(post.reload.title).to eq "新しいタイトル"
        expect(post.reload.content).to eq "新しい記事"
      end

    end

    context "ログインしていない場合" do
      it "ログイン画面に遷移すること" do
        patch :update, params: { id: post }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#destroy' do

    let(:user) { create(:user) }
    let(:post) { create(:post) }

    context "ログインしている場合" do

      before do
        login user
      end

        it "データが削除されること" do
          post = create(:post)
          expect{ post.destroy }.to change(Post, :count).by(-1)
        end
      
        it "記事一覧へ遷移すること" do
          delete :destroy, params: { id: post }
          expect(response).to redirect_to(posts_path)
        end
    end

    context "ログインしていない場合" do
      it "ログイン画面に遷移すること" do
        delete :destroy, params: { id: post }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end