require 'spec_helper'

describe User do
  let!(:user)    { create(:user) }
  let!(:comment) { create(:comment, user: user, post: create(:post, user: user)) }

  it { expect(user).to respond_to(:name) }

  it { expect(user).to respond_to(:posts) }
  it { expect(user).to respond_to(:comments) }

  it { expect(user).to be_valid }

  describe 'validations' do
    describe 'name validations' do
    	describe 'presence validation' do
    		before { user.name = nil }
    		it { expect(user).not_to be_valid }
    	end
    end
  end

  describe 'associations' do
    describe 'comments association destroy' do
      it { expect{ user.destroy }.to change(Comment, :count).by(-1) }
    end
  end

  describe 'associations' do
    describe 'posts association destroy' do
      it { expect{ user.destroy }.to change(Post, :count).by(-1) }
    end
  end
end
