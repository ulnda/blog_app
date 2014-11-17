require 'spec_helper'

describe Post do
  let(:post) { create(:post) }

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
end
