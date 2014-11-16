require 'spec_helper'

describe Post do
  let(:post) { create(:post) }

  it { expect(post).to respond_to(:title) }
  it { expect(post).to respond_to(:content) }

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
end
