require 'spec_helper'

describe Post do
  let!(:post)    { create(:post) }
  let!(:comment) { create(:comment, post: post, user: post.user) }

  it { expect(post).to respond_to(:title) }
  it { expect(post).to respond_to(:content) }

  it { expect(post).to respond_to(:user) }
  it { expect(post).to respond_to(:user_id) }

  it { expect(post).to respond_to(:comments) }

  it { expect(post).to be_valid }

  describe 'validations' do
    describe 'title validations' do
    	describe 'presence validation' do
    		before { post.title = nil }
    		it { expect(post).not_to be_valid }
    	end
    end

    describe 'content validations' do
    	describe 'presence validation' do
    		before { post.content = nil }
    		it { expect(post).not_to be_valid }
    	end
    end

    describe 'user validations' do
      describe 'presence validation' do
        before { post.user = nil }
        it { expect(post).not_to be_valid }
      end
    end
  end

  describe 'associations' do
    describe 'comments association destroy' do
      it { expect{ post.destroy }.to change(Post, :count).by(-1) }
      it { expect{ post.destroy }.to change(Comment, :count).by(-1) }
    end    
  end

  describe 'scops' do
    describe 'order scope' do
      let!(:post2) { create(:post, user: post.user) }

      it('default order') { expect(Post.all.first).to eq(post) } 
      it('reverse order') { expect(Post.all.reverse_order.first).to eq(post2) }
    end
  end
end
