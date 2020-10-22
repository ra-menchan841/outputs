require 'rails_helper'

describe PostsController, type: :controller do

  describe 'GET #index' do

  let(:user) { create(:user) }

    context "ログインしている場合" do

      it "@postsに正しい値が入っていること" do
        posts = create_list(:post, 3)
        login user
        get :index
        expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at })
      end

      it "index.html.hamlに遷移すること" do
        login user
        get :index
        expect(response).to render_template :index
      end
    end

    context "ログインしていない場合" do

      # it "index.html.hamlに遷移すること" do
      #   get :index
      #   expect(response).to render_template :index
      # end
    end

  end

end