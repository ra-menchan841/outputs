require 'rails_helper'

describe Post, type: :model do
  describe '#create' do
  
      # 1
      it "titleとcontentがあれば登録できること" do
        post = build(:post)
        expect(post).to be_valid
      end

      # 2
      it "titleがなくても登録できること" do
        post = build(:post, title: nil)
        expect(post).to be_valid
      end

      # 3
      it "contentがなくても登録できること" do
        post = build(:post, content: nil)
        expect(post).to be_valid
      end

      # 4
      it "titleとcontentが両方なくても登録できること" do
        post = build(:post, title: nil, content: nil)
        expect(post).to be_valid
      end
  end
end