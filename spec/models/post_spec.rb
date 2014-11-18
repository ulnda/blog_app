require 'spec_helper'

describe Post do
  let!(:post) { create(:post) }

  it { expect(post).to respond_to(:title) }
  it { expect(post).to respond_to(:content) }

  it { expect(post).to respond_to(:user) }
  it { expect(post).to respond_to(:user_id) }

  it { expect(post).to respond_to(:comments) }

  it { expect(post).to be_valid }

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

  describe 'order scope' do
    let!(:post2) { create(:post) }

    it('default order') { expect(Post.all.first).to eq(post) } 
    it('reverse order') { expect(Post.all.reverse_order.first).to eq(post2) }
  end
end
