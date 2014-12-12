require 'spec_helper'

describe Comment do
  let!(:post)    { create(:post) }
  let!(:comment) { create(:comment, post: post, user: post.user) }

  it { expect(comment).to respond_to(:content) }

  it { expect(comment).to respond_to(:user) }
  it { expect(comment).to respond_to(:user_id) }

  it { expect(comment).to respond_to(:post) }
  it { expect(comment).to respond_to(:post_id) }

  it { expect(comment).to be_valid }

  describe 'content validations' do
  	describe 'presence validation' do
  		before { comment.content = nil }
  		it { expect(comment).not_to be_valid }
  	end
  end

  describe 'post validations' do
  	describe 'presence validation' do
  		before { comment.post = nil }
  		it { expect(comment).not_to be_valid }
  	end
  end

  describe 'user validations' do
    describe 'presence validation' do
      before { comment.user = nil }
      it { expect(comment).not_to be_valid }
    end
  end

  describe 'order scope' do
    let!(:comment2) { create(:comment, post: post, user: post.user) }

    it('default order') { expect(Comment.all.first).to eq(comment) } 
    it('reverse order') { expect(Comment.all.reverse_order.first).to eq(comment2) }
  end
end
