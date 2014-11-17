require 'spec_helper'

describe User do
  let(:user) { create(:user) }

  it { expect(user).to respond_to(:name) }

  it { expect(user).to respond_to(:posts) }

  it { expect(user).to be_valid }

  describe 'name validations' do
  	describe 'presence validation' do
  		before { user.name = nil }
  		it { expect(user).not_to be_valid }
  	end
  end
end
