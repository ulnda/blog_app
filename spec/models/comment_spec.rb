require 'spec_helper'

describe Comment do
  let(:comment) { create(:comment) }

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
end
